package com.jns.common;

public abstract class ChabunUtil {

	public static final String BIZ_GUBUN_M 	= "M"; // 회원 : MEMBER

	public static final String BIZ_GUBUN_B 	= "B"; // 일반게시판 : BOARD

	public static final String BIZ_GUBUN_N 	= "N"; // 공지사항 : NOTICE BOARD
	public static final String BIZ_GUBUN_Q = "Q"; // Q&A 게시판 

	public static final String BIZ_GUBUN_CB	= "CB"; // 쉐프 게시판 
	public static final String BIZ_GUBUN_CO = "CO"; // 신고게시판 
	public static final String BIZ_GUBUN_F	= "F"; // 즐겨찾기
	
	
	public static final String BIZ_GUBUN_SI	= "SI"; // 구독번호
	public static final String BIZ_GUBUN_I	= "I"; // 세프번호
	public static final String BIZ_GUBUN_O	= "O"; // 구매내역 번호
	public static final String BIZ_GUBUN_CA	= "CA"; // 장바구니 번호
	
//	public static final String BIZ_GUBUN_RB = "RB"; // 게시판 댓글: REPLY 
//	public static final String BIZ_GUBUN_BUY = "P"; // 구매게시판
	


	
	
	// type : D : 20210001, M : YYYYMM, Y : YYYY, N :  회원번호
	public static String numPad(String t, String c){
	
		for (int i=c.length(); i < 4; i++) {
			c = "0" + c;
		}				
		String ymd = DateFormatUtil.ymdFormats(t);
		
		return ymd.concat(c);
	}
	// 게시판 
	public static String numPad2(String t, String c){
		
		for (int i=c.length(); i < 4; i++) {
			c = "0" + c;
		}				
		String ymd = DateFormatUtil.ymdFormats(t);
		
		return ymd.concat(c);
	}
	
	//공지사항
	public static String numPad3(String t, String c){
		
		for (int i=c.length(); i < 4; i++) {
			c = "0" + c;
		}				
		String ymd = DateFormatUtil.ymdFormats(t);
		
		return ymd.concat(c);
	}
	//질문
	public static String numPad4(String t, String c){
		
		for (int i=c.length(); i < 4; i++) {
			c = "0" + c;
		}				
		String ymd = DateFormatUtil.ymdFormats(t);
		
		return ymd.concat(c);
	}
	//쉐프
	public static String numPad5(String t, String c){
		
		for (int i=c.length(); i < 4; i++) {
			c = "0" + c;
		}				
		String ymd = DateFormatUtil.ymdFormats(t);
		
		return ymd.concat(c);
	}
	
	// 즐겨찾기
	public static String numPad6(String t, String c){
		
		for (int i=c.length(); i < 4; i++) {
			c = "0" + c;
		}				
		String ymd = DateFormatUtil.ymdFormats(t);
		
		return ymd.concat(c);
	}
	//신고
	public static String numPad7(String t, String c){
		
		for (int i=c.length(); i < 4; i++) {
			c = "0" + c;
		}				
		String ymd = DateFormatUtil.ymdFormats(t);
		
		return ymd.concat(c);
	}
	
	//구독번호 
	public static String numPad8(String t, String c){
		
		for (int i=c.length(); i < 4; i++) {
			c = "0" + c;
		}				
		String ymd = DateFormatUtil.ymdFormats(t);
		
		return ymd.concat(c);
	}
	//세프번호 
	public static String numPad9(String t, String c){
		
		for (int i=c.length(); i < 4; i++) {
			c = "0" + c;
		}				
		String ymd = DateFormatUtil.ymdFormats(t);
		
		return ymd.concat(c);
	}
	
	//구매내역번호
	public static String numPad10(String t, String c){
		
		for (int i=c.length(); i < 4; i++) {
			c = "0" + c;
		}				
		String ymd = DateFormatUtil.ymdFormats(t);
		
		return ymd.concat(c);
	}
	
	
	
	// 회원 번호 
	public static String getMemberChabun(String type, String memNum) {
		
		return BIZ_GUBUN_M.concat(ChabunUtil.numPad(type, memNum));
	}
	
	// 일반게시판 글 번호  
	public static String getBoardChabun(String type, String memNum) {
		
		return BIZ_GUBUN_B.concat(ChabunUtil.numPad2(type, memNum));
	}
/**	
	// 게시판 댓글 글 번호  
	public static String getRboardChabun(String type, String memNum) {
		
		return BIZ_GUBUN_RB.concat(ChabunUtil.numPad(type, memNum));
	}
**/	
	// 공지사항  번호  
	public static String getNoticeChabun(String type, String memNum) {
		
		return BIZ_GUBUN_N.concat(ChabunUtil.numPad3(type, memNum));
	}
	
	
	// Q&A  번호  
	public static String getQnaBoardChabun(String type, String memNum) {
		
		return BIZ_GUBUN_Q.concat(ChabunUtil.numPad4(type, memNum));
	}
	
	// 쉐프게시판  번호  
	public static String getChiefBoardChabun(String type, String memNum) {
		
		return BIZ_GUBUN_CB.concat(ChabunUtil.numPad5(type, memNum));
	}
	
	// 구매게시판  번호  
//	public static String getProductChabun(String type, String memNum) {
		
//		return BIZ_GUBUN_P.concat(ChabunUtil.numPad(type, memNum));
//	}

	// 즐겨찾기 번호
	public static String getFavoriteChabun(String type, String memNum) {
		
		return BIZ_GUBUN_F.concat(ChabunUtil.numPad6(type, memNum));
	}
	
	// 신고 게시판  번호  
	public static String getComplBoardChabun(String type, String memNum) {
		
		return BIZ_GUBUN_CB.concat(ChabunUtil.numPad7(type, memNum));
	}
	
	// 구독 번호  
	public static String getSubinfoChabun(String type, String memNum) {
		
		return BIZ_GUBUN_SI.concat(ChabunUtil.numPad8(type, memNum));
	}
	
	// 세프 번호  
	public static String getChefChabun(String type, String memNum) {
		
		return BIZ_GUBUN_I.concat(ChabunUtil.numPad9(type, memNum));
	}
	
	// 구매내역  번호  
	public static String getOrderChabun(String type, String memNum) {
		
		return BIZ_GUBUN_O.concat(ChabunUtil.numPad10(type, memNum));
	}
	

	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		String c = "1";
		System.out.println("회원번호 >>> : " + ChabunUtil.getMemberChabun("D", c));
		System.out.println("일반레시피게시판>>> : " + ChabunUtil.getBoardChabun("D", c));
		//System.out.println(">>> : " + ChabunUtil.getRboardChabun("N", c));
		System.out.println("공지사항>>> : " + ChabunUtil.getNoticeChabun("D", c));
		System.out.println("질문게시판>>> : " + ChabunUtil.getQnaBoardChabun("D", c));
		System.out.println("쉐프게시판 >>> : " + ChabunUtil.getChiefBoardChabun("D", c));
//		System.out.println("구매게시판>>> : " + ChabunUtil.getProductBoardChabun("P", c));
		System.out.println("즐겨찾기 >>> : " + ChabunUtil.getFavoriteChabun("D", c));
		System.out.println("신고게시판 >>> : " + ChabunUtil.getComplBoardChabun("D", c));
		System.out.println("구독번호 >>> : " + ChabunUtil.getSubinfoChabun("D", c));
		System.out.println("신고게시판 >>> : " + ChabunUtil.getChefChabun("D", c));
		System.out.println("구매내역 >>> : " + ChabunUtil.getOrderChabun("D", c));
		
	}
}
