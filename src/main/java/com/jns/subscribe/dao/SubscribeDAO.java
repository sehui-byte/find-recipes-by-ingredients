package com.jns.subscribe.dao;

import java.util.List;

import com.jns.subscribe.vo.SubscribeVO;

public interface SubscribeDAO {

	// 내 구독 리스트
	public List<SubscribeVO> mySubList(SubscribeVO svo);
	
	// 구독자수 확인하기
	public int chefSubCount();
	
	// 구독하기
	public int subInsert(SubscribeVO svo);
	
	// 구독취소
	public int subDelete(SubscribeVO svo);
	
	// 구독자 랭킹
	public List<SubscribeVO> subRank(SubscribeVO svo);
	
	// 구독 확인
	public List<SubscribeVO> subCheck(SubscribeVO svo);
	
}
