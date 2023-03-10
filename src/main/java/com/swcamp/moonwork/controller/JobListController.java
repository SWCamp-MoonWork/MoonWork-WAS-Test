package com.swcamp.moonwork.controller;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.sql.SQLException;
import java.text.ParseException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Base64;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.sql.Blob;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialException;

import org.quartz.CronExpression;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import com.swcamp.moonwork.model.dto.JobDTO;
import com.swcamp.moonwork.model.dto.JobDetailDTO;
import com.swcamp.moonwork.model.dto.RunsDTO;
import com.swcamp.moonwork.model.dto.ScheduleDTO;

import net.sf.json.JSONObject;

@Controller
@PropertySource(value = "classpath:/global.properties")
public class JobListController {
	@Value("${serverip_job}")
	private String ServerIp_job;
	
	@Value("${serverip_run}")
	private String ServerIp_run;
	
	@Value("${serverip_host}")
	private String ServerIp_host;
	
	@Value("${serverip_user}")
	private String ServerIp_user;
	
	private final ObjectMapper objectMapper = new ObjectMapper();
	RestTemplate restTemplate = new RestTemplate();
	HttpHeaders headers = new HttpHeaders();
	JSONObject jobJsonObject = new JSONObject();
	
	
	// Job List ?????????
	@RequestMapping(value = "/joblist.do", method = RequestMethod.GET)
	public String joblist(Locale locale, Model model) {
		
		//System.out.println(ServerIp);
		
		 LocalTime now = LocalTime.now();
		int TotalJobsCount = 0;
		int RunningCount = 0;
		int ActivateCount = 0;
		
		ResponseEntity<List<JobDTO>> result = restTemplate.exchange(ServerIp_job + "/joblist_username", HttpMethod.GET, null,
				new ParameterizedTypeReference<List<JobDTO>>() {
				});
		List<JobDTO> list = result.getBody();
		System.out.println(now);
		System.out.println("response (/joblist_username)= " + result);
		
    	//?????? ??????
		headers.add("accept", "application/json");
		headers.setContentType(MediaType.APPLICATION_JSON);
		HttpEntity<?> request = new HttpEntity<>(null, headers);
		
		// ??? ????????? ?????? ????????????
		HttpEntity<String> res_TotalJobsCount = restTemplate.exchange(ServerIp_job + "/totalnum" , HttpMethod.GET, request, String.class);
		System.out.println("response (/totalnum) = " + res_TotalJobsCount);
		HttpEntity<String> res_RunningCount = restTemplate.exchange(ServerIp_job + "/countrunningjob" , HttpMethod.GET, request, String.class);
		System.out.println("response (/countrunningjob) = " + res_RunningCount);
		HttpEntity<String> res_ActivateCount = restTemplate.exchange(ServerIp_job + "/countusingjob" , HttpMethod.GET, request, String.class);
		System.out.println("response (/countusingjob) = " + res_ActivateCount);
		
		try {
			// ????????? COUNT(*) ??? ??????
			// objectMapper.readValue??? ???????????? API?????? ???????????? JSON ????????? Body??? Map<String, Integer>???????????? ????????????
			// .get() ???????????? ???????????? ??? ????????????
			Map<String, Integer> map_TotalJobsCount = objectMapper.readValue(res_TotalJobsCount.getBody(), Map.class);
			TotalJobsCount = map_TotalJobsCount.get("COUNT(*)");
			Map<String, Integer> map_RunningCount = objectMapper.readValue(res_RunningCount.getBody(), Map.class);
			RunningCount = map_RunningCount.get("COUNT(*)");
			Map<String, Integer> map_ActivateCount = objectMapper.readValue(res_ActivateCount.getBody(), Map.class);
			ActivateCount = map_ActivateCount.get("COUNT(*)");


			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// model??? ?????? ??? jsp??? ??????
		model.addAttribute("TotalJobsCount", TotalJobsCount);
		model.addAttribute("RunningCount", RunningCount);
		model.addAttribute("ActivateCount", ActivateCount);

		model.addAttribute("jobs", list);

		return "joblist/JobList";
	}
	
	// Job Refresh
	@RequestMapping(value = "/jobrefresh.do", method = RequestMethod.GET)
	public String jobrefresh(Locale locale, Model model) {

		ResponseEntity<List<JobDTO>> result = restTemplate.exchange(ServerIp_job + "/joblist_username", HttpMethod.GET, null,
				new ParameterizedTypeReference<List<JobDTO>>() {
				});
		
		
		List<JobDTO> list = result.getBody();

		model.addAttribute("jobs", list);

		return "Success";
	}
	
	// ?????? Id??? ?????? Job List
	@ResponseBody
	@RequestMapping(value = "/selectjobid.do", method = RequestMethod.GET)
	public ResponseEntity<JobDTO> selectjobid(Locale locale, Model model, @RequestParam(value="jobId") String jobId) {

		System.out.println(jobId);
		ResponseEntity<JobDTO> result = restTemplate.exchange(ServerIp_job + "/" + jobId , HttpMethod.GET, null,
				new ParameterizedTypeReference<JobDTO>() {
				});
		System.out.println("response (/GetJobAllInfo)= " + result);

		return result;
	}
	
	// Job ????????????
	// json ????????? ????????????????????? ????????? ?????? ????????? ResponseEntity<JobDTO> ??????(?)
	@ResponseBody
	@RequestMapping(value = "/jobdetails.do", method = RequestMethod.GET)
	public ResponseEntity<JobDetailDTO> jobDetail(Locale locale, Model model, @RequestParam(value="jobId") String jobId) {
		
		//String resId = param.get("jobId").toString();
		System.out.println(jobId);
		ResponseEntity<JobDetailDTO> result = restTemplate.exchange(ServerIp_job + "/" + jobId + "/GetJob_UserSchedule", HttpMethod.GET, null,
				new ParameterizedTypeReference<JobDetailDTO>() {
				});
		System.out.println("response (/GetJob_UserSchedule)= " + result);

		return result;
	}
	

    
    public static String byteArrayToHexaString(byte[] bytes) {
        StringBuilder builder = new StringBuilder();
    		
        for (byte data : bytes) {
            builder.append(String.format("%02X ", data));
        }
    		
        return builder.toString();
    }

	// Job ?????? ????????????
	@RequestMapping(value = "/createjob.do", method = RequestMethod.POST)
	public String jobAdd(HttpServletRequest httpRequest,Locale locale, Model model, @RequestParam("jobName") String jobName,
			@RequestParam("workflowName") String workflowName, @RequestParam("note") String note,
			@RequestParam(value = "workflowFile",required = false) MultipartFile[] uploadFile) throws IOException, SerialException, SQLException {
		
		HttpSession session = httpRequest.getSession();

		byte[] content = null;
		for(MultipartFile multipartFile : uploadFile) {
			System.out.println("================uploadFile Info=================");
			System.out.println("1. ?????? ???????????? ?????? : " + multipartFile.getName());
			System.out.println("2. ?????? ?????? ?????? : " + multipartFile.getOriginalFilename());
			System.out.println("3. ????????? ?????? : " + multipartFile.getContentType());
			System.out.println("4. ?????? : " + multipartFile.getSize());
			System.out.println("5. ?????? ??????(???????????????) : " + multipartFile.getBytes());
			System.out.println("6. ??????????????????");

			content = multipartFile.getBytes();
			System.out.println("================================================");
		}
		

		System.out.println("?????? ????????? ??????" + content);
		
		String encoded = Base64.getEncoder().encodeToString(content);

		restTemplate = new RestTemplate();
		headers.setContentType(MediaType.APPLICATION_JSON);
		
		//MultiValuewMap ??? List????????? ?????????
		JSONObject body = new JSONObject();
		body.put("jobName", jobName);
		body.put("workflowName", workflowName);
		body.put("note", note);
		body.put("userId", session.getAttribute("userId"));
		body.put("workflowBlob", encoded);

		
		System.out.println("jsonobject: " + body.get("workflowBlob"));


		HttpEntity<?> request = new HttpEntity<>(body, headers);
		System.out.println("??????" + headers);
		System.out.println("========HttpEntity Request ???===========");
		System.out.println("request : "+request);

		HttpEntity<String> response = restTemplate.postForEntity(ServerIp_job + "/create", request, String.class);
		objectMapper.configure(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT, true);
		System.out.println("response (/create)= " + response);
		
		return "redirect:joblist.do";

	}
	
	// Job ?????? ????????????
	@RequestMapping(value = "/editjob.do", method = RequestMethod.POST)
	public String jobEdit(@RequestParam("jobId") String jobId,@RequestParam("jobName") String jobName,
			@RequestParam("workflowName") String workflowName, @RequestParam("note") String note,
			@RequestParam(value = "workflowFile",required = false) MultipartFile[] uploadFile,
			@RequestParam(value = "workflowBlob",required = false) byte[] workflowBlob,
			@RequestParam(value = "checkfile", required=false) String checkfile,
			@RequestParam(value = "checkIsUse" , required=false) String checkIsUse) throws IOException{

		byte[] content = null;
		for(MultipartFile multipartFile : uploadFile) {
			content = multipartFile.getBytes();
		}

		restTemplate = new RestTemplate();
		headers.setContentType(MediaType.APPLICATION_JSON);
		
		JSONObject body = new JSONObject();
		
		
		// checkIsUse??? null ?????? view????????? IsUse??? ????????? ?????? ???????????? ???????????? isUse??? false??? ????????????.
		if(checkIsUse == null) {
			body.put("isUse", false);
		}
		else{
			body.put("isUse", true);
		}

		
		// checkfile??? checked ?????? view????????? ?????? ????????? ?????? ???????????? ???????????? workflowBlob??? ????????? ?????? ????????????.
		if(checkfile.equals("checked")) {
			body.put("jobId", jobId);
			body.put("jobName", jobName);
			body.put("workflowName", workflowName);
			body.put("note", note);
			body.put("workflowBlob", content.toString());
		}
		// ????????????, hidden??? ????????? ?????? workflowBlob?????? ?????? ??????.
		else {
			body.put("jobId", jobId);
			body.put("jobName", jobName);
			body.put("workflowName", workflowName);
			body.put("note", note);
			body.put("workflowBlob", workflowBlob.toString());
		}

		HttpEntity<?> request = new HttpEntity<>(body, headers);
		System.out.println("??????" + headers);
		System.out.println("========HttpEntity Request ???===========");
		System.out.println("request : "+request);

		HttpEntity<String> response = restTemplate.exchange(ServerIp_job + "/update", HttpMethod.PUT, request, String.class);
		System.out.println("response (/update) = " + response);
		return "redirect:joblist.do";
	}
	
	// Job ?????? ????????????
	@RequestMapping(value = "/deletejob.do", method = RequestMethod.POST)
	public String jobDelete(@RequestBody Map<String, Object> param, HttpServletRequest hsrequest) throws IOException{

		String re = param.get("jobId").toString();
		System.out.println("????????? jobId : "+re);
		restTemplate = new RestTemplate();
		headers.add("accept", "application/json");
		headers.setContentType(MediaType.APPLICATION_JSON);
		
		JSONObject body = new JSONObject();
		body.put("JobId", re);
		
		HttpEntity<?> request = new HttpEntity<>(body, headers);
		HttpEntity<String> response = restTemplate.exchange(ServerIp_job + "/delete" + "/" + re, HttpMethod.DELETE, request, String.class);
		System.out.println("response (/delete) = " + response);
		
		
		return "redirect:joblist.do";
	}
	
	// ????????? ????????? ??????
	/*
	 * ??? ????????? Cron ?????? ????????? ????????? ???????????? isValidExpression??????. ??????????????? String, ???????????? boolean??????.
	 * isValidExpression??? ????????? ?????? 
	 * CronExpression??? ??????????????? ??????????????? String??? ???????????? ?????????, 
	 * ??? ??? Exception??? ???????????? false, ????????? ???????????? true??? ???????????? ??????. 
	 */
	//??????: https://povia.tistory.com/9
	@ResponseBody
	@RequestMapping(value = "/cronExpression.do", method = RequestMethod.GET)
	public boolean isValidExpression(@RequestParam(value="expression")String expression){
	    boolean result = false;
	    if(CronExpression.isValidExpression(expression)){
	        try {
	            	result = true;
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	    return result;
	}

	
	// Schedule ?????? ????????????
	@RequestMapping(value = "/createschedule.do", method = RequestMethod.POST)
	public String scheduleAdd(HttpServletRequest httpRequest, @RequestParam(value="jobId")String jobId, @RequestParam(value="scheduleName")String scheduleName, 
			@RequestParam(value="scheduleType")boolean scheduleType, @RequestParam(value="startDate") @DateTimeFormat(iso = ISO.DATE_TIME)LocalDateTime startDate, 
			 @RequestParam(value="endDate")@DateTimeFormat(iso = ISO.DATE_TIME)LocalDateTime endDate, @RequestParam(value="CronExpression")String CronExpression) {
		LocalDateTime currentDate = LocalDateTime.now(); 
		HttpSession session = httpRequest.getSession();
		System.out.println("???");
		if(scheduleType == true) {
			
			restTemplate = new RestTemplate();
			headers.add("accept", "application/json");
			headers.setContentType(MediaType.APPLICATION_JSON);
			
			JSONObject body = new JSONObject();
			body.put("jobId", jobId);
			body.put("scheduleName", scheduleName);
			body.put("scheduleType", scheduleType);
			body.put("oneTimeOccurDT", null);
			body.put("scheduleStartDT", startDate.toString());
			body.put("scheduleEndDT", endDate.toString());
			body.put("cronExpression", CronExpression);
			body.put("userId", session.getAttribute("userId"));
			body.put("saveDate", currentDate.toString());
			
			HttpEntity<?> request = new HttpEntity<>(body, headers);
			System.out.println(request);
			ResponseEntity<String> response = restTemplate.postForEntity(ServerIp_job + "/" + jobId + "/Schedule", request, String.class);
			System.out.println("response (Schedule ??????/Loop) = " + response);
		}
		else if(scheduleType == false){
			
			restTemplate = new RestTemplate();
			headers.add("accept", "application/json");
			headers.setContentType(MediaType.APPLICATION_JSON);
			
			JSONObject body = new JSONObject();
			body.put("jobId", jobId);
			body.put("scheduleName", scheduleName);
			body.put("scheduleType", scheduleType);
			body.put("oneTimeOccurDT", startDate.toString());
			body.put("scheduleStartDT", null);
			body.put("scheduleEndDT", null);
			body.put("cronExpression", null);
			body.put("userId", session.getAttribute("userId"));
			body.put("saveDate", currentDate.toString());
			
			HttpEntity<?> request = new HttpEntity<>(body, headers);
			ResponseEntity<String> response = restTemplate.postForEntity(ServerIp_job + "/" + jobId + "/Schedule", request, String.class);
			System.out.println("response (Schedule ??????/OneTime) = " + response);
		}
		else
			System.out.println("Fail");
		
		
		return "redirect:joblist.do";
	}
	
	// ?????? 20?????? Runs ????????? ????????????
	@ResponseBody
	@RequestMapping(value = "/GetLastTwentyRunsData.do", method = RequestMethod.GET)
	public List<RunsDTO> GetLastTwentyRunsData(@RequestParam(value="jobId") String jobId){
		
		
		ResponseEntity<List<RunsDTO>> result = restTemplate.exchange(ServerIp_run + "/" + jobId + "/getduration"  , HttpMethod.GET, null,
				new ParameterizedTypeReference<List<RunsDTO>>() {
				});
		
		List<RunsDTO> runslist = result.getBody();
		System.out.println("response (?????? 20?????? Runs ????????? ????????????) = " + result);
		
		return runslist;
	}
	
	

	// Job ????????? ????????????
	@ResponseBody
	@RequestMapping(value = "/getstate.do", method = RequestMethod.GET)
	public ResponseEntity<List<JobDTO>> GetStateJob(Locale locale, Model model) {

		ResponseEntity<List<JobDTO>> result = restTemplate.exchange(ServerIp_job + "/getstate"  , HttpMethod.GET, null,
				new ParameterizedTypeReference<List<JobDTO>>() {
				});
		//System.out.println("response (/getstate)= " + result);

		return result;
	}
	
	

	
	//??? ?????? ???????????? return list<jobDTO> 
	@ResponseBody
	@RequestMapping(value= "/getTotalJobList.do", method= RequestMethod.GET)
	public List<JobDTO> GetTotalJobCount(Model model) throws JsonParseException, JsonMappingException, IOException {
		
		ResponseEntity<List<JobDTO>> result = restTemplate.exchange(ServerIp_job + "/joblist_username", HttpMethod.GET, null,
				new ParameterizedTypeReference<List<JobDTO>>() {
				});
		
		List<JobDTO> list = result.getBody();
		
		
		
		return list;
	}
	
	
	//????????? ?????? 5??? ?????? ????????????
	@ResponseBody
	@RequestMapping(value= "/getRecentRuns.do", method= RequestMethod.GET)
	public List<RunsDTO> GetRecentRuns(Model model ,@RequestParam("getjobid") String jobid) throws JsonParseException, JsonMappingException, IOException {
		
		//String resId = param.get("jobId").toString();

		ResponseEntity<List<RunsDTO>> result = restTemplate.exchange(ServerIp_run + "/" + jobid + "/getrunrecord", HttpMethod.GET, null,
				new ParameterizedTypeReference<List<RunsDTO>>() {
				});
		
		List<RunsDTO> list = result.getBody();

		return list;

	}
	
	//RunId??? ?????? Run Result Data ????????????
	@ResponseBody
	@RequestMapping(value= "/getResultData.do", method= RequestMethod.GET)
	public RunsDTO GetResultData(Model model ,@RequestParam("RunId") String RunId) throws JsonParseException, JsonMappingException, IOException {
		
		//String resId = param.get("jobId").toString();

		ResponseEntity<RunsDTO> result = restTemplate.exchange(ServerIp_run + "/" + RunId , HttpMethod.GET, null,
				new ParameterizedTypeReference<RunsDTO>() {
				});
		
		RunsDTO rundto = result.getBody();

		return rundto;

	}

}
