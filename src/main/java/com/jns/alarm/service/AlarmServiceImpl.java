package com.jns.alarm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jns.alarm.dao.AlarmDAO;
import com.jns.alarm.vo.AlarmVO;

@Service
@Transactional
public class AlarmServiceImpl implements AlarmService{
	
	private AlarmDAO adao;
	
	@Autowired
	public AlarmServiceImpl(AlarmDAO adao) {
		this.adao = adao;
	}

	@Override
	public List<AlarmVO> selectAlarm(AlarmVO avo) {
		return adao.selectAlarm(avo);
	}

	
	@Override
	public AlarmVO selectOneAlarm(AlarmVO avo) {
		// TODO Auto-generated method stub
		return adao.selectOneAlarm(avo);
	}

	@Override
	public int updateReadYN(AlarmVO avo) {
		return adao.updateReadYN(avo);
	}

	@Override
	public List<AlarmVO> AlarmPage(AlarmVO avo) {
		// TODO Auto-generated method stub
		return adao.AlarmPage(avo);
	}

}
