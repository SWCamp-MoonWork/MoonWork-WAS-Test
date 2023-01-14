package com.swcamp.moonwork.controller;


import java.io.IOException;
import java.util.List;
import java.util.Locale;

import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.swcamp.moonwork.model.dto.JobDTO;

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

	@RequestMapping(value = "/jobdetails.do", method = RequestMethod.GET)
	public String addjob(Locale locale, Model model) {

		return "joblist/JobDetails";
	}

	@RequestMapping(value = "/jobadd.do", method = RequestMethod.POST)
	public String jobAdd(Locale locale, Model model, @RequestParam("jobName") String jobName, 
			@RequestParam("workflowName") String workflowName, 
			@RequestParam("note") String note) throws IOException {
		JobDTO dto = new JobDTO();
		dto.setJobName(jobName);
		dto.setWorkflowName(workflowName);
		dto.setNote(note);
		System.out.println(dto.JobName);
		System.out.println(dto.WorkflowName);
		System.out.println(dto.Note);
		
	    restTemplate = new RestTemplate();
	    headers.setContentType(MediaType.APPLICATION_JSON);
	    jobJsonObject = new JSONObject();
	    jobJsonObject.put("JobName", dto.JobName);
	    jobJsonObject.put("WorkflowName", dto.WorkflowName);
	    jobJsonObject.put("Note", dto.Note);
		System.out.println(jobJsonObject);
	    
	    HttpEntity<JSONObject> request = new HttpEntity<>(jobJsonObject, headers);
	    	    System.out.println(request);
	    	    
	    	    //JobDTO ,String 으로 해도 Null로 나옴
	    	    JSONObject jobResultAsJsonStr = new JSONObject();
	    	    jobResultAsJsonStr = 
	    	      restTemplate.postForObject(URL+ "/create", request, JSONObject.class);
	    	    //JsonNode result = objectMapper.readTree(jobResultAsJsonStr);
System.out.println(jobResultAsJsonStr);
		return "/joblist.do";
	}
	
}
