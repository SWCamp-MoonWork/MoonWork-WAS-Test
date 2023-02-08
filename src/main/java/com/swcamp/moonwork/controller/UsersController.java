package com.swcamp.moonwork.controller;

import java.util.List;
import java.util.Locale;

import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.swcamp.moonwork.model.dto.JobDTO;

import net.sf.json.JSONObject;



@Controller
public class UsersController {
	private final String URL = "http://20.249.17.147:5000/v1/job";
	private final String RUNURL = "http://20.249.17.147:5000/v1/run";
	private final String USERURL = "http://20.249.17.147:5000/v1/user";
	private final ObjectMapper objectMapper = new ObjectMapper();
	RestTemplate restTemplate = new RestTemplate();
	HttpHeaders headers = new HttpHeaders();
	JSONObject jobJsonObject = new JSONObject();
	
	// Users 진입
	@RequestMapping(value = "/users.do", method = RequestMethod.GET)
	public String joblist(Locale locale, Model model) {

		ResponseEntity<List<JobDTO>> result = restTemplate.exchange(URL + "/joblist_username", HttpMethod.GET, null,
				new ParameterizedTypeReference<List<JobDTO>>() {
				});
		
		
		List<JobDTO> list = result.getBody();

		model.addAttribute("jobs", list);

		return "users/Users";
	}
}
