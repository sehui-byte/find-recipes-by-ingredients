package com.jns.alarm.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jns.alarm.vo.AlarmVO;

//@Repository
public class AlarmDAOImpl implements AlarmDAO{
	
	@Autowired(required = false)
	private SqlSessionTemplate sqlSession;

	@Override
	public String countAlarm(AlarmVO avo) {
		return sqlSession.selectOne("countAlarm",avo);
	}

	@Override
	public List<AlarmVO> selectAlarm(AlarmVO avo) {
		return sqlSession.selectList("selectAlarm",avo);
	}

	@Override
	public int deleteAlarm(AlarmVO avo) {
		return sqlSession.delete("deleteAlarm",avo);
	}

	@Override
	public int insertAlarm(AlarmVO avo) {
		return sqlSession.insert("insertAlarm",avo);
	}

	@Override
	public List<AlarmVO> selectFiveAlarm(AlarmVO avo) {
		return sqlSession.selectList("selectFiveAlarm",avo);
	}

	@Override
	public int updateReadYN(AlarmVO avo) {
		return sqlSession.update("updateReadYN",avo);
	}

}
