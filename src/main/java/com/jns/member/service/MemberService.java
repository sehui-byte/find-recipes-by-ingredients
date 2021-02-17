package com.jns.member.service;

import java.util.List;

import com.jns.member.vo.MemberVO;

public interface MemberService {

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
	
	// 아이디 찾기
	public List<MemberVO> memberFindIDOK(MemberVO mvo);
	
	// 임시 비밀번호 발급용 회원 정보 조회
	public List<MemberVO> memberTempPW(MemberVO mvo);

	// 임시 비밀번호 발급
	public int memberTempPWOK(MemberVO mvo);
	

}