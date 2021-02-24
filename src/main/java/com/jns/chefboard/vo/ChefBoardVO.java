package com.jns.chefboard.vo;

public class ChefBoardVO {
	
	private String rbno;
	private String mno;
	private String rcp_nm;
	private int views;
	private int hits;
	private String rcp_way2;
	private String rcp_pat2;
	private String hash_tag;
	private String main_img;
	private String rcp_parts_dtls;
	private String manual01;
	private String manual_img01;
	private String manual02;
	private String manual_img02;
	private String manual03;
	private String manual_img03;
	private String manual04;
	private String manual_img04;
	private String manual05;
	private String manual_img05;
	private String manual06;
	private String manual_img06;
	private String manual07;
	private String manual_img07;
	private String manual08;
	private String manual_img08;
	private String manual09;
	private String manual_img09;
	private String manual10;
	private String manual_img10;
	private String manual11;
	private String manual_img11;
	private String manual12;
	private String manual_img12;
	private String manual13;
	private String manual_img13;
	private String manual14;
	private String manual_img14;
	private String manual15;
	private String 	manual_img15;
	private String manual16;
	private String 	manual_img16;
	private String manual17;
	private String manual_img17;
	private String manual18;
	private String manual_img18;
	private String manual19;
	private String manual_img19;
	private String manual20;
	private String manual_img20;
	private String rb_insertdate;
	private String rb_updatedate;
	private String rb_deleteyn;

	// MEMBER JOIN *************************************************
	private String mlevel;
	private String mnick;
	
	public String getMlevel() {
		return mlevel;
	}

	public void setMlevel(String mlevel) {
		this.mlevel = mlevel;
	}
	
	public String getMnick() {
		return mnick;
	}

	public void setMnick(String mnick) {
		this.mnick = mnick;
	}
	
	//**************************************************************

	// CHEF JOIN ***************************************************
	private String ino;
	
	public String getIno() {
		return ino;
	}

	public void setIno(String ino) {
		this.ino = ino;
	}

	//**************************************************************
	
	//**************************
	//검색 설정
	private String keyfilter;
	private String keyword;
	private String startdate;
	private String enddate;	
	
	public String getKeyfilter() {
		return keyfilter;
	}

	public void setKeyfilter(String keyfilter) {
		this.keyfilter = keyfilter;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getStartdate() {
		return startdate;
	}

	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}

	public String getEnddate() {
		return enddate;
	}

	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	//**************************************************************	

	public ChefBoardVO() {}

	public ChefBoardVO(String rbno, String mno, String rcp_nm, int views, int hits, String rcp_way2,
			String rcp_pat2, String hash_tag, String main_img, String rcp_parts_dtls, String manual01,
			String manual_img01, String manual02, String manual_img02, String manual03, String manual_img03,
			String manual04, String manual_img04, String manual05, String manual_img05, String manual06,
			String manual_img06, String manual07, String manual_img07, String manual08, String manual_img08,
			String manual09, String manual_img09, String manual10, String manual_img10, String manual11,
			String manual_img11, String manual12, String manual_img12, String manual13, String manual_img13,
			String manual14, String manual_img14, String manual15, String manual_img15, String manual16,
			String manual_img16, String manual17, String manual_img17, String manual18, String manual_img18,
			String manual19, String manual_img19, String manual20, String manual_img20, String rb_insertdate,
			String rb_updatedate, String rb_deleteyn) 
	{
		this.rbno = rbno;
		this.mno = mno;
		this.rcp_nm = rcp_nm;
		this.views = views;
		this.hits = hits;
		this.rcp_way2 = rcp_way2;
		this.rcp_pat2 = rcp_pat2;
		this.hash_tag = hash_tag;
		this.main_img = main_img;
		this.rcp_parts_dtls = rcp_parts_dtls;
		this.manual01 = manual01;
		this.manual_img01 = manual_img01;
		this.manual02 = manual02;
		this.manual_img02 = manual_img02;
		this.manual03 = manual03;
		this.manual_img03 = manual_img03;
		this.manual04 = manual04;
		this.manual_img04 = manual_img04;
		this.manual05 = manual05;
		this.manual_img05 = manual_img05;
		this.manual06 = manual06;
		this.manual_img06 = manual_img06;
		this.manual07 = manual07;
		this.manual_img07 = manual_img07;
		this.manual08 = manual08;
		this.manual_img08 = manual_img08;
		this.manual09 = manual09;
		this.manual_img09 = manual_img09;
		this.manual10 = manual10;
		this.manual_img10 = manual_img10;
		this.manual11 = manual11;
		this.manual_img11 = manual_img11;
		this.manual12 = manual12;
		this.manual_img12 = manual_img12;
		this.manual13 = manual13;
		this.manual_img13 = manual_img13;
		this.manual14 = manual14;
		this.manual_img14 = manual_img14;
		this.manual15 = manual15;
		this.manual_img15 = manual_img15;
		this.manual16 = manual16;
		this.manual_img16 = manual_img16;
		this.manual17 = manual17;
		this.manual_img17 = manual_img17;
		this.manual18 = manual18;
		this.manual_img18 = manual_img18;
		this.manual19 = manual19;
		this.manual_img19 = manual_img19;
		this.manual20 = manual20;
		this.manual_img20 = manual_img20;
		this.rb_insertdate = rb_insertdate;
		this.rb_updatedate = rb_updatedate;
		this.rb_deleteyn = rb_deleteyn;
	}
	
