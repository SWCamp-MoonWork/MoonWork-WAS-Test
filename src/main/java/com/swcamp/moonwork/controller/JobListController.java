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
public class JobListController {

    @Autowired
    MemberDAO memberDao;	// 인터페이스 객체
    
    @RequestMapping(value = "/joblist.do", method = RequestMethod.GET)
    public String joblist(Locale locale, Model model) {
    	
    	List<MemberDTO> list = memberDao.list();
     	
  	   // model에 items이라는 이름으로 담아서 전달
  	   model.addAttribute("items", list);	// "변수명", value
 	
 	   return "joblist/JobList";
    }
    
    @RequestMapping(value = "/jobdetails.do", method = RequestMethod.GET)
    public String addjob(Locale locale, Model model) {

 	
 	   return "joblist/JobDetails";
    }
}
