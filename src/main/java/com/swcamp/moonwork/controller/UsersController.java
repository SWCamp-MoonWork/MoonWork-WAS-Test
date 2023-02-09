package com.swcamp.moonwork.controller;

import java.util.List;
import java.util.Locale;

import org.quartz.CronExpression;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.swcamp.moonwork.model.dto.JobDTO;
import com.swcamp.moonwork.model.dto.UserDTO;

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
	
	// Users 진입 및 유저리스트 조회
	@RequestMapping(value = "/users.do", method = RequestMethod.GET)
	public String GetUserList(Locale locale, Model model) {

		ResponseEntity<List<UserDTO>> result = restTemplate.exchange(USERURL + "/userlist", HttpMethod.GET, null,
				new ParameterizedTypeReference<List<UserDTO>>() {
				});
		
		
		List<UserDTO> list = result.getBody();

		model.addAttribute("users", list);

		return "users/Users";
	}
	
	// Users 생성
	@RequestMapping(value = "/createuser.do", method = RequestMethod.POST)
	public String CreateUser(Locale locale, Model model, @RequestParam("userName") String userName,
			@RequestParam("userPassword") String userPassword, @RequestParam("Name") String Name, 
			@RequestParam("userEmail") String userEmail, @RequestParam("note") String note) {

		
		headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		
		JSONObject body = new JSONObject();
		body.put("UserName", userName);
		body.put("Password", userPassword);
		body.put("Name", Name);
		body.put("Email", userEmail);
		body.put("Note", note);
		
		HttpEntity<?> request = new HttpEntity<>(body, headers);
		HttpEntity<String> response = restTemplate.postForEntity(USERURL + "/createuser", request, String.class);
		//objectMapper.configure(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT, true);
		System.out.println("response (/createuser)= " + response);
		


		return "redirect:users.do";
	}
	
	
	// 아이디 중복검사
	@ResponseBody
	@RequestMapping(value = "/duplicateInspection.do", method = RequestMethod.GET)
	public boolean isValidExpression(@RequestParam(value="inputName")String expression){
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
}
