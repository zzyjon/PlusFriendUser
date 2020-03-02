package com.zlgoon.plusFriend.vo;

import lombok.Data;

@Data
public class MessageVO {

	private String trSenddate;			// 문자 발송 시간  	미래 시간으로 할 경우 예약 발송	
	private String trSendstat;			// 발송상태  	0:발송대기 1:결과수신대기 2:결과수신완료	
	private String trMsgtype;			// 문자전송 형태   	0 : 일반메시지 1 : 콜백 URL 메시지 2 : 국제 SMS 3 : PUSH 
	private String trPhone;				// 수신할 핸드폰 번호 
	private String trCallback;			// 송신자 전화번호 
	private String trMsg;				// 전송할 메시지 
	
}
