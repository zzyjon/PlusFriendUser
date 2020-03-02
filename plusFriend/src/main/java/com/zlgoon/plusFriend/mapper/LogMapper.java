package com.zlgoon.plusFriend.mapper;



import org.apache.ibatis.annotations.Mapper;

import com.zlgoon.plusFriend.vo.AskVO;

@Mapper
public interface LogMapper {

	/* 문자 발송 로그를 남김  */
	public void insertMessageSendLog(AskVO vo);
	
	/* 문의 접수 시 로그를 남김 */
	public void insertProcessStatusLog(AskVO vo);
}
