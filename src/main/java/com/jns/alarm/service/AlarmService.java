package com.jns.alarm.service;

import java.util.List;

import com.jns.alarm.vo.AlarmVO;

public interface AlarmService {
	public List<AlarmVO> selectAlarm(AlarmVO avo);
	public int updateReadYN(AlarmVO avo);
}
