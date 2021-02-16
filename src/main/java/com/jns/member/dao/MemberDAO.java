package com.jns.member.dao;

import java.util.List;

import com.jns.member.vo.MemberVO;

public interface MemberDAO {

	// 회원 전체 조회
	public List<MemberVO> memberSelectAll(MemberVO mvo);

	// 회원 조회
	public List<MemberVO> memberSelect(MemberVO mvo);

	// 회원 입력
	public int memberInsert(MemberVO mvo);

	// 회원 수정
	public int memberUpdate(MemberVO mvo);

	// 회원 삭제
	public int memberDelete(MemberVO mvo);

	// 아이디 중복 체크
	public List<MemberVO> checkID(MemberVO mvo);
	
	// 회원 로그인 >> MemberSecurityServiceImpl에서 호출
	public MemberVO memberLogin(MemberVO mvo);

}