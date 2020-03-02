package com.zlgoon.plusFriend.vo;

import java.util.List;

import lombok.Data;

@Data
public class AskVO {

	private List<AskVO> askList;
	
	
	/*공통*/
	private String abSeq;					// tb_ask_board seq
	private String rcompanyName;			// 문의 브랜드 이름
	private String branchName;				// 문의 지점 이름
	private String ownerName;				// 점주 이름
	private String corpNo;					// 사업자 번호
	private String replyPhoneNo;			// 회신받을 연락처
	private String replyEmail;				// 회신받을 이메일
	private String customType;				// 문의 종류 정산:00 쿠폰:01 사이트:02
	private String deleteYn;				// 글삭제 여부 삭제:Y 사용:N
	private String processStatus;			// 접수 처리 상태 (요청:00 처리중:01 처리완료:02)
	//private String regId;					// 문의회원 아이디 (현재 미사용) 
	private String regDate;					// 문의등록일시
	//private String modId;					// 문의 수정 아이디 (현재 미사용)
	//private String modDate;	 			// 문의 수정일시 (현재 미사용)
	private String userMemoYn;				// 기타문의 선택 여부
	private String userMemo;				// 기타문의 작성내용
	
	/*정산문의*/
	private String taxYn;					// 세금계산서 선택여부
	private String depositYn;				// 입금일정 선택여부
	private String calculateYn;				// 정산금액 선택여부
	private String commissionYn;			// 수수료 선택여부
	private String salesDataYn;				// 매출자료 선택여부
	private String taxYnStartDate;			// 세금계산서 조회시작일
	private String taxYnEndDate;			// 세금계산서 조회종료일
	private String calculateYnStartDate;	// 정산금액 조회시작일
	private String calculateYnEndDate;		// 정산금액 조회종료일
	private String salesDataYnStartDate;	// 매출자료 조회시작일
	private String salesDataYnEndDate;		// 매출자료 조회종료일
	
	/*쿠폰문의*/
	private String couponNum;				// 쿠폰 번호
	private String couponUseYn;				// 쿠폰 사용여부 조회 선택여부
	private String couponAllowYn;			// 쿠폰 승인요청 선택여부
	private String couponCheckYn;			// 쿠폰번호 조회 요청 선택여부
	private String posErrYn;				// 포스에러로 인한 쿠폰 승인취소 요청 선택여부
	private String posSalesYn;				// 포스 매출확인 불가로 인한 쿠폰 승인취소 요청 선택여부
	private String failPaymentYn;			// 오결제 건 승인취소 요청
	
	
	/*사이트문의*/
	private String findIdpwdYn;				// 아이디 및 비밀번호 문의 선택여부
	private String manualYn;				// 사용방법 문의 선택여부
	
	
}
