package com.swcamp.moonwork.controller;


import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mysql.cj.x.protobuf.MysqlxCrud.Collection;
import com.swcamp.moonwork.model.dto.ChartDTO;
import com.swcamp.moonwork.model.dto.ChartDataDTO;
import com.swcamp.moonwork.model.dto.HostDTO;
import com.swcamp.moonwork.model.dto.JobDTO;
import com.swcamp.moonwork.model.dto.JobOfHostDTO;
import com.swcamp.moonwork.model.dto.RunsDTO;

import net.sf.json.JSONObject;

@Controller
@PropertySource(value = "classpath:/global.properties")
public class DashboardController {
	@Value("${serverip_job}")
	private String ServerIp_job;
	
	@Value("${serverip_run}")
	private String ServerIp_run;
	
	@Value("${serverip_host}")
	private String ServerIp_host;
	
	//private final String URL = ServerIp;
	//private final String HOSTURL = ServerIp + "/v1/host";
	//private final String RUNURL = ServerIp + "/v1/run";
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

    //tt
    //대시보드 메인
    @RequestMapping("/dashboard.do")
    public String dashboard(Locale locale, Model model) {
    	
    	
    	int TotalJobsCount = 0;		// 총 작업의 개수
    	int TodayNewJobs = 0;		// 오늘 등록된 작업의 개수
    	int NoScheduleJobs = 0;		// 스케줄이 등록이 안된 작업의 개수	
    	int TodayStartedJobs = 0;	// 오늘 시작된 작업의 개수
    	System.out.println(ServerIp_run);
    	System.out.println(ServerIp_job);
    	//헤더 생성
		headers.add("accept", "application/json");
		headers.setContentType(MediaType.APPLICATION_JSON);
		HttpEntity<?> request = new HttpEntity<>(null, headers);
		
		// 총 작업의 개수 가져오기
		HttpEntity<String> res_TotalJobsCount = restTemplate.exchange(ServerIp_job + "/totalnum" , HttpMethod.GET, request, String.class);
		System.out.println("response (/totalnum) = " + res_TotalJobsCount);
		// 오늘 등록된 작업의 개수 가져오기
		HttpEntity<String> res_TodayNewJobs = restTemplate.exchange(ServerIp_job + "/addtoday" , HttpMethod.GET, request, String.class);
		System.out.println("response (/addtoday) = " + res_TodayNewJobs);
		// 스케줄이 등록이 안된 작업의 개수 가져오기
		HttpEntity<String> res_NoScheduleJobs = restTemplate.exchange(ServerIp_job + "/notregist" , HttpMethod.GET, request, String.class);
		System.out.println("response (/notregist) = " + res_NoScheduleJobs);
		// 오늘 시작된 작업의 개수 가져오기
		HttpEntity<String> res_TodayStartedJobs = restTemplate.exchange(ServerIp_job + "/startschedule" , HttpMethod.GET, request, String.class);
		System.out.println("response (/startschedule) = " + res_TodayStartedJobs);
		
		
		ResponseEntity<List<HostDTO>> getHostResult = restTemplate.exchange(ServerIp_host + "/list", HttpMethod.GET, null,
				new ParameterizedTypeReference<List<HostDTO>>() {
				});
		
		List<HostDTO> list = getHostResult.getBody();
		
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
		model.addAttribute("Hosts", list); 
		model.addAttribute("TotalJobsCount", TotalJobsCount);
		model.addAttribute("TodayNewJobs", TodayNewJobs);
		model.addAttribute("NoScheduleJobs", NoScheduleJobs);
		model.addAttribute("TodayStartedJobs", TodayStartedJobs);

 	
 	   return "dashboard/Dashboard";
    }
    
    
    //대시보드 메인
    @ResponseBody
    @RequestMapping("/getjobofhost.do")
    public List<JobOfHostDTO> GetJobOfHost(Locale locale, Model model, @RequestParam(value="hostId") String hostId) {


		ResponseEntity<List<JobOfHostDTO>> getHostResult = restTemplate.exchange(ServerIp_host + "/" + hostId + "/getjobinfo", HttpMethod.GET, null,
				new ParameterizedTypeReference<List<JobOfHostDTO>>() {
				});
		
		List<JobOfHostDTO> list = getHostResult.getBody();
 	
 	   return list;
    }
    
    
    
