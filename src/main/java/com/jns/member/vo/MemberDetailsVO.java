package com.jns.member.vo;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class MemberDetailsVO implements UserDetails {

	private static final long serialVersionUID = 1L;

	private String mid;
	private String mpw;
	private String mlevel;
	private List<GrantedAuthority> authorities;

	// setter

	public void setMid(String mid) {
		this.mid = mid;
	}

	public void setMpw(String mpw) {
		this.mpw = mpw;
	}

	public void setMlevel(String mlevel) {
		this.mlevel = mlevel;
	}

	public void setAuthorities(List<String> authList) {

		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();

		for (int i = 0; i < authList.size(); i++) {
			authorities.add(new SimpleGrantedAuthority("ROLE_"+authList.get(i)));
		}

		this.authorities = authorities;
	}

	// getter

	public String getMid() {
		return mid;
	}

	public String getMpw() {
		return mpw;
	}

	public String getMlevel() {
		return mlevel;
	}

	// UserDetails 구현 함수

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