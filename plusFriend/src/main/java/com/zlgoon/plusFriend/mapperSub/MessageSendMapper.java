package com.zlgoon.plusFriend.mapperSub;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.zlgoon.plusFriend.vo.MessageVO;

@Mapper
public interface MessageSendMapper {

	/* 고객에게 문의 접수 완료 알림 문자를 전송 */
	public int setMessageSendInfo(MessageVO vo);
	
	/* 해당 문의종류에 등록된 관리자에게 접수 안내 문자를 발송 List */
	public int setMessageSendInfoAdminList(List<MessageVO> list);
	
	/* 해당 문의종류에 등록된 관리자에게 접수 안내 문자를 발송 */
	public void setMessageSendInfoAdmin(MessageVO vo);
	
}
