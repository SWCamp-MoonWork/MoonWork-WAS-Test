package com.swcamp.moonwork;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

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

import com.fasterxml.jackson.databind.ObjectMapper;
import com.swcamp.moonwork.model.dto.UserDTO;

import net.sf.json.JSONObject;

@Controller
public class HomeController {
	private final String USERURL = "http://20.249.17.147:5000/v1/user";
	private final ObjectMapper objectMapper = new ObjectMapper();
	RestTemplate restTemplate = new RestTemplate();
	HttpHeaders headers = new HttpHeaders();
	JSONObject jobJsonObject = new JSONObject();

    @RequestMapping(value = "/home.do", method = RequestMethod.GET)
    public String home(Locale locale, Model model) {
 	
 	   return "home";
    }
    
    
    @RequestMapping(value = "/login.do", method = RequestMethod.POST)
    public String login(Locale locale, Model model, @RequestParam("userName") String userName,
			@RequestParam("password") String password) {
    	System.out.println(userName);
    	System.out.println(password);
		headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		
		JSONObject body = new JSONObject();
		body.put("UserName", userName);
		body.put("Password", password);

		
		HttpEntity<?> request = new HttpEntity<>(body, headers);
		HttpEntity<String> response = restTemplate.postForEntity(USERURL + "/login", request, String.class);
		//objectMapper.configure(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT, true);
		System.out.println("response (/login)= " + response);
		System.out.println(response.getBody());
		if(response.getBody().equals("로그인 실패")) {
			System.out.println("fail");
			return "redirect:home.do";
		}
		else 
			System.out.println("success");
			return "redirect:dashboard.do";
		
    }
 
}