	// 그래프에 띄워줄 데이터 값 가져오기
	@ResponseBody
	@RequestMapping(value= "/getChartGraph.do", method= RequestMethod.GET)
	public List<ChartDataDTO> GetChartGraph(Model model) {
		String timeStamp = "-30";
		//API 호출 코드
		ResponseEntity<List<ChartDTO>> getChartGraph = restTemplate.exchange(ServerIp_run + "/getgraph" + "/" + timeStamp, HttpMethod.GET, null,
				new ParameterizedTypeReference<List<ChartDTO>>() {
				});
		
		
		List<ChartDTO> ChartDatalist = getChartGraph.getBody();		// API 에서 받아온 리스트
		List<String> StartDTList = new ArrayList<>();				// StartDT 리스트(X축)
		//ChartDataDTO ChartDataDTO = new ChartDataDTO();				// 데이터를 담아줄 ChartDataDTO객체
		List<ChartDataDTO> ChartData = new ArrayList<>();			// View로 넘겨줄 ChartDataDTO 타입의 리스트
		
		Set<String> DuplicateSet = new HashSet<>();					// 중복된 ID Set
		List<String> JobIdList = new ArrayList<>();					// Job Id List 
		//List<ChartDTO> ResultData = new ArrayList<>();			// jobid에 따른 Y축 데이터
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        
		// X축 데이터 추출 (StartDT)
		for(ChartDTO dto : ChartDatalist) {
			//Date date = format.parse(dto.StartDT);
			StartDTList.add(dto.StartDT.substring(11));
			
		}
		System.out.println("X축 결과: "+StartDTList);  // 뽑아낸 x축 (StartDT)
		// 중복값 추출
		for (ChartDTO chart : ChartDatalist) {
			String jobId = String.valueOf(chart.getJobId());
			if(JobIdList.contains(jobId)) {
				DuplicateSet.add(jobId);
			}else {
				JobIdList.add(jobId);
			}
		}
		
		//중복값 Set to List
		List<String> duplicateList = new ArrayList<>(DuplicateSet);	//[10, 20]
		System.out.println("중복값 결과 : "+duplicateList);
		
		Collections.sort(duplicateList);
		
		System.out.println("정렬 결과 : "+duplicateList);
		
		
		// 중복된 JobId의 길이만큼 검색
		for (int i = 0; i < duplicateList.size(); i++) {
			
			//y축 데이터를 담을 리스트
			List<String> y_list = new ArrayList<>();
			String labelName = "";

			//전체 데이터 검색 
			for (int j = 0; j < ChartDatalist.size(); j++) {
				
				// duplicateList의 JobId와 ChartDatalist의 JobId를 비교후 맞으면 y_list리스트에 넣기
				if(duplicateList.get(i).equals(Long.toString(ChartDatalist.get(j).JobId))) {
					
					y_list.add(ChartDatalist.get(j).Duration);
					labelName = ChartDatalist.get(j).JobName;
				}
			}// 안쪽 for문 끝

			ChartDataDTO ChartDataDTO = new ChartDataDTO();				// 데이터를 담아줄 ChartDataDTO객체
			ChartDataDTO.setBorderColor("#39d353");		// 그래프 색 삽입
			ChartDataDTO.setLabel(labelName);		// 그래프 라벨 삽입
			ChartDataDTO.setY_data(y_list);			// y축 데이터 삽입, List<String> to String[]
			ChartDataDTO.setX_data(StartDTList);	
			
			ChartData.add(ChartDataDTO);// 가공된 ChartDataDTO를 ChartData 리스트에 추가
			
		} // 바깥 for문 끝
		
		return ChartData;
	}
	

}
