package com.zlgoon.plusFriend.mapper;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.zlgoon.plusFriend.vo.MessageVO;

@Mapper
public interface MessageMapper {

	/* 고객에게 문의 접수 완료 알림 문자를 전송 */
	public int setMessageSendInfo(MessageVO vo);

	
	/* 디비 2개 접속 테스트  */
	public int insertTest(Map<String, Object> map);
	
	/* 문의 종류별 문의접수 문자 알림을 발송할 관리자 번호 조회 */
	public List<String> getAdminPhoneNumber(Map<String, Object> map);
	
}
