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
	public CDA_roomDTO cda_getreserveRoom(Long num) {
		
		return this.sqlSession.selectOne("reserveRoomInfo", num);
	}

	@Override
	public List<CDA_roomDTO> cda_getRoomList(String date) {
		// TODO Auto-generated method stub
		return this.sqlSession.selectList("reserveRoomList",date);
	}
	

	@Override
	public int cda_getmemmo(String id) {
		
		return this.sqlSession.selectOne("getmemno", id);
	}
	
	@Override
	public int cda_paymentConfirm(CDA_paymentDTO paymentDTO) {
		
		return this.sqlSession.insert("reservePayment", paymentDTO);
	}
	
	@Override
	public int cda_getpatmentno() {
		
		return this.sqlSession.selectOne("getpaymentno");
	}

	@Override
	public int cda_reserveComfirmdetail(CDA_paymentdetailDTO paymentdetailDTO) {
		
		return this.sqlSession.insert("orderDetail", paymentdetailDTO);
	}
	
	
	
	@Override
	public int cda_paymentDetailremCancel(int no) {
		
		return this.sqlSession.delete("detailRemove",no);
	}

	@Override
	public int cda_paymentCancel(int no) {
		return this.sqlSession.delete("paymentRemove",no);
	}

	////////////////////////////////////////////////////////////////////
	//id 세션으로 정보 받아오기(나중에 삭제!!!!!)
	@Override
	public testidDTO gettestid(String id) {
		
		return this.sqlSession.selectOne("testid", id);
	}
	
}
