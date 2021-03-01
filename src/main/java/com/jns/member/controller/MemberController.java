package com.jns.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.jns.chabun.service.ChabunService;
import com.jns.common.ChabunUtil;
import com.jns.common.FileUploadUtil;
import com.jns.common.Paging;
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
	@RequestMapping(value = "memberForm", method = RequestMethod.GET)
	public String member() {

		logger.info("MemberController member 함수 시작 >>> : ");

		return "mem/memberForm";
	}

	// 회원 등록
	@RequestMapping(value = "mem/memberInsert", method = RequestMethod.POST)
	@ResponseBody
	public String memInsert(MemberVO mvo, MultipartHttpServletRequest request) {
		logger.info("MemberController memInsert 함수 시작 >>> : ");

		// 회원번호 채번 가져오기
		String mno = ChabunUtil.getMemberChabun("D", chabunService.getMemberChabun().getMno());
		mvo.setMno(mno);
		
		logger.info("회원번호 >>> : " + mno);
		logger.info("회원 등급 >>>> :"+mvo.getMlevel());	
		logger.info("우편번호 , 주소  , 상세주소>>>>:"+mvo.getMzipcode()+mvo.getMaddr()+mvo.getMaddrdetail());
		logger.info("닉네임 >>>> :"+mvo.getMnick());
		logger.info("비밀번호  >>>> :"+mvo.getMpw());
		logger.info("아이디 >>>  :"+mvo.getMid());
		logger.info("이름 >>>> :"+mvo.getMname());
		logger.info("사진 >>>>  :"+mvo.getMphoto());
		logger.info("핸드폰 >>>>  :"+mvo.getMhp());
		logger.info("이메일 >>> = "+mvo.getMemail());
		
		
		String key = new FileUploadUtil().uploadFile(request, "member");
		logger.info("key >>> : " + key);
		mvo.setMphoto(key);
		
		// memInsert 함수에서 서비스 호출하기
		int nCnt = memberService.memberInsert(mvo);
		logger.info("MemberController memberInsert >>> : " + nCnt + " 건 입력 되었습니다.");

		if (nCnt == 1) {
			return "main";
		}

		return "/memberForm";
	}

	// 회원전체 조회
	@RequestMapping(value = "memberSelectAll", method = RequestMethod.GET)
	public String memberSelectAll(MemberVO mvo, Model model,HttpServletRequest request) {
		logger.info("MemberController MemberSelectAll 함수 시작 >>> :: ");
		//logger.info("mvo >>> :: " + mvo);

		logger.info("회원번호 >>> : " + mvo.getMno());

		//페이징 세팅	
		int totalCnt =0;
		String mPage = request.getParameter("curPage");
		String pageCtrl = request.getParameter("pageCtrl");
		
		Paging.setPage(mvo, mPage, pageCtrl);
		
		List<MemberVO> listPage = memberService.memberSelectAllPage(mvo);
		logger.info("member page >>> memberSelectAll listPage.size() "+listPage.size());
		
		if( listPage.size() != 0) {
			totalCnt = listPage.get(0).getTotalCount(); // 쿼리 조회한 리스트의 0번 인덱스에 담긴 totalCount값
			mvo.setTotalCount(totalCnt);				// vo에 담기
		}

		model.addAttribute("listPage", listPage);
		model.addAttribute("p_mvo", mvo);

		return "mem/memberSelectAll";
	}

