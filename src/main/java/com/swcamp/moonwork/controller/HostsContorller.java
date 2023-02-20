package com.swcamp.moonwork.controller;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.swcamp.moonwork.model.dto.HostDTO;
import com.swcamp.moonwork.model.dto.JobDTO;

import net.sf.json.JSONObject;

@Controller
@PropertySource(value = "classpath:/global.properties")
public class HostsContorller {
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

	@RequestMapping(value = "/hosts.do", method = RequestMethod.GET)
	public String addjob(Locale locale, Model model) {

		ResponseEntity<List<HostDTO>> result = restTemplate.exchange(ServerIp_host + "/list", HttpMethod.GET,
				null, new ParameterizedTypeReference<List<HostDTO>>() {
				});
		List<HostDTO> list = result.getBody();
		System.out.println("response (/host/list)= " + result);
		model.addAttribute("hosts", list);
		return "hosts/Hosts";
	}
}
