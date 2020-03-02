package com.zlgoon.plusFriend.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zlgoon.plusFriend.mapper.AskMapper;
import com.zlgoon.plusFriend.mapper.LogMapper;
import com.zlgoon.plusFriend.mapper.MessageMapper;
import com.zlgoon.plusFriend.mapperSub.MessageSendMapper;
import com.zlgoon.plusFriend.vo.AskVO;
import com.zlgoon.plusFriend.vo.MessageVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class AskService {


	@Autowired
	AskMapper askMapper;

	@Autowired
	MessageMapper messageMapper;
	
	@Autowired
	MessageSendMapper messageSendMapper;
	
	@Autowired
	LogMapper logMapper;

	/* 문의 접수 */
	@Transactional
	public void insertAskBoard(AskVO vo) throws Exception {
		
		try {
			
			if("00".equals(vo.getCustomType())){
				askMapper.insertAskBoard(vo);		// 마스터 테이블 등록
				askMapper.insertCalculateBoard(vo);	// 슬레이브 테이블 등록 (마스터 테이블의 insert된 seq를 받아서 등록함)
				logMapper.insertProcessStatusLog(vo); 	// 문의 최초 요청 상태 로그 등록  
				
				
				/* 관리자 문자 발송 시작  */
				List<MessageVO> adminPhoneList = askMapper.getCalculateAdminPhoneNumber(vo); // 해당 문의종류에 등록된 관리자 번호 목록을 가져온다
				MessageVO adminMessageInfo = new MessageVO();
				
				if(adminPhoneList.size() > 0 ) {
					for(int i = 0; i<adminPhoneList.size(); i++) {
						
						adminMessageInfo.setTrPhone(adminPhoneList.get(i).getTrPhone());
						adminMessageInfo.setTrCallback("16618191");
						adminMessageInfo.setTrMsg("[플러스친구 접수 완료 안내]\n"+vo.getRcompanyName()+" 정산 문의 접수 완료");
						
						messageSendMapper.setMessageSendInfoAdmin(adminMessageInfo);
					}
				}
				/* 관리자 문자 발송 종료 */
				
				/* 고객 문자 발송 시작 */
				MessageVO userMessageInfo = new MessageVO();
				
				userMessageInfo.setTrPhone(vo.getReplyPhoneNo()); 
				userMessageInfo.setTrCallback("16618191");
				userMessageInfo.setTrMsg("[플러스친구 접수 완료]\n고객님의 정산 문의사항이 접수되었습니다.");
				  
				messageSendMapper.setMessageSendInfo(userMessageInfo);	// 문자 발송 DB에 고객 정보 세팅
				/* 고객 문자 발송 끝 */
				logMapper.insertMessageSendLog(vo);					// 고객 문자 발송 로그 등록
				
			}else if("01".equals(vo.getCustomType())) {
				askMapper.insertAskBoard(vo);		// 마스터 테이블 등록
				askMapper.insertCouponBoard(vo);	// 슬레이브 테이블 등록 (마스터 테이블의 insert된 seq를 받아서 등록함)
				logMapper.insertProcessStatusLog(vo);			// 문의 최초 요청 상태 로그 등록  
				
				
				/* 관리자 문자 발송 시작  */
				List<MessageVO> adminPhoneList = askMapper.getCouponAdminPhoneNumber(vo); // 해당 문의종류에 등록된 관리자 번호 목록을 가져온다
				MessageVO adminMessageInfo = new MessageVO();
				
				if(adminPhoneList.size() > 0 ) {
					for(int i = 0; i<adminPhoneList.size(); i++) {
						
						adminMessageInfo.setTrPhone(adminPhoneList.get(i).getTrPhone());
						adminMessageInfo.setTrCallback("16618191");
						adminMessageInfo.setTrMsg("[플러스친구 접수 완료 안내]\n"+vo.getRcompanyName()+" 쿠폰 문의 접수 완료");
						
						messageSendMapper.setMessageSendInfoAdmin(adminMessageInfo);		// 문자 발송 DB에 관리자 정보를 세팅
					}
				}
				/* 관리자 문자 발송 끝  */
				
				/* 고객 문자 발송 시작*/
				MessageVO userMessageInfo = new MessageVO();
				
				userMessageInfo.setTrPhone(vo.getReplyPhoneNo()); 
				userMessageInfo.setTrCallback("16618191");
				userMessageInfo.setTrMsg("[플러스친구 접수 완료 안내]\n고객님의 쿠폰 문의사항이 접수되었습니다.");
				  
				messageSendMapper.setMessageSendInfo(userMessageInfo);	// 문자 발송 DB에 고객 정보 세팅
				/* 고객 문자 발송 끝 */
				
				logMapper.insertMessageSendLog(vo);					// 고객 문자 발송 로그 등록
				
			}else if("02".equals(vo.getCustomType())) {
				askMapper.insertAskBoard(vo);		// 마스터 테이블 등록
				askMapper.insertSiteBoard(vo);	// 슬레이브 테이블 등록 (마스터 테이블의 insert된 seq를 받아서 등록함)
				logMapper.insertProcessStatusLog(vo);			// 문의 최초 요청 상태 로그 등록  
				
				
				/* 관리자 문자 발송 시작 */
				List<MessageVO> adminPhoneList = askMapper.getSiteAdminPhoneNumber(vo); // 해당 문의종류에 등록된 관리자 번호 목록을 가져온다
				MessageVO adminMessageInfo = new MessageVO();
				
				if(adminPhoneList.size() > 0 ) {
					for(int i = 0; i<adminPhoneList.size(); i++) {
						
						adminMessageInfo.setTrPhone(adminPhoneList.get(i).getTrPhone());
						adminMessageInfo.setTrCallback("16618191");
						adminMessageInfo.setTrMsg("[플러스친구 접수 완료 안내]\n"+vo.getRcompanyName()+" 쿠폰인증사이트 문의 접수 완료");
						
						messageSendMapper.setMessageSendInfoAdmin(adminMessageInfo);		// 문자 발송 DB에 관리자 정보를 세팅
					}
				}
				/* 관리자 문자 발송 끝 */
				
				/* 고객 문자 발송 시작 */
				MessageVO userMessageInfo = new MessageVO();
				
				userMessageInfo.setTrPhone(vo.getReplyPhoneNo()); 
				userMessageInfo.setTrCallback("16618191");
				userMessageInfo.setTrMsg("[플러스친구 접수 완료 안내]\n고객님의 쿠폰인증사이트 문의사항이 접수되었습니다.");
				  
				messageSendMapper.setMessageSendInfo(userMessageInfo);	// 문자 발송 DB에 고객 정보 세팅
				/* 고객 문자 발송 끝 */
				
				logMapper.insertMessageSendLog(vo);					// 고객 문자 발송 로그 등록
				
			}else {
				throw new Exception("없는 문의종류입니다. "+"입력 문의 종류 값:"+vo.getCustomType());
			}
			
		} catch(Exception e) {
			e.printStackTrace();
			log.error("문의 접수 처리 중 에러 발생", e);
			throw e;
		}
		 
	}

	/* 정산 문의 접수 */
	public int insertCalculateBoard(AskVO vo) throws Exception {
		return askMapper.insertCalculateBoard(vo);
	}

	/* 쿠폰 문의 등록 */
	public int insertCouponBoard(AskVO vo) throws Exception {
		return askMapper.insertCouponBoard(vo);
	}

	/* 쿠폰인증 사이트 문의 등록 */
	public int insertSiteBoard(AskVO vo) throws Exception {
		return askMapper.insertSiteBoard(vo);
	}
	
	/* 정산 문의접수 문자 알림을 발송할 관리자 번호 조회  */
	public List<MessageVO> getCalculateAdminPhoneNumber(AskVO vo) throws Exception {
		return askMapper.getCalculateAdminPhoneNumber(vo);
	}
	
	/* 쿠폰 문의접수 문자 알림을 발송할 관리자 번호 조회  */
	public List<MessageVO> getCouponAdminPhoneNumber(AskVO vo) throws Exception {
		return askMapper.getCouponAdminPhoneNumber(vo);
	}
	
	/* 쿠폰인증사이트 문의접수 문자 알림을 발송할 관리자 번호 조회  */
	public List<MessageVO> getSiteAdminPhoneNumber(AskVO vo) throws Exception {
		return askMapper.getSiteAdminPhoneNumber(vo);
	}

}
