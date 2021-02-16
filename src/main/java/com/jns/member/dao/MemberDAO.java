package com.jns.member.dao;


public interface MemberDAO {
	
	//회원 전체 조회
	public List<MemberVO>MemberSelectAll(MemberVO mvo);
	
	//회원 조회
	public List<MemberVO>MemberSelect(MemberVO mvo);
	
	//회원 입력
	public int MemberInsert(MemberVO mvo);
		
	//회원 수정 
	public int MemberUpdate(MemberVO mvo);
	
	//회원 삭제
	public int MemberDelete(MemberVO mvo);
	
	
	//아이디 중복 체크
	public List<MemberVO> CheckID(MemberVO mvo);
	
	public MemberDetailsVO memberLogin(MemberDetailsVO mvo);

}