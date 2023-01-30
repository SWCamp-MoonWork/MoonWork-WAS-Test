package com.swcamp.moonwork.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.text.ParseException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.quartz.CronExpression;
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

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.swcamp.moonwork.model.dto.JobDTO;
import com.swcamp.moonwork.model.dto.JobDetailDTO;
import com.swcamp.moonwork.model.dto.ScheduleDTO;

import net.sf.json.JSONObject;

@Controller
public class JobListController {
	private final String URL = "http://20.39.194.244:5000/v1/job";
	private final ObjectMapper objectMapper = new ObjectMapper();
	RestTemplate restTemplate = new RestTemplate();
	HttpHeaders headers = new HttpHeaders();
	JSONObject jobJsonObject = new JSONObject();
	
	
	// Job List 띄우기
	@RequestMapping(value = "/joblist.do", method = RequestMethod.GET)
	public String joblist(Locale locale, Model model) {

		ResponseEntity<List<JobDTO>> result = restTemplate.exchange(URL + "/joblist_username", HttpMethod.GET, null,
				new ParameterizedTypeReference<List<JobDTO>>() {
				});
		List<JobDTO> list = result.getBody();

		model.addAttribute("jobs", list);

		return "joblist/JobList";
	}
	
	// 특정 Id에 대한 Job List
	@ResponseBody
	@RequestMapping(value = "/selectjobid.do", method = RequestMethod.GET)
	public ResponseEntity<JobDTO> selectjobid(Locale locale, Model model, @RequestParam(value="jobId") String jobId) {

		System.out.println(jobId);
		ResponseEntity<JobDTO> result = restTemplate.exchange(URL + "/" + jobId , HttpMethod.GET, null,
				new ParameterizedTypeReference<JobDTO>() {
				});
		System.out.println("response (/GetJobAllInfo)= " + result);

		return result;
	}
	
	// Job 상세정보
	// json 형태로 반환해줘야하기 때문에 리턴 타입을 ResponseEntity<JobDTO> 사용(?)
	@ResponseBody
	@RequestMapping(value = "/jobdetails.do", method = RequestMethod.GET)
	public ResponseEntity<JobDetailDTO> jobDetail(Locale locale, Model model, @RequestParam(value="jobId") String jobId) {
		
		//String resId = param.get("jobId").toString();
		System.out.println(jobId);
		ResponseEntity<JobDetailDTO> result = restTemplate.exchange(URL + "/" + jobId + "/GetJob_UserSchedule", HttpMethod.GET, null,
				new ParameterizedTypeReference<JobDetailDTO>() {
				});
		System.out.println("response (/GetJob_UserSchedule)= " + result);
		System.out.println(result.getBody().JobId);
		System.out.println(result.getBody().JobName);
		System.out.println(result.getBody().WorkflowName);
		System.out.println(result.getBody().JobIsUse);
		System.out.println(result.getBody().ScheduleId);

		return result;
	}

	// Job 등록 컨트롤러
	@RequestMapping(value = "/createjob.do", method = RequestMethod.POST)
	public String jobAdd(Locale locale, Model model, @RequestParam("jobName") String jobName,
			@RequestParam("workflowName") String workflowName, @RequestParam("note") String note,
			@RequestParam(value = "workflowFile",required = false) MultipartFile[] uploadFile) throws IOException {
		StringBuilder resultline = new StringBuilder();
		byte[] content = null;
		for(MultipartFile multipartFile : uploadFile) {
			System.out.println("================uploadFile Info=================");
			System.out.println("1. 파일 매개변수 이름 : " + multipartFile.getName());
			System.out.println("2. 실제 파일 이름 : " + multipartFile.getOriginalFilename());
			System.out.println("3. 컨텐츠 유형 : " + multipartFile.getContentType());
			System.out.println("4. 크기 : " + multipartFile.getSize());
			System.out.println("5. 파일 내용(바이트배열) : " + multipartFile.getBytes());
			System.out.println("6. 실제파일내용");
			String line = null;
			int i = 1;
			BufferedReader br = new BufferedReader(new InputStreamReader(multipartFile.getInputStream(), "UTF-8"));
			while((line=br.readLine()) != null) {
				System.out.println("Line" + i + "- " + line);
				i++;
				resultline.append(line);
			}
			content = multipartFile.getBytes();
			br.close();
			System.out.println("전체 문자열 : " + resultline);
			System.out.println("================================================");
		}
		

		restTemplate = new RestTemplate();
		headers.setContentType(MediaType.APPLICATION_JSON);
		
		//MultiValuewMap 은 List형태로 저장됨
		JSONObject body = new JSONObject();
		body.put("jobName", jobName);
		body.put("workflowName", workflowName);
		body.put("note", note);
		body.put("userId", 3);
		System.out.println("뽑아낸 바이트배열 : " + content);
		body.put("workflowBlob", content.toString());


		HttpEntity<?> request = new HttpEntity<>(body, headers);
		System.out.println("헤더" + headers);
		System.out.println("========HttpEntity Request 값===========");
		System.out.println("request : "+request);

		HttpEntity<String> response = restTemplate.postForEntity(URL + "/create", request, String.class);
		objectMapper.configure(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT, true);
		System.out.println("response (/create)= " + response);
		
		return "redirect:joblist.do";

	}
	
	// Job 수정 컨트롤러
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
		System.out.println(jobName + "\n" + workflowName + "\n" + note + "\n" +"체크파일: " +checkfile + "\n" + "체크 이즈유즈: " +checkIsUse);

		restTemplate = new RestTemplate();
		headers.setContentType(MediaType.APPLICATION_JSON);
		JSONObject body = new JSONObject();
		
