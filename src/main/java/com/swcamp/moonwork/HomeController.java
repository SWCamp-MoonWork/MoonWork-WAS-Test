package com.swcamp.moonwork;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.swcamp.moonwork.model.dto.UserDTO;

import net.sf.json.JSONObject;

@Controller
@PropertySource(value = "classpath:/global.properties")
public class HomeController {
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

    @RequestMapping(value = "/home.do", method = RequestMethod.GET)
    public String home(Locale locale, Model model) {
 	
 	   return "home";
    }
    
    
    @RequestMapping(value = "/login.do", method = RequestMethod.POST)
    public String login(HttpServletRequest httpRequest, Locale locale, Model model, @RequestParam("userName") String userName,
			@RequestParam("password") String password) {
    	
    	HttpSession session = httpRequest.getSession();
    	
    	System.out.println(userName);
    	System.out.println(password);
		headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		
		JSONObject body = new JSONObject();
		body.put("UserName", userName);
		body.put("Password", password);

		
		HttpEntity<?> request = new HttpEntity<>(body, headers);
		HttpEntity<String> response = restTemplate.postForEntity(ServerIp_user + "/login", request, String.class);
		//objectMapper.configure(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT, true);
		System.out.println("response (/login)= " + response);
		System.out.println(response.getBody());
		if(response.getBody().equals("로그인 실패")) {
			System.out.println("fail");
			
			session.setAttribute("signIn", null);
			
			return "redirect:home.do";
		}
		else {
			HttpEntity<UserDTO> successLogin = restTemplate.postForEntity(ServerIp_user + "/getuserinfo", request, UserDTO.class);
			
			UserDTO userdto = successLogin.getBody();
			
			session.setAttribute("Name", userdto.Name);
			session.setAttribute("userId", userdto.UserId);
			System.out.println(userdto.Name);
			System.out.println("success");
			return "redirect:dashboard.do";
		}
    }
    
    @RequestMapping("/logout.do")
    public String logout(HttpSession session) {
    	session.invalidate();
    	return "redirect:login.do";
    }
 
}
