package com.zlgoon.plusFriend.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.zlgoon.plusFriend.vo.AskVO;
import com.zlgoon.plusFriend.vo.MessageVO;

@Mapper
public interface AskMapper {
	/* 문의 등록   */
	public int insertAskBoard(AskVO vo) throws Exception;
	
	/* 정산 문의 등록   */
	public int insertCalculateBoard(AskVO vo) throws Exception;
	
	/* 쿠폰 문의 등록*/
	public int insertCouponBoard(AskVO vo) throws Exception;
	
	/* 쿠폰인증 사이트 문의 등록 */
	public int insertSiteBoard(AskVO vo) throws Exception;
	
	/* 정산 문의접수 문자 알림을 발송할 관리자 번호 조회  */
	public List<MessageVO> getCalculateAdminPhoneNumber(AskVO vo) throws Exception; 
	
	/* 쿠폰 문의접수 문자 알림을 발송할 관리자 번호 조회  */
	public List<MessageVO> getCouponAdminPhoneNumber(AskVO vo) throws Exception; 
	
	/* 쿠폰인증사이트 문의접수 문자 알림을 발송할 관리자 번호 조회  */
	public List<MessageVO> getSiteAdminPhoneNumber(AskVO vo) throws Exception; 
	
}
