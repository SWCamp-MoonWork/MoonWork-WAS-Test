package com.swcamp.moonwork.controller;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.swcamp.moonwork.model.dao.MemberDAO;
import com.swcamp.moonwork.model.dto.MemberDTO;

@Controller
public class DashboardController {
	

    @Autowired
    MemberDAO memberDao;	// 인터페이스 객체
    
    //대시보드 메인
    @RequestMapping("/dashboard.do")
    public String list(Locale locale, Model model) {
 	
 	   /* 인터페이스를 구현한 클래스(MemberDAOImpl)의 list() 호출 → mapper의 sql문 실행
 	   → 레코드들이 ArrayList로 만들어져서 넘어옴   */
 	List<MemberDTO> list = memberDao.list();
 	
 	   // model에 items이라는 이름으로 담아서 전달
 	   model.addAttribute("items", list);	// "변수명", value
 	
 	   return "Dashboard/dashboard";
    }
    
    
    // jsgrid 데이터 띄우기
    @RequestMapping(value = "/jsgrid.do", method= {RequestMethod.GET , RequestMethod.POST})
    @ResponseBody
    public List<MemberDTO> jsgrid(Model model) {

 	List<MemberDTO> list = memberDao.list();

 	   
 	   return list;
    }
}
