package com.jns.member.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jns.chabun.service.ChabunService;
import com.jns.common.ChabunUtil;
import com.jns.member.service.MemberService;
import com.jns.member.vo.MemberVO;

@Controller
public class MemberController {

	Logger logger = Logger.getLogger(MemberController.class);

	//컨트롤러에서 서비스연결하기

	private MemberService memberService;

	private ChabunService chabunService;

	//생성자에 @Autowired 어노테이션으로 DI : 의존성 주입하기
	@Autowired(required=false)
	public MemberController(MemberService memberService,
							ChabunService chabunService
							)
	{this.memberService=memberService;
	this.chabunService=chabunService;}
	
	//회원 가입 화면
	@RequestMapping(value="MemberForm", method=RequestMethod.GET)
	public String member() {
	
		logger.info("MemberController member 함수 시작 >>> : ");

		return "/MemberForm";
	}
	
	// 회원 등록 
	@RequestMapping(value="memInsert",method=RequestMethod.POST)
	public String memInsert(MemberVO mvo, Model model) {
	//public String memInsert(HttpServletRequest req) 
		logger.info("MemberController memInsert 함수 시작 >>> : ");
		
		//MemberVO mvo = null;
		mvo = new MemberVO();
		
//		//mvo.getMlevel();
//		mvo.getMid();
//		mvo.getMpw();
//		mvo.getMnick();
//		mvo.getMhp();
//		mvo.getMemail();
//		mvo.getMaddr();
//		mvo.getMzipcode();
//		mvo.getMaddrdetail();
//		mvo.getMphoto();

		
		String maddr ="";
		mvo.setMaddr(maddr);
	
		
		
		// 회원번호 채번 가져오기
		String mno = ChabunUtil.getMemberChabun("M", chabunService.getMemberChabun().getMno());
		mvo.setMno(mno);
		
		
		logger.info("MemberController MemberInsert mno >>> : " + mno);
		System.out.println(mno);
		
		// memInsert 함수에서 서비스 호출하기 
		int nCnt = memberService.MemberInsert(mvo);
		logger.info("MemberController memInsert >>> : " + nCnt + " 건 입력 되었습니다.");
		
		if (nCnt == 1) {
			return "/memInsert";	
		}
		
		return "/MemberForm";
				
				
	}
	
	//회원전체 조회 
	@RequestMapping(value="memSelectAll",method=RequestMethod.GET)
	public String MemberSelectAll(MemberVO mvo, Model model) {
		
		logger.info("MemberController MemberSelectAll 함수 시작 >>> :: ");
		logger.info("mvo >>> :: "+ mvo);
		
		List<MemberVO> listAll = memberService.MemberSelectAll(mvo);
		
		int nCnt = listAll.size();
		logger.info("MemberController MemberSelectAll nCnt >>>> ::: " + nCnt);
		
		if(nCnt > 0) {
			model.addAttribute("listAll", listAll);
			return "mem/memSelectAll";
		}
		
		return "MemberForm";
	}
	
	//회원 조회 : 선택 조회
	@RequestMapping(value="memSelect",method=RequestMethod.GET)
	public String MemberSelect(MemberVO mvo, Model model) {
		
		logger.info("MemberController MemberSelect 함수 시작 >>> :: ");
		logger.info("mvo >>> :: "+ mvo);
		
		logger.info("MemberController MemberSelect mvo.getMno() >>> : " + mvo.getMno());
		List<MemberVO> listS = memberService.MemberSelect(mvo);
		int nCnt = listS.size();
		logger.info("MemberController MemberSelect nCnt >>> : " + nCnt);
		
		if(nCnt==1) {
			model.addAttribute("listS", listS);
			return "mem/memSelect";
		}
		
		return "MemberForm";
	}
	
	//회원 수정 
	@RequestMapping(value="memUpdate",method=RequestMethod.GET)
	public String MemberUpdate(MemberVO mvo , Model model) {
		
		logger.info("MemberController MemberUpdate 함수 시작 >>> :: ");
		logger.info("mvo >>> :: "+ mvo);
		
		logger.info("mvo.getMno()"+mvo.getMno());
		logger.info("mvo.getMaddr()"+mvo.getMaddr());
		logger.info("mvo.getMnick()"+mvo.getMnick());
		logger.info("mvo.getMphoto())"+mvo.getMphoto());
		
		int nCnt = memberService.MemberUpdate(mvo);
		logger.info("MemberController MemberUpdate nCnt >>> : " + nCnt);
		
		if(nCnt==1) {
			return "mem/memUpdate";
		}
		return "MemberForm";
	}
	
	
	//회원 삭제
	@RequestMapping(value="memDelete", method=RequestMethod.GET)
	public String memDelete(MemberVO mvo, Model model) {
		logger.info("MemberController MemberDelete 함수 진입 >>> : ");
		logger.info("mvo >>> : " + mvo);
				
		logger.info("mvo.getMno() >>> : " + mvo.getMno());
		int nCnt = memberService.MemberDelete(mvo);
		logger.info("MemberController MemberDelete nCnt >>> : " + nCnt);
		
		if (nCnt == 1) {
			return "mem/memDelete";
		}		
		return "MemberForm";		
	}
	
	// 아이디 중복 체크
	@RequestMapping(value="/CheckID",method=RequestMethod.POST)
	public String CheckID(MemberVO mvo) {
		logger.info("MemberController CheckID 함수 진입 >>> : ");
		logger.info("MemberController CheckID mvo.getMid()  >>> : " + mvo.getMid());
		
		List<MemberVO> listAll = memberService.CheckID(mvo);
		
		if(listAll.size()==0) {
			return "ID_GOOD";
		}else {
		
			return "";
		}
	}
	// login page 보여주는 함수
	// spring security의 검증이 확인되면 이쪽 함수를 탄다
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String memberlogin() {
		System.out.println("login 입니다 >>>> ");

		return "/login/login";
	}

	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String main() {
		logger.info("main page 진입 >>> ");

		return "main";
	}

	@RequestMapping(value="admin/main", method=RequestMethod.GET)
	public String adminMain() {
		logger.info("admin main page 진입 >>> ");

		return "/admin/admin_main";
	}
	
	/*
	 * @RequestMapping(value="j_spring_security_logout", method=RequestMethod.GET)
	 * public String memberLogout() { logger.info("admin main page 진입 >>> ");
	 * 
	 * return "main";
	 * 
	 * 
	 * }
	 */	
}