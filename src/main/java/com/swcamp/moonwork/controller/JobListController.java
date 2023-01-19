package com.swcamp.moonwork.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.core.ParameterizedTypeReference;
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

import net.sf.json.JSONObject;

@Controller
public class JobListController {
	private final String URL = "http://20.39.194.244:5000/v1/job";
	private final ObjectMapper objectMapper = new ObjectMapper();
	RestTemplate restTemplate = new RestTemplate();
	HttpHeaders headers = new HttpHeaders();
	JSONObject jobJsonObject = new JSONObject();

	@RequestMapping(value = "/joblist.do", method = RequestMethod.GET)
	public String joblist(Locale locale, Model model) {

		ResponseEntity<List<JobDTO>> result = restTemplate.exchange(URL + "/list", HttpMethod.GET, null,
				new ParameterizedTypeReference<List<JobDTO>>() {
				});
		List<JobDTO> list = result.getBody();

		model.addAttribute("jobs", list);

		return "joblist/JobList";
	}
	
	// Job 상세정보
	// json 형태로 반환해줘야하기 때문에 리턴 타입을 ResponseEntity<JobDTO> 사용(?)
	@ResponseBody
	@RequestMapping(value = "/jobdetails.do", method = RequestMethod.GET)
	public ResponseEntity<JobDetailDTO> jobDetail(Locale locale, Model model, @RequestParam(value="jobId") String jobId) {
		
		//String resId = param.get("jobId").toString();
		System.out.println(jobId);
		ResponseEntity<JobDetailDTO> result = restTemplate.exchange(URL + "/" + jobId + "/GetJobAllInfo", HttpMethod.GET, null,
				new ParameterizedTypeReference<JobDetailDTO>() {
				});
		System.out.println("response = " + result);

		return result;
	}

	// Job 등록 컨트롤러
	@RequestMapping(value = "/createjob.do", method = RequestMethod.POST)
	public String jobAdd(Locale locale, Model model, @RequestParam("jobName") String jobName,
			@RequestParam("workflowName") String workflowName, @RequestParam("note") String note,
			@RequestParam(value = "workflowFile",required = false) MultipartFile[] uploadFile) throws IOException {
		StringBuilder resultline = new StringBuilder();
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
			br.close();
			System.out.println("전체 문자열 : " + resultline);
			System.out.println("================================================");
		}
		
		JobDTO dto = new JobDTO();
		dto.setJobName(jobName);
		dto.setWorkflowName(workflowName);
		dto.setNote(note);
		System.out.println("========jsp에서 넘어와서 객체에 저장한 값===========");
		System.out.println(dto.JobName);
		System.out.println(dto.WorkflowName);
		System.out.println(dto.Note);

		restTemplate = new RestTemplate();
		headers.setContentType(MediaType.APPLICATION_JSON);
		
		//MultiValuewMap 은 List형태로 저장됨
		JSONObject body = new JSONObject();
		body.put("jobName", dto.JobName);
		body.put("workflowName", dto.WorkflowName);
		body.put("note", dto.Note);
		body.put("userId", 3);
		body.put("WorkflowBlob", resultline.toString());


		HttpEntity<?> request = new HttpEntity<>(body, headers);
		System.out.println("헤더" + headers);
		System.out.println("========HttpEntity Request 값===========");
		System.out.println("request : "+request);

		HttpEntity<String> response = restTemplate.postForEntity(URL + "/create", request, String.class);
		objectMapper.configure(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT, true);
		System.out.println("response = " + response);
		
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
		System.out.println("response = " + response);
		
		
		return "redirect:joblist.do";
	}
}
