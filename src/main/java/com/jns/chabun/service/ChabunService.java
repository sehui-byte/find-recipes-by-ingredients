package com.jns.chabun.service;

import com.jns.board.vo.BoardVO;
import com.jns.chef.vo.ChefVO;
import com.jns.chefboard.vo.ChefBoardVO;
import com.jns.member.vo.MemberVO;
import com.jns.myinfo.vo.FavoritesVO;
import com.jns.board.vo.BoardVO;
import com.jns.notice.vo.NoticeVO;
import com.jns.product.vo.ProductVO;
import com.jns.qna.vo.QnAVO;
import com.jns.recipeboard.vo.RecipeBoardVO;
import com.jns.reply.vo.ReplyVO;


public interface ChabunService {
	
	public  MemberVO getMemberChabun();

	public BoardVO getNoticeChabun();

	public BoardVO getQnABoardChabun();

	public ChefBoardVO getBoardChabun();
	
	public ReplyVO getReplyChabun();
	
	public RecipeBoardVO getRecipeBoardChabun();
	
	public ProductVO getLikeProductChabun();

	public ChefVO getChefChabun();
	
	public FavoritesVO getFavoritesChabun();
	
}