	public String getRbno() {
		return rbno;
	}

	public void setRbno(String rbno) {
		this.rbno = rbno;
	}

	public String getMno() {
		return mno;
	}

	public void setMno(String mno) {
		this.mno = mno;
	}
	
	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public int getHits() {
		return hits;
	}

	public void setHits(int hits) {
		this.hits = hits;
	}

	public String getRcp_nm() {
		return rcp_nm;
	}

	public void setRcp_nm(String rcp_nm) {
		this.rcp_nm = rcp_nm;
	}

	public String getRcp_way2() {
		return rcp_way2;
	}

	public void setRcp_way2(String rcp_way2) {
		this.rcp_way2 = rcp_way2;
	}

	public String getRcp_pat2() {
		return rcp_pat2;
	}

	public void setRcp_pat2(String rcp_pat2) {
		this.rcp_pat2 = rcp_pat2;
	}

	public String getHash_tag() {
		return hash_tag;
	}

	public void setHash_tag(String hash_tag) {
		this.hash_tag = hash_tag;
	}

	public String getMain_img() {
		return main_img;
	}

	public void setMain_img(String main_img) {
		this.main_img = main_img;
	}

	public String getRcp_parts_dtls() {
		return rcp_parts_dtls;
	}

	public void setRcp_parts_dtls(String rcp_parts_dtls) {
		this.rcp_parts_dtls = rcp_parts_dtls;
	}

	public String getManual01() {
		return manual01;
	}

	public void setManual01(String manual01) {
		this.manual01 = manual01;
	}

	public String getManual_img01() {
		return manual_img01;
	}

	public void setManual_img01(String manual_img01) {
		this.manual_img01 = manual_img01;
	}

	public String getManual02() {
		return manual02;
	}

	public void setManual02(String manual02) {
		this.manual02 = manual02;
	}

	public String getManual_img02() {
		return manual_img02;
	}

	public void setManual_img02(String manual_img02) {
		this.manual_img02 = manual_img02;
	}

	public String getManual03() {
		return manual03;
	}

	public void setManual03(String manual03) {
		this.manual03 = manual03;
	}

	public String getManual_img03() {
		return manual_img03;
	}

	public void setManual_img03(String manual_img03) {
		this.manual_img03 = manual_img03;
	}

	public String getManual04() {
		return manual04;
	}

	public void setManual04(String manual04) {
		this.manual04 = manual04;
	}

	public String getManual_img04() {
		return manual_img04;
	}

	public void setManual_img04(String manual_img04) {
		this.manual_img04 = manual_img04;
	}

	public String getManual05() {
		return manual05;
	}

	public void setManual05(String manual05) {
		this.manual05 = manual05;
	}

	public String getManual_img05() {
		return manual_img05;
	}

	public void setManual_img05(String manual_img05) {
		this.manual_img05 = manual_img05;
	}

	public String getManual06() {
		return manual06;
	}

	public void setManual06(String manual06) {
		this.manual06 = manual06;
	}

	public String getManual_img06() {
		return manual_img06;
	}

	public void setManual_img06(String manual_img06) {
		this.manual_img06 = manual_img06;
	}

	public String getManual07() {
		return manual07;
	}

	public void setManual07(String manual07) {
		this.manual07 = manual07;
	}

	public String getManual_img07() {
		return manual_img07;
	}

