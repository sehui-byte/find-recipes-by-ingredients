package com.jns.alarm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jns.alarm.service.AlarmService;
import com.jns.alarm.vo.AlarmVO;
import com.jns.member.vo.MemberVO;

@Controller
public class AlarmController {

	private AlarmService service;

	@Autowired(required=false)
	public AlarmController(AlarmService service) {
		this.service = service;
	}


	@RequestMapping("alarmList.do")
	public String alarmList(Model model) {
		AlarmVO avo = new AlarmVO();
		//로그인 사용자 mid 가져오기
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Object principal = auth.getPrincipal();
		String mid = ((MemberVO)principal).getMid();
		
		avo.setReceiver(mid);
		List<AlarmVO> list = service.selectAlarm(avo);
		int size = list.size();
		model.addAttribute("list", list);
		model.addAttribute("size", size);
		System.out.println("size >> " + size);
		return "alarm/alarmList";
	}

}
