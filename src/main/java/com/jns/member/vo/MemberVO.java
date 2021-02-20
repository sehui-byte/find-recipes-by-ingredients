package com.jns.member.vo;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class MemberVO implements UserDetails {

	private static final long serialVersionUID = 1L;

	private String mno;
	private String mlevel;
	private String mid;
	private String mpw;
	private String mname;
	private String mnick;
	private String mhp;
	private String memail;
	private String maddr;
	private String mzipcode;
	private String maddrdetail;
	private String mphoto;
	private String minsertdate;
	private String mupdatedate;
	private String mdeleteyn;

	// 검색 설정
	private String keyfilter;
	private String keyword;
	private String startdate;
	private String enddate;

	// spring security 권한 관련 변수
	private List<GrantedAuthority> authorities;
	
	public MemberVO() {
	
	}
	
	public MemberVO(String mno, String mlevel, String mid, String mpw, String mname, String mnick, String mhp,
			String memail, String maddr, String mzipcode, String maddrdetail, String mphoto, String minsertdate,
			String mupdatedate, String mdeleteyn, String keyfilter, String keyword, String startdate, String enddate,
			List<GrantedAuthority> authorities) {
		this.mno = mno;
		this.mlevel = mlevel;
		this.mid = mid;
		this.mpw = mpw;
		this.mname = mname;
		this.mnick = mnick;
		this.mhp = mhp;
		this.memail = memail;
		this.maddr = maddr;
		this.mzipcode = mzipcode;
		this.maddrdetail = maddrdetail;
		this.mphoto = mphoto;
		this.minsertdate = minsertdate;
		this.mupdatedate = mupdatedate;
		this.mdeleteyn = mdeleteyn;
		this.keyfilter = keyfilter;
		this.keyword = keyword;
		this.startdate = startdate;
		this.enddate = enddate;
		this.authorities = authorities;
	}

	// setter
	public void setMno(String mno) {
		this.mno = mno;
	}

	public void setMlevel(String mlevel) {
		this.mlevel = mlevel;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public void setMpw(String mpw) {
		this.mpw = mpw;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public void setMnick(String mnick) {
		this.mnick = mnick;
	}

	public void setMhp(String mhp) {
		this.mhp = mhp;
	}

	public void setMemail(String memail) {
		this.memail = memail;
	}

	public void setMaddr(String maddr) {
		this.maddr = maddr;
	}

	public void setMzipcode(String mzipcode) {
		this.mzipcode = mzipcode;
	}

	public void setMaddrdetail(String maddrdetail) {
		this.maddrdetail = maddrdetail;
	}

	public void setMphoto(String mphoto) {
		this.mphoto = mphoto;
	}

	public void setMinsertdate(String minsertdate) {
		this.minsertdate = minsertdate;
	}

	public void setMupdatedate(String mupdatedate) {
		this.mupdatedate = mupdatedate;
	}

	public void setMdeleteyn(String mdeleteyn) {
		this.mdeleteyn = mdeleteyn;
	}

	public void setKeyfilter(String keyfilter) {
		this.keyfilter = keyfilter;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}

	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}

	public void setAuthorities(List<String> authList) {

		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();

		for (int i = 0; i < authList.size(); i++) {
			authorities.add(new SimpleGrantedAuthority("ROLE_" + authList.get(i)));
		}

		this.authorities = authorities;
	}

	// getter

	public String getMno() {
		return mno;
	}

	public String getMlevel() {
		return mlevel;
	}

	public String getMid() {
		return mid;
	}

	public String getMpw() {
		return mpw;
	}

	public String getMname() {
		return mname;
	}

	public String getMnick() {
		return mnick;
	}

	public String getMhp() {
		return mhp;
	}

	public String getMemail() {
		return memail;
	}

	public String getMaddr() {
		return maddr;
	}

	public String getMzipcode() {
		return mzipcode;
	}

	public String getMaddrdetail() {
		return maddrdetail;
	}

	public String getMphoto() {
		return mphoto;
	}

	public String getMinsertdate() {
		return minsertdate;
	}

	public String getMupdatedate() {
		return mupdatedate;
	}

	public String getMdeleteyn() {
		return mdeleteyn;
	}

	public String getKeyfilter() {
		return keyfilter;
	}

	public String getKeyword() {
		return keyword;
	}

	public String getStartdate() {
		return startdate;
	}

	public String getEnddate() {
		return enddate;
	}

	// Spring Security UserDetails 구현 함수

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {

		return authorities;
	}

	@Override
	public String getPassword() {

		return getMpw();
	}

	@Override
	public String getUsername() {

		return getMid();
	}

	@Override
	public boolean isAccountNonExpired() {

		return true;
	}

	@Override
	public boolean isAccountNonLocked() {

		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {

		return true;
	}

	@Override
	public boolean isEnabled() {

		return true;
	}

}