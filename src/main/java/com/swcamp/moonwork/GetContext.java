package com.swcamp.moonwork;

import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.core.env.ConfigurableEnvironment;
import org.springframework.core.env.MutablePropertySources;
import org.springframework.core.io.support.ResourcePropertySource;

public class GetContext {

	
	public static String GenericXmlApplicationContext() throws Exception {
		
		// 컨테이너 생성
		GenericXmlApplicationContext ctx 
				= new GenericXmlApplicationContext();
		
		// 환경변수 관리 객체 생성
		ConfigurableEnvironment env = ctx.getEnvironment();
		
		// 프로퍼티 관리 객체 생성
		MutablePropertySources prop = env.getPropertySources();
		
		// 프로퍼티 관리 객체에 프로퍼티 파일 추가
		prop.addLast
			(new ResourcePropertySource("classpath:global.properties"));
		
		// 프로퍼티 정보 얻기
		String ip = env.getProperty("ServerIp");
		
		return ip;
	}
}
