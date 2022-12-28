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
    public String home(Locale locale, Model model) {
 	
 	   return "JobList/joblist";
    }
}
