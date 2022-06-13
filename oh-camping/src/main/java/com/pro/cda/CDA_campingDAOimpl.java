package com.pro.cda;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CDA_campingDAOimpl implements CDA_campingDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<CDA_roomDTO> cda_getRoomList(Long num) {
		
		return this.sqlSession.selectList("roomofday_list",num);
		
		
	}

	
}
