package com.swcamp.moonwork.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.swcamp.moonwork.model.dao.MemberDAO;
import com.swcamp.moonwork.model.dto.MemberDTO;

@Controller
public class MemberController {

    @Autowired
    MemberDAO memberDao;	// 인터페이스 객체
 
    // 회원 리스트 조회
    @RequestMapping("member/list")
    public HashMap<String, Object> list(Model model) {
 	
 	   /* 인터페이스를 구현한 클래스(MemberDAOImpl)의 list() 호출 → mapper의 sql문 실행
 	   → 레코드들이 ArrayList로 만들어져서 넘어옴   */
 	List<MemberDTO> list = memberDao.list();
 	
 	   // model에 items이라는 이름으로 담아서 전달
 	   model.addAttribute("items", list);	// "변수명", value
 	   
 	   HashMap<String, Object> dataMap = new HashMap<String, Object>();
 	
 	   for(int i = 0; i<list.size(); i++) {
 		   dataMap.put("ID", list.get(i).getId());
 		   dataMap.put("Name", list.get(i).getName());
 		   dataMap.put("Email", list.get(i).getEmail());
 	   }
 	  model.addAttribute("dataMap", dataMap);
 	   System.out.println(dataMap);
 	   return dataMap;
    }
 
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