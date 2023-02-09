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
public class HostsContorller {

   
    
    @RequestMapping(value = "/hosts.do", method = RequestMethod.GET)
    public String addjob(Locale locale, Model model) {

 	
 	   return "hosts/Hosts";
    }
}
