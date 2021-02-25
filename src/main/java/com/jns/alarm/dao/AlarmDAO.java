package com.jns.alarm.dao;

import java.util.List;

import com.jns.alarm.vo.AlarmVO;

public interface AlarmDAO {

	//알람 개수 리턴
	public int countAlarm(AlarmVO avo);
	//receiver의 알람 리턴
	public List<AlarmVO> selectAlarm(AlarmVO avo);
	//알람 읽으면 삭제되게
	public int deleteAlarm(AlarmVO avo);
	//로그아웃 상태시에 알람 추가
	public int insertAlarm(AlarmVO avo);
}
