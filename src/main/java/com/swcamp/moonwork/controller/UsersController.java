package com.swcamp.moonwork.controller;

import java.io.IOException;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.quartz.CronExpression;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
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
@PropertySource(value = "classpath:/global.properties")
public class UsersController {
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
	
	// Users 진입 및 유저리스트 조회
	@RequestMapping(value = "/users.do", method = RequestMethod.GET)
	public String GetUserList(Locale locale, Model model) {

		ResponseEntity<List<UserDTO>> result = restTemplate.exchange(ServerIp_user + "/userlist", HttpMethod.GET, null,
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
		body.put("IsActive", true);
		
		HttpEntity<?> request = new HttpEntity<>(body, headers);
		HttpEntity<String> response = restTemplate.postForEntity(ServerIp_user + "/createuser", request, String.class);
		//objectMapper.configure(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT, true);
		System.out.println("response (/createuser)= " + response);
		


		return "redirect:users.do";
	}
	
	
	// 아이디 중복검사
	@ResponseBody
	@RequestMapping(value = "/duplicateInspection.do", method = RequestMethod.GET)
	public Boolean isValidExpression(@RequestParam(value="username")String username){

	    System.out.println(username);
		ResponseEntity<String> res_check = restTemplate.exchange(ServerIp_user + "/" + username +"/idexist", HttpMethod.GET, null,
				new ParameterizedTypeReference<String>() {
				});
		System.out.println(res_check.getBody());
		
		if(res_check.getBody().equals("0")) {
		    return true;
		}
		else {
		    return false;
		}
		
		

	}
	
	// 유저 삭제 컨트롤러
	@RequestMapping(value = "/deleteuser.do", method = RequestMethod.GET)
	public String userDelete(@RequestParam(value="deluserId")String deluserId, HttpServletRequest hsrequest) throws IOException{


		restTemplate = new RestTemplate();
		headers.add("accept", "application/json");
		headers.setContentType(MediaType.APPLICATION_JSON);
		
		JSONObject body = new JSONObject();
		body.put("UserId", deluserId);
		
		HttpEntity<?> request = new HttpEntity<>(body, headers);
		HttpEntity<String> response = restTemplate.exchange(ServerIp_user + "/" + deluserId + "/delete", HttpMethod.DELETE, request, String.class);
		System.out.println("response (/delete) = " + response);
		
		
		return "redirect:users.do";
	}
}
