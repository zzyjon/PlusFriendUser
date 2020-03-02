package com.zlgoon.plusFriend.service;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zlgoon.plusFriend.mapper.LogMapper;
import com.zlgoon.plusFriend.vo.AskVO;

@Service
public class LogService {

	@Autowired
	LogMapper logMapper;
	
	/* 문자 발송 로그를 남김  */
	public void insertMessageSendLog(AskVO vo) {}

	/* 문의 접수 시 로그를 남김 */
	public void insertProcessStatusLog(AskVO vo) {}
}
