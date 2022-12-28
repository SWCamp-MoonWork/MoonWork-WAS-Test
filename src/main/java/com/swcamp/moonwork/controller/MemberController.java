package com.swcamp.moonwork.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.swcamp.moonwork.model.dao.MemberDAO;
import com.swcamp.moonwork.model.dto.MemberDTO;


@Controller
public class MemberController {

    @Autowired
    MemberDAO memberDao;	// 인터페이스 객체
 
 
    // 회원 등록 폼으로 이동
    @RequestMapping("member/write")
    public String write() {
 	   //System.out.println("MemberController로 왔음");
 	   return "member/write";
    }
 
    // 폼에 입력한 회원 정보 삽입
    @RequestMapping("member/insert")
    public String insert(@ModelAttribute MemberDTO dto) {
 	   memberDao.insert(dto);
 	   return "redirect:/member/list";	// 다시 목록으로
    }
 
    // 회원 상세정보 view
    @RequestMapping("member/view")		// 파라미터로 list.jsp에서 회원 id값 받음
    public String view(@RequestParam String id, Model model) {
 	
 	   // model에 회원 정보 담아서 전달
 	   model.addAttribute("dto", memberDao.detail(id));
 	
 	   return "member/detail";	// detail.jsp로 forwarding
    }
 
    //회원 정보 수정
    @RequestMapping("member/update")
    public String update(@ModelAttribute MemberDTO dto, Model model) {
 	
 	   // 비밀번호 체크
 	   boolean result = memberDao.check_password(dto.getId(), dto.getPassword());
 	
 	   if(result) {
 		   memberDao.update(dto);
 		   return "redirect:/member/list";
 	   } else {
 		   model.addAttribute("dto", dto);
 		   model.addAttribute("message", "비밀번호가 일치하지 않습니다.");
 		   return "member/detail";
 	   }
    }
 
    // 회원 정보 삭제
    @RequestMapping("member/delete")
    public String delete(@RequestParam String id, @RequestParam String password,
 		Model model) {
 	
 	   // 비밀번호 체크
 	   boolean result = memberDao.check_password(id, password);
 	
 	   if(result) {
 		   memberDao.delete(id);
 		   return "redirect:/member/list";
 	   } else {
 		   model.addAttribute("dto", memberDao.detail(id));
 		   model.addAttribute("message", "비밀번호가 일치하지 않습니다.");
 		   return "member/detail";
 	   }
    }
}