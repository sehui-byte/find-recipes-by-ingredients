package com.jns.member.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jns.chabun.service.ChabunService;
import com.jns.common.ChabunUtil;
import com.jns.member.service.MemberService;
import com.jns.member.vo.MemberVO;

@Controller
public class MemberController {

	Logger logger = Logger.getLogger(MemberController.class);

	// 컨트롤러에서 서비스연결하기

	private MemberService memberService;

	private ChabunService chabunService;

	// 생성자에 @Autowired 어노테이션으로 DI : 의존성 주입하기
	@Autowired(required = false)
	public MemberController(MemberService memberService, ChabunService chabunService) {
		this.memberService = memberService;
		this.chabunService = chabunService;
	}

	// 회원 가입 화면
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String member() {

		logger.info("MemberController member 함수 시작 >>> : ");

		return "/join";
	}

	// 회원 등록
	@RequestMapping(value = "memInsert", method = RequestMethod.POST)
	public String memInsert(MemberVO mvo, Model model) {
		// public String memInsert(HttpServletRequest req)
		logger.info("MemberController memInsert 함수 시작 >>> : ");

		// MemberVO mvo = null;
		mvo = new MemberVO();

		// 현재 널값나오는 거 수정 중

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

		String maddr = "";
		mvo.setMaddr(maddr);

		// 회원번호 채번 가져오기
		String mno = ChabunUtil.getMemberChabun("M", chabunService.getMemberChabun().getMno());
		mvo.setMno(mno);

		logger.info("MemberController MemberInsert mno >>> : " + mno);
		System.out.println(mno);

		// memInsert 함수에서 서비스 호출하기
		int nCnt = memberService.memberInsert(mvo);
		logger.info("MemberController memInsert >>> : " + nCnt + " 건 입력 되었습니다.");

		if (nCnt == 1) {
			return "/memInsert";
		}

		return "/MemberForm";

	}

	// 회원전체 조회
	@RequestMapping(value = "memSelectAll", method = RequestMethod.GET)
	public String MemberSelectAll(MemberVO mvo, Model model) {

		logger.info("MemberController MemberSelectAll 함수 시작 >>> :: ");
		logger.info("mvo >>> :: " + mvo);

		List<MemberVO> listAll = memberService.memberSelectAll(mvo);

		int nCnt = listAll.size();
		logger.info("MemberController MemberSelectAll nCnt >>>> ::: " + nCnt);

		if (nCnt > 0) {
			model.addAttribute("listAll", listAll);
			return "mem/memSelectAll";
		}

		return "MemberForm";
	}

	// 회원 조회 : 선택 조회
	@RequestMapping(value = "memSelect", method = RequestMethod.GET)
	public String MemberSelect(MemberVO mvo, Model model) {

		logger.info("MemberController MemberSelect 함수 시작 >>> :: ");
		logger.info("mvo >>> :: " + mvo);

		logger.info("MemberController MemberSelect mvo.getMno() >>> : " + mvo.getMno());
		List<MemberVO> listS = memberService.memberSelect(mvo);
		int nCnt = listS.size();
		logger.info("MemberController MemberSelect nCnt >>> : " + nCnt);

		if (nCnt == 1) {
			model.addAttribute("listS", listS);
			return "mem/memSelect";
		}

		return "MemberForm";
	}

	// 회원 수정
	@RequestMapping(value = "memUpdate", method = RequestMethod.GET)
	public String MemberUpdate(MemberVO mvo, Model model) {

		logger.info("MemberController MemberUpdate 함수 시작 >>> :: ");
		logger.info("mvo >>> :: " + mvo);

		logger.info("mvo.getMno()" + mvo.getMno());
		logger.info("mvo.getMaddr()" + mvo.getMaddr());
		logger.info("mvo.getMnick()" + mvo.getMnick());
		logger.info("mvo.getMphoto())" + mvo.getMphoto());

		int nCnt = memberService.memberUpdate(mvo);
		logger.info("MemberController MemberUpdate nCnt >>> : " + nCnt);

		if (nCnt == 1) {
			return "mem/memUpdate";
		}
		return "MemberForm";
	}

	// 회원 삭제
	@RequestMapping(value = "memDelete", method = RequestMethod.GET)
	public String memDelete(MemberVO mvo, Model model) {
		logger.info("MemberController MemberDelete 함수 진입 >>> : ");
		logger.info("mvo >>> : " + mvo);

		logger.info("mvo.getMno() >>> : " + mvo.getMno());
		int nCnt = memberService.memberDelete(mvo);
		logger.info("MemberController MemberDelete nCnt >>> : " + nCnt);

		if (nCnt == 1) {
			return "mem/memDelete";
		}
		return "MemberForm";
	}

	// 아이디 중복 체크
	@RequestMapping(value = "/CheckID", method = RequestMethod.POST)
	public String CheckID(MemberVO mvo) {
		logger.info("MemberController CheckID 함수 진입 >>> : ");
		logger.info("MemberController CheckID mvo.getMid()  >>> : " + mvo.getMid());

		List<MemberVO> listAll = memberService.checkID(mvo);

		if (listAll.size() == 0) {
			return "ID_GOOD";
		} else {

			return "";
		}
	}

	// 로그인 페이지
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String memberLogin() {
		logger.info("memberLogin page 진입 >>> ");

		return "/login/login";
	}

	// main 페이지
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String main() {
		logger.info("main page 진입 >>> ");

		return "main";
	}

	// id & pw 찾기 페이지
	@RequestMapping(value = "memberFindIDnPW", method = RequestMethod.GET)
	public String memberFindIDnPW() {

		logger.info("memberFindIDnPW 진입 >>> ");

		return "/login/findIDnPW";
	}

	// id 찾기 페이지
	@RequestMapping(value = "memberFindID", method =RequestMethod.GET)
	public String memberFindID(MemberVO mvo) {

		logger.info("memberFindID 진입 >>> ");

		return "/login/findID";
	}
	
	// id 찾기 >> db 구현
	@RequestMapping(value = "memberFindIDOK", method =RequestMethod.POST)
	@ResponseBody
	public String memberFindIDOK(MemberVO mvo) {
		
		logger.info("memberFindIDOK 진입 >>> ");
		
		logger.info(mvo.getMname());
		logger.info(mvo.getMemail());
		
		
		
		return "ok";
	}

	// 임시 비밀번호 발급 페이지
	@RequestMapping(value = "memberTempPW", method = RequestMethod.GET)

	public String memberTempPW() {
		logger.info("memberTempPW 진입 >>> ");

		return "/login/tempPW";
	}
}