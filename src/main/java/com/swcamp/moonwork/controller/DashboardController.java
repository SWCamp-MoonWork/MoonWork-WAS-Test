package com.swcamp.moonwork.controller;


import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.swcamp.moonwork.model.dao.MemberDAO;
import com.swcamp.moonwork.model.dto.JobDTO;
import com.swcamp.moonwork.model.dto.MemberDTO;

import net.sf.json.JSONObject;

@Controller
public class DashboardController {
	
	private final String URL = "http://20.249.17.147:5000/v1/job";
	// ObjectMapper 란?
	/*
	 * JSON 컨텐츠를 Java 객체로 deserialization 하거나 
	 * Java 객체를 JSON으로 serialization 할 때 사용하는 Jackson 라이브러리의 클래스이다.
	 * 
	 * 직렬화 (serialization) : 메모리를 디스크에 저장하거나 네트워크 통신에 사용하기 위한 형식으로 변환하는 것
	 * 역직렬화 (desrialization): 그 반대로 디스크에 저장한 데이터를 읽거나, 네트워크 통신으로 받은 데이터를 메모리에 쓸 수 있도록 다시 변환하는 것
	 * */
	private final ObjectMapper objectMapper = new ObjectMapper();
	RestTemplate restTemplate = new RestTemplate();
	HttpHeaders headers = new HttpHeaders();
    @Autowired
    MemberDAO memberDao;	// 인터페이스 객체
    
    //대시보드 메인
    @RequestMapping("/dashboard.do")
    public String dashboard(Locale locale, Model model) {
    	int TotalJobsCount = 0;		// 총 작업의 개수
    	int TodayNewJobs = 0;		// 오늘 등록된 작업의 개수
    	int NoScheduleJobs = 0;		// 스케줄이 등록이 안된 작업의 개수	
    	int TodayStartedJobs = 0;	// 오늘 시작된 작업의 개수
    	
    	//헤더 생성
		headers.add("accept", "application/json");
		headers.setContentType(MediaType.APPLICATION_JSON);
		HttpEntity<?> request = new HttpEntity<>(null, headers);
		
		// 총 작업의 개수 가져오기
		HttpEntity<String> res_TotalJobsCount = restTemplate.exchange(URL + "/totalnum" , HttpMethod.GET, request, String.class);
		System.out.println("response (/totalnum) = " + res_TotalJobsCount);
		// 오늘 등록된 작업의 개수 가져오기
		HttpEntity<String> res_TodayNewJobs = restTemplate.exchange(URL + "/addtoday" , HttpMethod.GET, request, String.class);
		System.out.println("response (/addtoday) = " + res_TodayNewJobs);
		// 스케줄이 등록이 안된 작업의 개수 가져오기
		HttpEntity<String> res_NoScheduleJobs = restTemplate.exchange(URL + "/notregist" , HttpMethod.GET, request, String.class);
		System.out.println("response (/notregist) = " + res_NoScheduleJobs);
		// 오늘 시작된 작업의 개수 가져오기
		HttpEntity<String> res_TodayStartedJobs = restTemplate.exchange(URL + "/startschedule" , HttpMethod.GET, request, String.class);
		System.out.println("response (/startschedule) = " + res_TodayStartedJobs);
		
		try {
			// 각각의 COUNT(*) 값 뽑기
			// objectMapper.readValue를 사용해서 API에서 응답받은 JSON 형식의 Body를 Map<String, Integer>타입으로 역직렬화
			// .get() 메소드를 사용해서 값 가져오기
			Map<String, Integer> map_TotalJobsCount = objectMapper.readValue(res_TotalJobsCount.getBody(), Map.class);
			TotalJobsCount = map_TotalJobsCount.get("COUNT(*)");
			Map<String, Integer> map_TodayNewJobs = objectMapper.readValue(res_TodayNewJobs.getBody(), Map.class);
			TodayNewJobs = map_TodayNewJobs.get("COUNT(*)");
			Map<String, Integer> map_NoScheduleJobs = objectMapper.readValue(res_NoScheduleJobs.getBody(), Map.class);
			NoScheduleJobs = map_NoScheduleJobs.get("COUNT(*)");
			Map<String, Integer> map_TodayStartedJobs = objectMapper.readValue(res_TodayStartedJobs.getBody(), Map.class);
			TodayStartedJobs = map_TodayStartedJobs.get("COUNT(*)");
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// model에 저장 후 jsp로 전달
		model.addAttribute("TotalJobsCount", TotalJobsCount);
		model.addAttribute("TodayNewJobs", TodayNewJobs);
		model.addAttribute("NoScheduleJobs", NoScheduleJobs);
		model.addAttribute("TodayStartedJobs", TodayStartedJobs);

 	
 	   return "dashboard/Dashboard";
    }
    
    
    // jsgrid 데이터 띄우기
    @RequestMapping(value = "/jsgrid.do", method= {RequestMethod.GET , RequestMethod.POST})
    @ResponseBody
    public List<MemberDTO> jsgrid(Model model) {

 	List<MemberDTO> list = memberDao.list();

 	   
 	   return list;
    }
}