		if(checkIsUse == null) {
			body.put("isUse", 0);
		}
		else{
			body.put("isUse", 1);
		}

		
		
		if(checkfile.equals("checked")) {
			body.put("jobId", jobId);
			body.put("jobName", jobName);
			body.put("workflowName", workflowName);
			body.put("note", note);
			body.put("workflowBlob", content.toString());
		}
		else {
			body.put("jobId", jobId);
			body.put("jobName", jobName);
			body.put("workflowName", workflowName);
			body.put("note", note);
			body.put("workflowBlob", workflowBlob.toString());
		}

		
		


		HttpEntity<?> request = new HttpEntity<>(body, headers);
		System.out.println("헤더" + headers);
		System.out.println("========HttpEntity Request 값===========");
		System.out.println("request : "+request);

		HttpEntity<String> response = restTemplate.exchange(URL + "/update", HttpMethod.PUT, request, String.class);
		System.out.println("response (/update) = " + response);
		return "redirect:joblist.do";
	}
	
	// Job 삭제 컨트롤러
	@RequestMapping(value = "/deletejob.do", method = RequestMethod.POST)
	public String jobDelete(@RequestBody Map<String, Object> param, HttpServletRequest hsrequest) throws IOException{

		String re = param.get("jobId").toString();
		System.out.println("삭제할 jobId : "+re);
		restTemplate = new RestTemplate();
		headers.add("accept", "application/json");
		headers.setContentType(MediaType.APPLICATION_JSON);
		
		JSONObject body = new JSONObject();
		body.put("JobId", re);
		
		HttpEntity<?> request = new HttpEntity<>(body, headers);
		HttpEntity<String> response = restTemplate.exchange(URL + "/delete" + "/" + re, HttpMethod.DELETE, request, String.class);
		System.out.println("response (/delete) = " + response);
		
		
		return "redirect:joblist.do";
	}
	
	// 크론식 유효성 검사
	/*
	 * 첫 조건은 Cron 식이 유효한 식인지 확인하는 isValidExpression이다. 파라메터는 String, 반환값은 boolean이다.
	 * 3번째 줄 isValidExpression의 내부를 보면 
	 * CronExpression을 생성하면서 파라메터의 String을 생성자로 주는데, 
	 * 이 때 Exception이 발생하면 false, 제대로 생성되면 true를 반환하게 된다. 
	 * 결국 5번째 줄 CronExpression 생성자를 내부에서 한번 해보고 결과를 넘겨주는 것이다.
	 * 두번째 조건은 6번째 줄의 getNextValidTimeAfter이다.
	 * CronExpression이 생성됐다면, getNextValidTimeAfter를 통해 다음 수행 예정 Date가 있는지를 체크하는 것이다. 
	 * 없으면 null이 반환되기 때문에 null일 경우 다음 수행 예정이 없는 무의미한 Cron 식이라는 것이고, 있다면 사용할 수 있는 식으로 간주한다.
	 */
	//참고: https://povia.tistory.com/9
	@ResponseBody
	@RequestMapping(value = "/cronExpression.do", method = RequestMethod.GET)
	public boolean isValidExpression(@RequestParam(value="expression")String expression){
		//System.out.println(expression);
	    boolean result = false;
	    if(CronExpression.isValidExpression(expression)){
	        try {
	            //CronExpression targetExpression = new CronExpression(cron);
	            //if(targetExpression.getNextValidTimeAfter(new Date(System.currentTimeMillis())) != null){
	                //System.out.println("트루");
	            	result = true;
	                
	            //}
	        } catch (Exception e) {
	        	//System.out.println("펄스");
	            e.printStackTrace();
	        }
	    }
	    return result;
	}

	
	// Schedule 등록 컨트롤러
	@RequestMapping(value = "/createschedule.do", method = RequestMethod.POST)
	public String scheduleAdd(@RequestParam(value="jobId")String jobId, @RequestParam(value="scheduleName")String scheduleName, 
			@RequestParam(value="scheduleType")boolean scheduleType, @RequestParam(value="startDate") @DateTimeFormat(iso = ISO.DATE_TIME)LocalDateTime startDate, 
			 @RequestParam(value="endDate")@DateTimeFormat(iso = ISO.DATE_TIME)LocalDateTime endDate, @RequestParam(value="CronExpression")String CronExpression) {
		LocalDateTime currentDate = LocalDateTime.now(); 
		
		if(scheduleType == true) {
			
			//String real_currentDate = currentDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
			//String real_startDate = startDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
			//String real_endDate = endDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
			
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
			body.put("userId", 3);
			body.put("saveDate", currentDate.toString());
			System.out.println(body);
			
			HttpEntity<?> request = new HttpEntity<>(body, headers);
			System.out.println(request);
			ResponseEntity<String> response = restTemplate.postForEntity(URL + "/" + jobId + "/Schedule", request, String.class);
			System.out.println("response (Schedule 등록/Loop) = " + response);
		}
		else if(scheduleType == false){
			
			System.out.println("Onetime 값 확인: " + jobId + scheduleName + scheduleType + startDate);
			
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
			body.put("userId", 3);
			body.put("saveDate", currentDate.toString());
			
			HttpEntity<?> request = new HttpEntity<>(body, headers);
			ResponseEntity<String> response = restTemplate.postForEntity(URL + "/" + jobId + "/Schedule", request, String.class);
			System.out.println("response (Schedule 등록/OneTime) = " + response);
		}
		else
			System.out.println("대실패");
		
		
		return "redirect:joblist.do";
	}

}
