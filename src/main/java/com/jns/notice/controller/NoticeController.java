package com.jns.notice.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.jns.board.vo.BoardVO;
import com.jns.chabun.service.ChabunService;
import com.jns.common.ChabunUtil;
import com.jns.common.FileUploadUtil;
import com.jns.common.Paging;
import com.jns.notice.service.NoticeService;
import com.jns.reply.vo.ReplyVO;

@Controller
public class NoticeController {

	Logger logger = Logger.getLogger(NoticeController.class);

	private NoticeService noticeService;
	private ChabunService chabunService; 

	// ������ Autowired 
	@Autowired(required=false)	
	public NoticeController( NoticeService noticeService,
			ChabunService chabunService
			) {
		this.noticeService = noticeService;
		this.chabunService = chabunService;

	}


	@RequestMapping(value="noticeForm", method=RequestMethod.GET)
	public String boardForm() {
		return "notice/noticeForm";
	}	

	//공지사항 최신순 3개 가져온다
	@RequestMapping(value="brandNewNotice.do", method = RequestMethod.GET)
	public @ResponseBody List<Map<String,String>> BrandNewNotice() {
		BoardVO nvo = new BoardVO();
		List<BoardVO> nList = noticeService.BrandNewNotice(nvo);
		System.out.println("brandNewNotice size>>" +nList.size());
		List<Map<String,String>> result = new ArrayList<Map<String,String>>();

		for(int i = 0; i<nList.size(); i++) {
			Map<String, String> map = new HashMap<String,String>();
			map.put("nbno", nList.get(i).getBno());
			map.put("ntitle", nList.get(i).getBtitle());
			map.put("ncontent", nList.get(i).getBcontent());
			map.put("ninsertdate", nList.get(i).getBinsertdate());
			System.out.println("map >> " + map);
			result.add(map);
		}

		return result;
	}


	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping(value="brandnewNotice", method = RequestMethod.GET) public
	 * String BrandNewNotice(BoardVO nvo, Model model) throws Exception{
	 * 
	 * List<BoardVO> nlist = noticeService.BrandNewNotice(nvo);
	 * 
	 * System.out.println(nlist); System.out.
	 * println("NoticeController >> brandnewNotice >> nlist.size() >>> : " +
	 * nlist.size());
	 * 
	 * String ss = ""; String listStr = "";
	 * 
	 * for(int i=0; i < nlist.size(); i++) { BoardVO _nvo = nlist.get(i); String s0
	 * = _nvo.getBno(); String s1 = _nvo.getBtitle(); String s2 = _nvo.getMnick();
	 * String s3 = _nvo.getBinsertdate(); ss = s0 + "," + s1 + "," + s2 + "," + s3;
	 * listStr += ss + "&"; }
	 * 
	 * return listStr; }
	 */

	@RequestMapping(value="noticeSelectAllPage", method=RequestMethod.GET)
	public String NoticeSelectPaging(BoardVO nvo, Model model, HttpServletRequest request) {
		logger.info("NoticeController NoticeSelectPaging start ::");	

		// 페이징		
		int totalCnt = 0;
		String cPage = request.getParameter("curPage");
		String pageCtrl = request.getParameter("pageCtrl");

		Paging.setPage(nvo, cPage, pageCtrl);

		List<BoardVO> listPage = noticeService.NoticeSelectPaging(nvo);
		logger.info("NoticeController NoticeSelectPaging listS.size >>>:: " + listPage.size());

		if(listPage.size() != 0) {

			totalCnt = listPage.get(0).getTotalCount();
			nvo.setTotalCount(totalCnt);
		}

		model.addAttribute("listPage", listPage);
		model.addAttribute("p_nvo", nvo);

		return "notice/noticeSelectAllPage";
	}

	/*
	@RequestMapping(value="imgtry", method=RequestMethod.GET)
	public String noticeInsert(BoardVO nvo, Model model) {
		logger.info("NoticeController NoticeInsert  start ::");


		String bno = ChabunUtil.getNoticeChabun("D", chabunService.getNoticeChabun().getBno());
		nvo.setBviews("0");
		nvo.setBhits("0");

		nvo.setBno(bno);

		logger.info("NoticeController NoticeInsert nvo.getBno() >>> : "
		 		+ nvo.getBno());
		logger.info("NoticeController NoticeInsert nvo.getBcontent() >>> : "
			 	+ nvo.getBcontent());
		logger.info("NoticeController NoticeInsert nvo.getMnick() >>> : "
			 	+ nvo.getMnick());

		 int nCnt = noticeService.NoticeInsert(nvo);
		 logger.info("NoticeController NoticeInsert nCnt >>> : " + nCnt);

		 if(nCnt > 0) {
			 return  "notice/noticeInsert";
		 }

		return "notice/noticeForm";
	}
	 */

