package com.zlgoon.plusFriend.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zlgoon.plusFriend.mapperSub.MessageSendMapper;
import com.zlgoon.plusFriend.vo.MessageVO;

@Service
public class MessageService {

	@Autowired
	MessageSendMapper messageMapper;
	
	/* 고객에게 문의 접수 완료 알림 문자를 전송 */
	public int setMessageSendInfo(MessageVO vo) {
		return messageMapper.setMessageSendInfo(vo);
	}
	
	/* 해당 문의종류에 등록된 관리자에게 접수 안내 문자를 발송 List */
	public int setMessageSendInfoAdminList(List<MessageVO> list) {
		return messageMapper.setMessageSendInfoAdminList(list);
	}
	
	/* 해당 문의종류에 등록된 관리자에게 접수 안내 문자를 발송 */
	public void setMessageSendInfoAdmin(MessageVO vo) {}
}