/*
	// 회원전체 조회
	@RequestMapping(value = "memberSelectAllPage", method = RequestMethod.GET)
	public String memberSelectAllPage(MemberVO mvo, Model model,HttpServletRequest request) {

		logger.info("MemberController MemberSelectAll 함수 시작 >>> :: ");
		//logger.info("mvo >>> :: " + mvo);

		logger.info("회원번호 >>> : " + mvo.getMno());
		List<MemberVO> listAll = memberService.memberSelectAll(mvo);
		logger.info("MemberController MemberSelectAll >>>> ::: " + listAll.size());


		//페이징 세팅	
		int totalCnt =0;
		String mPage = request.getParameter("curPage");
		String pageCtrl = request.getParameter("pageCtrl");
		
		Paging.setPage(mvo, mPage, pageCtrl);
		
		List<MemberVO> listPage = memberService.memberSelectAllPage(mvo);
		logger.info("member page >>> memberSelectAll listPage.size() "+listPage.size());
		
		if( listPage.size() != 0) {
			totalCnt = listPage.get(0).getTotalCount(); // 쿼리 조회한 리스트의 0번 인덱스에 담긴 totalCount값
			mvo.setTotalCount(totalCnt);				// vo에 담기
		}

		model.addAttribute("listPage", listPage);
		model.addAttribute("p_mvo", mvo);
		
		return "mem/memberSelectAllpage";
	}
*/	

	
	
	// 회원 조회 : 선택 조회
	@RequestMapping(value = "memberSelect", method = RequestMethod.GET)
	public String memberSelect(MemberVO mvo, Model model) {

		logger.info("MemberController MemberSelect 함수 시작 >>> :: ");
		logger.info("mvo >>> :: " + mvo);

		logger.info("MemberController MemberSelect mvo.getMno() >>> : " + mvo.getMno());
		List<MemberVO> listS = memberService.memberSelect(mvo);
		
		int nCnt = listS.size();
		logger.info("MemberController MemberSelect nCnt >>> : " + nCnt);

		if (nCnt > 0) {
			model.addAttribute("listS", listS);
			return "mem/memberSelect";
		}

		return "mem/memberForm";
	}


	// 회원 수정
	@RequestMapping(value = "memberUpdate", method = RequestMethod.GET)
	public String memberUpdate(MemberVO mvo, Model model) {

		logger.info("MemberController MemberUpdate 함수 시작 >>> :: ");
		logger.info("mvo >>> :: " + mvo);

		logger.info("mvo.getMno()" + mvo.getMno());
		logger.info("mvo.getMnick()" + mvo.getMnick());
		logger.info("mvo.getMlevel()"+mvo.getMlevel());

		int nCnt = memberService.memberUpdate(mvo);
		logger.info("MemberController MemberUpdate nCnt >>> : " + nCnt);

		if (nCnt == 1) {
			return "mem/memberUpdate";
		}
		return "/main";
	}

	// 회원 삭제

	@RequestMapping(value = "memberDelete", method = RequestMethod.GET)
	public String memDelete(MemberVO mvo, Model model) {
		logger.info("MemberController MemberDelete 함수 진입 >>> : ");
			

		logger.info("mvo.getMno() >>> : " + mvo.getMno());
		int nCnt = memberService.memberDelete(mvo);
		logger.info("MemberController MemberDelete nCnt >>> : " + nCnt);

		if (nCnt > 0) {
			return "mem/memberDelete";
		}
		return "/main";
	}
	

	// 아이디 중복 체크
	@RequestMapping(value = "mem/checkID.do", method = RequestMethod.GET)
	@ResponseBody
	public boolean checkID(MemberVO mvo) {
		logger.info("MemberController CheckID 함수 진입 >>> : ");
		logger.info("MemberController CheckID mvo.getMid()  >>> : " + mvo.getMid());

		List<MemberVO> listAll = memberService.checkID(mvo);
		logger.info("아이디 중복체크 결과 >> " + listAll.size());
		if (listAll.size() == 0) {
			return true;
		} else {
			return false;
		}
	}

	// 로그인 페이지
	@RequestMapping(value = "login", method = {RequestMethod.POST, RequestMethod.GET})
	public String memberLogin(HttpServletRequest request) {
		logger.info("memberLogin page 진입 >>> ");
		
		String uri = request.getHeader("Referer");
		if(!uri.contains("/login")){
			request.getSession().setAttribute("prevPage", request.getHeader("Refer"));
		}

		return "mem/login/login";
	}
	
	// 로그인 실패
	@RequestMapping(value="login/loginFail", method=RequestMethod.POST)
	public String memberLoginFail() {
		logger.info("memberLoginFail 진입 >>> ");
	
		return "mem/login/loginFail";
	}
	
	// 접근 불가
	@RequestMapping(value="login/accessDenied")
	public String memberAccessDeny() {

		return "mem/login/accessDenied";
	}
	

	// main 페이지 >> 나중에 없애기
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String main() {
		logger.info("main page 진입 >>> ");

		return "main";
	}

	// id & pw 찾기 페이지
	@RequestMapping(value = "memberFindIDnPW", method = RequestMethod.GET)
	public String memberFindIDnPW() {

		logger.info("memberFindIDnPW 진입 >>> ");

		return "mem/login/findIDnPW";
	}

	// id 찾기 페이지
	@RequestMapping(value = "memberFindID", method = RequestMethod.GET)
	public String memberFindID(MemberVO mvo) {

		logger.info("memberFindID 진입 >>> ");

		return "mem/login/findID";
	}

	// id 찾기 >> db 구현
	@RequestMapping(value = "memberFindIDOK", method = RequestMethod.POST)
	@ResponseBody
	public String memberFindIDOK(MemberVO mvo) {

		logger.info("memberFindIDOK 진입 >>> ");

		logger.info(mvo.getMname());
		logger.info(mvo.getMemail());

		List<MemberVO> aList = memberService.memberFindIDOK(mvo);

		if (aList.size() == 1) {
			return "OK";
		} else {
			return "ERROR";
		}
	}

	// 임시 비밀번호 발급 페이지
	@RequestMapping(value = "memberTempPW", method = RequestMethod.GET)
	public String memberTempPW() {
		logger.info("memberTempPW 진입 >>> ");

		return "mem/login/tempPW";
	}

	// 임시 비밀번호 발급 >> db 구현
	@RequestMapping(value = "memberFindPWOK", method = RequestMethod.POST)
	@ResponseBody
	public String memberTempPWOK(MemberVO _mvo) {

		logger.info("memberTempPWOK 진입 >>> ");

		logger.info(_mvo.getMid());
		logger.info(_mvo.getMemail());

		List<MemberVO> aList = memberService.memberTempPW(_mvo);

		// 입력된 회원 정보 부합 여부
		if (aList.size() == 1) {

			MemberVO mvo = null;
			mvo = aList.get(0);
			int result = memberService.memberTempPWOK(mvo);

			// 임시 비밀번호가 비밀번호에 정상 발급 되었는지?
			if (result == 1) {
				return "OK";
			} else {
				return "ERROR_TEMPPW";
			}
		} else {
			return "ERROR_INFO";
		}
	}

}