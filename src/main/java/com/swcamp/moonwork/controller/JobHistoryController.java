package com.swcamp.moonwork.controller;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.swcamp.moonwork.model.dto.ChartDTO;
import com.swcamp.moonwork.model.dto.ChartDataDTO;


@Controller
@PropertySource(value = "classpath:/global.properties")
public class JobHistoryController {
	
	
	@Value("${serverip_job}")
	private String ServerIp_job;
	
	@Value("${serverip_run}")
	private String ServerIp_run;
	
	@Value("${serverip_host}")
	private String ServerIp_host;
	
	private final ObjectMapper objectMapper = new ObjectMapper();
	RestTemplate restTemplate = new RestTemplate();
	HttpHeaders headers = new HttpHeaders();

    @RequestMapping(value = "/jobhistory.do", method = RequestMethod.GET)
    public String home(Locale locale, Model model) {
 	
 	   return "jobhistory/JobHistory";
    }
    
    
 // 그래프에 띄워줄 데이터 값 가져오기
 	@ResponseBody
 	@RequestMapping(value= "/RunHistoryGraph.do", method= RequestMethod.GET)
 	public List<ChartDataDTO> GetChartGraph(Model model, @RequestParam(value="st") String startDay, 
 			@RequestParam(value="et") String endDay) throws ParseException {
 		
 		System.out.println(startDay);
 		System.out.println(endDay);
 		
 		//API 호출 코드
 		ResponseEntity<List<ChartDTO>> getChartGraph = restTemplate.exchange(ServerIp_run + "/history" + "/" + startDay+ "/" + endDay, HttpMethod.GET, null,
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
 		Collections.sort(StartDTList);
 		System.out.println("X축 결과: "+ StartDTList);  // 뽑아낸 x축 (StartDT)
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
 		Collections.sort(duplicateList);
 		System.out.println("중복값 결과 : "+duplicateList);
 		
 		List<Long> duplicateList_sort = new ArrayList<>();
 		
 		for(String s : duplicateList) {
 			duplicateList_sort.add(Long.parseLong(s));
 		}
 		
 		Collections.sort(duplicateList_sort);
 		System.out.println("정렬 결과 : "+duplicateList_sort);
 		
 		
 		// 중복된 JobId의 길이만큼 검색
 		for (int i = 0; i < duplicateList_sort.size(); i++) {
 			
 			//y축 데이터를 담을 리스트
 			List<List<Long>> y_list = new ArrayList<>();
 			String labelName = "";
 			

 			//전체 데이터 검색 
 			for (int j = 0; j < ChartDatalist.size(); j++) {
 				
 				// duplicateList의 JobId와 ChartDatalist의 JobId를 비교후 맞으면 y_list리스트에 넣기
 				if(duplicateList_sort.get(i) == ChartDatalist.get(j).JobId) {
 					
 					SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
 					Date date = sdf.parse(ChartDatalist.get(j).StartDT.replace("T", " ").replace("-", "/"));
 					long millis = date.getTime();
 					List<Long> startDT_Duration = new ArrayList<>();
 					startDT_Duration.add(millis);
 					startDT_Duration.add((long)(Double.parseDouble(ChartDatalist.get(j).Duration)*1000));
 					y_list.add(startDT_Duration);
 					labelName = ChartDatalist.get(j).JobName;
 				}
 			}// 안쪽 for문 끝

 			ChartDataDTO ChartDataDTO = new ChartDataDTO();				// 데이터를 담아줄 ChartDataDTO객체
 			ChartDataDTO.setBorderColor("#39d353");		// 그래프 색 삽입
 			ChartDataDTO.setLabel(labelName);		// 그래프 라벨 삽입
 			ChartDataDTO.setY_data(y_list);			// y축 데이터 삽입, List<String> to String[]
 			ChartDataDTO.setX_data(StartDTList);	
 			System.out.println("와이리스트"+y_list);
 			ChartData.add(ChartDataDTO);// 가공된 ChartDataDTO를 ChartData 리스트에 추가
 			
 		} // 바깥 for문 끝
 		
 		return ChartData;
 	}
 	
 	@ResponseBody
 	@RequestMapping(value= "/getDate.do", method= RequestMethod.GET)
 	public List<String> getDate(Model model, @RequestParam(value="st") String startDay, 
 			@RequestParam(value="et") String endDay) {
 		
 		System.out.println(startDay);
 		System.out.println(endDay);
 		
 		List<String> getdate = new ArrayList<>();
 		getdate.add(startDay);
 		getdate.add(endDay);
 		return getdate;
 	}

}
