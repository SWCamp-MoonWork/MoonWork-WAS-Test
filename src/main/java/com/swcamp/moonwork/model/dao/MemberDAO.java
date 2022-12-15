package com.swcamp.moonwork.model.dao;

import java.util.List;

import com.swcamp.moonwork.model.dto.MemberDTO;

public interface MemberDAO {
	public void insert(MemberDTO dto); 	// create. 회원 등록
	public List<MemberDTO> list();     	// read. 회원 리스트 조회
	public MemberDTO detail(String id);	// read. 회원 상세정보 조회
	public void update(MemberDTO dto);	// update. 회원 정보 수정
	public void delete(String id);		// delete. 회원 정보 삭제

	
	// update, delete 시 password 체크
	public boolean check_password(String id, String password);

}