	public void setManual_img07(String manual_img07) {
		this.manual_img07 = manual_img07;
	}

	public String getManual08() {
		return manual08;
	}

	public void setManual08(String manual08) {
		this.manual08 = manual08;
	}

	public String getManual_img08() {
		return manual_img08;
	}

	public void setManual_img08(String manual_img08) {
		this.manual_img08 = manual_img08;
	}

	public String getManual09() {
		return manual09;
	}

	public void setManual09(String manual09) {
		this.manual09 = manual09;
	}

	public String getManual_img09() {
		return manual_img09;
	}

	public void setManual_img09(String manual_img09) {
		this.manual_img09 = manual_img09;
	}

	public String getManual10() {
		return manual10;
	}

	public void setManual10(String manual10) {
		this.manual10 = manual10;
	}

	public String getManual_img10() {
		return manual_img10;
	}

	public void setManual_img10(String manual_img10) {
		this.manual_img10 = manual_img10;
	}

	public String getManual11() {
		return manual11;
	}

	public void setManual11(String manual11) {
		this.manual11 = manual11;
	}

	public String getManual_img11() {
		return manual_img11;
	}

	public void setManual_img11(String manual_img11) {
		this.manual_img11 = manual_img11;
	}

	public String getManual12() {
		return manual12;
	}

	public void setManual12(String manual12) {
		this.manual12 = manual12;
	}

	public String getManual_img12() {
		return manual_img12;
	}

	public void setManual_img12(String manual_img12) {
		this.manual_img12 = manual_img12;
	}

	public String getManual13() {
		return manual13;
	}

	public void setManual13(String manual13) {
		this.manual13 = manual13;
	}

	public String getManual_img13() {
		return manual_img13;
	}

	public void setManual_img13(String manual_img13) {
		this.manual_img13 = manual_img13;
	}

	public String getManual14() {
		return manual14;
	}

	public void setManual14(String manual14) {
		this.manual14 = manual14;
	}

	public String getManual_img14() {
		return manual_img14;
	}

	public void setManual_img14(String manual_img14) {
		this.manual_img14 = manual_img14;
	}

	public String getManual15() {
		return manual15;
	}

	public void setManual15(String manual15) {
		this.manual15 = manual15;
	}

	public String getManual_img15() {
		return manual_img15;
	}

	public void setManual_img15(String manual_img15) {
		this.manual_img15 = manual_img15;
	}

	public String getManual16() {
		return manual16;
	}

	public void setManual16(String manual16) {
		this.manual16 = manual16;
	}

	public String getManual_img16() {
		return manual_img16;
	}

	public void setManual_img16(String manual_img16) {
		this.manual_img16 = manual_img16;
	}

	public String getManual17() {
		return manual17;
	}

	public void setManual17(String manual17) {
		this.manual17 = manual17;
	}

	public String getManual_img17() {
		return manual_img17;
	}

	public void setManual_img17(String manual_img17) {
		this.manual_img17 = manual_img17;
	}

	public String getManual18() {
		return manual18;
	}

	public void setManual18(String manual18) {
		this.manual18 = manual18;
	}

	public String getManual_img18() {
		return manual_img18;
	}

	public void setManual_img18(String manual_img18) {
		this.manual_img18 = manual_img18;
	}

	public String getManual19() {
		return manual19;
	}

	public void setManual19(String manual19) {
		this.manual19 = manual19;
	}

	public String getManual_img19() {
		return manual_img19;
	}

	public void setManual_img19(String manual_img19) {
		this.manual_img19 = manual_img19;
	}

	public String getManual20() {
		return manual20;
	}

	public void setManual20(String manual20) {
		this.manual20 = manual20;
	}

	public String getManual_img20() {
		return manual_img20;
	}

	public void setManual_img20(String manual_img20) {
		this.manual_img20 = manual_img20;
	}

	public String getRb_insertdate() {
		return rb_insertdate;
	}

	public void setRb_insertdate(String rb_insertdate) {
		this.rb_insertdate = rb_insertdate;
	}

	public String getRb_updatedate() {
		return rb_updatedate;
	}

	public void setRb_updatedate(String rb_updatedate) {
		this.rb_updatedate = rb_updatedate;
	}

	public String getRb_deleteyn() {
		return rb_deleteyn;
	}

	public void setRb_deleteyn(String rb_deleteyn) {
		this.rb_deleteyn = rb_deleteyn;
	}
	
	
}
