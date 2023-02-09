package com.swcamp.moonwork.controller;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class JobHistoryController {

    @RequestMapping(value = "/jobhistory.do", method = RequestMethod.GET)
    public String home(Locale locale, Model model) {
 	
 	   return "jobhistory/JobHistory";
    }
}
