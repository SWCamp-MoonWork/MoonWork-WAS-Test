package com.swcamp.moonwork.controller;




import java.util.List;
import java.util.Locale;

import org.springframework.core.ParameterizedTypeReference;

import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.client.RestTemplate;

import com.swcamp.moonwork.model.dto.JobDTO;




@Controller
public class JobListController {
	private final String URL = "http://20.39.194.244:5000/v1/job";
	
	RestTemplate restTemplate = new RestTemplate();
	
	@RequestMapping(value = "/joblist.do", method = RequestMethod.GET)
	public String joblist(Locale locale, Model model) {

		ResponseEntity<List<JobDTO>> result = restTemplate.exchange(URL + "/list",HttpMethod.GET, null, new ParameterizedTypeReference<List<JobDTO>>() {});
		List<JobDTO> list = result.getBody();
		
		model.addAttribute("jobs", list);

		return "joblist/JobList";
	}

	@RequestMapping(value = "/jobdetails.do", method = RequestMethod.GET)
	public String addjob(Locale locale, Model model) {

		return "joblist/JobDetails";
	}
}