	@RequestMapping(value = "noticeInsert", method = RequestMethod.POST)
	public String NoticeInsert(BoardVO nvo, MultipartHttpServletRequest request){
		logger.info("noticeInsert >>> : 시작 ");

		//단일파일 업로드
		String key = new FileUploadUtil().uploadFile(request, "noticeboard"); // 업로드 할 폴더 이름 
		logger.info("key >>> : " + key);
		nvo.setBfile(key);

		String bno = ChabunUtil.getNoticeChabun("D", chabunService.getNoticeChabun().getBno());
		nvo.setBviews("0");
		nvo.setBhits("0");

		nvo.setBno(bno);

		int nCnt = noticeService.NoticeInsert(nvo);
		logger.info("NoticeController NoticeInsert nCnt >>> : " + nCnt);

		if(nCnt > 0) {
			return "notice/noticeInsert";
		}

		return "notice/noticeSelectAllPage";
	}

	/*
	@RequestMapping(value="",method=RequestMethod.GET)
	public String boardSelectAll(BoardVO nvo, Model model) {
		logger.info("NoticeController NoticeSelectAll start >>>: ");



		List<BoardVO> listAll = noticeService.NoticeSelectAll(nvo);
		logger.info("NoticeController NoticeSelectAll listAll.size() >>> : " + listAll.size());

		try {

		if(listAll.size() > 0) {

			model.addAttribute("listAll",listAll);

			return "notice/noticeSelectAll";
			}
		}catch(Exception e) {
			System.out.println("test"+e.getMessage());
			}

		return "notice/noticeForm";
	}
	 */

	// NoticeList : list selection
	@RequestMapping(value="noticeSelect",method=RequestMethod.GET)
	public String NoticeSelect(BoardVO nvo, Model model) {

		logger.info("NoticeController NoticeSelect start :::: ");
		logger.info("NoticeController NoticeSelect nvo.getBno() " + nvo.getBno());

		List<BoardVO> listS = noticeService.NoticeSelect(nvo);
		logger.info("NoticeController NoticeSelect listS.size >>>:: " + listS.size());


		if(listS.size() == 1) {
			model.addAttribute("listS", listS);
			return "notice/noticeSelect";
		}

		return "notice/noticeSelectAll";

	}

	@RequestMapping(value="noticeUpdate",method=RequestMethod.POST)
	public String NoticeUpdate(BoardVO nvo ,Model model) {
		logger.info("NoticeController NoticeUpdate start >> ");

		List<BoardVO> listS = noticeService.NoticeSelect(nvo);
		
		model.addAttribute("listS", listS);

			return "notice/noticeUpdateForm";
	}	

	// 수정 폼
		@RequestMapping(value="noticeUpdateForm", method=RequestMethod.POST)
		public String QnAUpdate(@ModelAttribute BoardVO nvo, MultipartHttpServletRequest request)
								throws IllegalStateException, IOException{		
			logger.info("QnAUpdate 호출 성공");
			logger.info("QnAUpdate nvo.getBno() >>> : " + nvo.getBno());
			
			int nCnt = 0;
			String url = "";
			
			//단일파일 업로드
			String key = new FileUploadUtil().uploadFile(request, "noticeboard");  
			logger.info("key >>> : " + key);
			nvo.setBfile(key);
					
			nvo.setBviews("0");
			nvo.setBhits("0");
			
			logger.info("nvo >>> : " + nvo.toString());
			
			nCnt = noticeService.NoticeUpdate(nvo);
			logger.info("NoticedUpdate nCnt >>> : " + nCnt);
			
			if(nCnt == 1) {
				url = "noticeSelectAllPage.do?bno=" + nvo.getBno();
			}
			
			return "redirect:" + url;
		}
	
	@ResponseBody
	@RequestMapping(value="noticeViews", method=RequestMethod.GET)
	public String NoticeVIEWS(BoardVO nvo) {
		logger.info("noticeViews >>> ");
		logger.info("noticeViews nvo.getBno() >>> : " + nvo.getBno());

		int result = noticeService.NoticeVIEWS(nvo);
		logger.info("noticeViews result >>> : " + result);

		if (1 == result) {
			return "GOOD";
		}
		else{
			return "BAD"; 
		}
	}

	@ResponseBody
	@RequestMapping(value="noticeHits", method=RequestMethod.GET)
	public String NoticeHITS(BoardVO nvo) {
		logger.info("noticeHits >>> ");
		logger.info("noticeHits bvo.getBno() >>> : " + nvo.getBno());

		int result = noticeService.NoticeHITS(nvo);
		logger.info("noticeHits result >>> : " + result);

		if (1 == result) {
			return "GOOD"; 
		}
		else{
			return "BAD";
		}
	}


	@RequestMapping(value="noticeDelete", method=RequestMethod.POST)
	public String NoticeDelete(BoardVO nvo, Model model) {
		logger.info("NoticeController NoticeDelete start >>> :");
		logger.info("NoticeController NoticeDelete nvo.getBno() >>> : " + nvo.getBno());		
		
		int nCnt = 0;
		String url = "";
		
		nCnt = noticeService.NoticeDelete(nvo);
		logger.info("NoticeController NoticeDelete nCnt >>> : " + nCnt);

		if (nCnt == 1) {
			url = "noticeSelectAllPage";
		}

		return "redirect:" + url;
	}
}
