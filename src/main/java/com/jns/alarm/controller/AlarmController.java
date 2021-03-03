package com.jns.alarm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jns.alarm.service.AlarmService;
import com.jns.alarm.vo.AlarmVO;
import com.jns.common.Paging;
import com.jns.member.vo.MemberVO;

@Controller
public class AlarmController {

	Logger logger = Logger.getLogger(AlarmController.class);
	private AlarmService service;

	@Autowired(required=false)
	public AlarmController(AlarmService service) {
		this.service = service;
	}


	@RequestMapping("alarmList.do")
	public String alarmList(Model model) {
		AlarmVO avo = new AlarmVO();
		//로그인 사용자 mno 가져오기
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Object principal = auth.getPrincipal();
		String mno = ((MemberVO)principal).getMno();
		
		avo.setReceiver(mno);
		List<AlarmVO> list = service.selectAlarm(avo);
		int size = list.size();
		model.addAttribute("list", list);
		model.addAttribute("size", size);
		System.out.println("size >> " + size);
	
		return "alarm/alarmList";
	}
	
	@RequestMapping("updateReadYN.do")
	public String updateReadYN(@RequestBody AlarmVO avo) {
		System.out.println("updateReadYN");
		avo.setReadyn("Y"); //읽었을 경우 Y
		service.updateReadYN(avo);
		return "redirect:alarmList.do";
	}
	
}
