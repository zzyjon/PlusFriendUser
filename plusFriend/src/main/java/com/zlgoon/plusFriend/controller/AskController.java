package com.zlgoon.plusFriend.controller;



import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.zlgoon.plusFriend.service.AskService;
import com.zlgoon.plusFriend.service.LogService;
import com.zlgoon.plusFriend.util.IpCheck;
import com.zlgoon.plusFriend.util.StringUtil;
import com.zlgoon.plusFriend.vo.AskVO;

import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class AskController {
	
	@Autowired
	AskService askService;
	
	@Autowired
	LogService logService;
	
	
	/**
	 * 설명: 브랜드 담당자가 정산 문의를 남기는 페이지 이동
	 * 
	 * */
	@RequestMapping("/calculate")
	public String setCalculateSubmit(Model model, HttpServletRequest request) throws Exception {
		
		IpCheck clientIpAdress = new IpCheck();
		
		log.info("============= 정산 페이지 접속 ===============");
		log.info(">>>>>>>>>>>>> 접속 IP : "+clientIpAdress.getIp(request));
		
		model.addAttribute("customType", "00");	// 문의 종류  정산문의:00
		
		return "submit_calculate";
	}
	
	
	/**
	 * 설명: 브랜드 담당자가 쿠폰 문의를 남기는 페이지 이동
	 * 
	 * */
	@RequestMapping("/coupon")
	public String setCouponSubmit(Model model, HttpServletRequest request) throws Exception {
		
		IpCheck clientIpAdress = new IpCheck();
		
		log.info("============= 쿠폰문의 페이지 접속  ===============");
		log.info(">>>>>>>>>>>>> 접속 IP : "+clientIpAdress.getIp(request));
		
		model.addAttribute("customType", "01");	// 문의 종류  쿠폰문의:01
		
		return "submit_coupon";
	}
	
	
	/**
	 * 설명: 브랜드 담당자가 쿠폰인증 사이트 문의를 남기는 페이지 이동
	 * 
	 * */
	@RequestMapping("/site")
	public String setSiteSubmit(Model model, HttpServletRequest request) throws Exception {
		
		IpCheck clientIpAdress = new IpCheck();
		
		log.info("============= 쿠폰인증 사이트문의 페이지 접속  ===============");
		log.info(">>>>>>>>>>>>> 접속 IP : "+clientIpAdress.getIp(request));
		
		model.addAttribute("customType", "02");	// 문의 종류 쿠폰인증 사이트 문의:02
		
		return "submit_site";
	}
	
	
	/**
	 * 설명: 문의 등록
	 * 
	 * 
	 * */
	@PostMapping(value="/insertAsk")
	public ModelAndView setAsk(Model model, @ModelAttribute AskVO paramVO, HttpServletRequest request ) throws Exception {
		
		ModelAndView view = new ModelAndView("jsonView");
		IpCheck clientIpAdress = new IpCheck();
		
		try {
			
			if("00".equals(paramVO.getCustomType()) || "02".equals(paramVO.getCustomType())  ) {
				
				// 문의 종류 유효성 체크
				if(StringUtil.isEmpty(paramVO.getCustomType())) {
					throw new Exception("문의 종류 값은 필수입니다.");
				}
				
				// 브랜드명 유효성 체크
				if(StringUtil.isEmpty(paramVO.getRcompanyName())) {
					throw new Exception("브랜드명 입력 값은 필수입니다.");
				}else {
					paramVO.setRcompanyName(StringUtil.replaceEmoji(paramVO.getRcompanyName()));
				}
				
				// 지점명 유효성 체크
				if(StringUtil.isEmpty(paramVO.getBranchName())) {
					throw new Exception("지점명 입력 값은 필수입니다.");
				}else {
					paramVO.setBranchName(StringUtil.replaceEmoji(paramVO.getBranchName()));
				}
				
				// 회신받을 고객연락처 유효성 체크
				if(StringUtil.isEmpty(paramVO.getReplyPhoneNo())) {
					throw new Exception("회신받을 고객연락처 입력 값은 필수입니다.");
				}else if(!StringUtil.isNumeric(paramVO.getReplyPhoneNo())) {
					throw new Exception("회신받을 고객연락처는 숫자만 입력 가능합니다.");
				}else {
					paramVO.setReplyEmail(StringUtil.replaceEmoji(paramVO.getBranchName()));
				}
				
				// 회신받을 고객이메일 유효성 체크
				if(StringUtil.isNotEmpty(paramVO.getReplyEmail())) {
					paramVO.setReplyEmail(paramVO.getReplyEmail().toLowerCase());
				}
				
				// 기타문의 유효성 체크
				if(!"Y".equals(paramVO.getUserMemoYn()) && !"N".equals(paramVO.getUserMemoYn())) {
					throw new Exception("기타 문의 체크값은 Y 또는 N만 입력 가능합니다");
				}else if("Y".equals(paramVO.getUserMemoYn()) ) {
					if(StringUtil.isEmpty(paramVO.getUserMemo()) ) { 
						throw new Exception("기타 문의 입력은 필수 값입니다."); 
					}else {
						paramVO.setUserMemo(StringUtil.replaceEmoji(paramVO.getUserMemo()));
					}
				}
				
				// 공통 데이터
				log.info("====================== 문의 접수 요청 =======================");
				log.info(">>>>>>>>>>>>> 요청 IP : "+clientIpAdress.getIp(request));
				log.info("문의종류:'{}'",paramVO.getCustomType());			// 문의 종류 정산문의:00 쿠폰문의:01 쿠폰인증사이트문의:02
				log.info("브랜드:'{}'",paramVO.getRcompanyName());
				log.info("지점명:'{}'",paramVO.getBranchName());
				log.info("회신번호:'{}'",paramVO.getReplyPhoneNo());
				log.info("이메일:'{}'",paramVO.getReplyEmail());
				log.info("기타문의 선택여부:'{}'",paramVO.getUserMemoYn());
				log.info("기타문의 작성내용:'{}'",paramVO.getUserMemo());
				
				
				if("00".equals(paramVO.getCustomType())) {		// 정산 문의 
					
					// 세금계산서 문의 유효성 체크
					if(!"Y".equals(paramVO.getTaxYn()) && !"N".equals(paramVO.getTaxYn())) {
						throw new Exception("세금계산서 문의 체크값은 Y 또는 N만 입력 가능합니다");
					}else if("Y".equals(paramVO.getTaxYn()) ) {
						if(StringUtil.isEmpty(paramVO.getTaxYnStartDate()) || StringUtil.isEmpty(paramVO.getTaxYnEndDate())) { 
							throw new Exception("세금계산서 문의 체크값이 Y일때 세금계산서 조회 시작일과 종료일은 필수 값입니다."); 
						}else {
							paramVO.setTaxYnStartDate(paramVO.getTaxYnStartDate().replaceAll("/", ""));
							paramVO.setTaxYnEndDate(paramVO.getTaxYnEndDate().replaceAll("/", ""));
						}
					}
					
					// 입금일정 문의 유효성 체크
					if (!"Y".equals(paramVO.getDepositYn()) && !"N".equals(paramVO.getDepositYn())) {
						throw new Exception("입금일정 문의 체크여부 값은 Y또는 N만 입력할 수 있습니다.");
					}
					
					// 정산금액 문의 유효성 체크
					if(!"Y".equals(paramVO.getCalculateYn()) && !"N".equals(paramVO.getCalculateYn()) ) {
						throw new Exception("정산금액 문의 체크값은 Y 또는 N만 입력 가능합니다");
					}else if("Y".equals(paramVO.getCalculateYn()) ) {
						if(StringUtil.isEmpty(paramVO.getCalculateYnStartDate()) || StringUtil.isEmpty(paramVO.getCalculateYnEndDate()) ) { 
							throw new Exception("정산금액 문의 체크값이 Y일때 정산금액 조회 시작일과 종료일은 필수 값입니다."); 
						}else {
							paramVO.setCalculateYnStartDate(paramVO.getCalculateYnStartDate().replaceAll("/", ""));
							paramVO.setCalculateYnEndDate(paramVO.getCalculateYnEndDate().replaceAll("/", ""));
						}
					}
					
					// 수수료 문의 유효성 체크
					if (!"Y".equals(paramVO.getCommissionYn()) && !"N".equals(paramVO.getCommissionYn()) ) {
						throw new Exception("수수료 문의 체크여부 값은 Y또는 N만 입력할 수 있습니다.");
					}
					
					// 매출자료 문의 유효성 체크
					if(!"Y".equals(paramVO.getSalesDataYn()) && !"N".equals(paramVO.getSalesDataYn()) ) {
						throw new Exception("매출자료 문의 체크값은 Y 또는 N만 입력 가능합니다");
					}else if("Y".equals(paramVO.getSalesDataYn()) ) {
						if(StringUtil.isEmpty(paramVO.getSalesDataYnStartDate()) || StringUtil.isEmpty(paramVO.getSalesDataYnEndDate())) { 
							throw new Exception("매출자료 문의 체크값이 Y일때 매출자료 조회 시작일과 종료일은 필수 값입니다."); 
						}else {
							paramVO.setSalesDataYnStartDate(paramVO.getSalesDataYnStartDate().replaceAll("/", ""));
							paramVO.setSalesDataYnEndDate(paramVO.getSalesDataYnEndDate().replaceAll("/", ""));
						}
					}
					
					
					log.info("세금계산서 문의 체크여부:'{}'",paramVO.getTaxYn());
					log.info("세금계산서 문의 시작일:'{}'",paramVO.getTaxYnStartDate());
					log.info("세금계산서 문의 종료일:'{}'",paramVO.getTaxYnEndDate());
					log.info("입금일정 선택여부:'{}'",paramVO.getDepositYn());
					log.info("정산금액 선택여부:'{}'",paramVO.getCalculateYn());
					log.info("수수료 선택여부:'{}'",paramVO.getCommissionYn());
					log.info("매출자료 선택여부:'{}'",paramVO.getSalesDataYn());
					log.info("정산금액 조회시작일:'{}'",paramVO.getCalculateYnStartDate());
					log.info("정산금액 조회종료일:'{}'",paramVO.getCalculateYnEndDate());
					log.info("매출자료 조회시작일:'{}'",paramVO.getSalesDataYnStartDate());
					log.info("매출자료 조회종료일:'{}'",paramVO.getSalesDataYnEndDate());
					
					
					askService.insertAskBoard(paramVO);	// 문의 등록 처리
					view.addObject("result", "00");		// 문의 정상 등록
					
				} else {		// 쿠폰인증 사이트 문의
					
					// 아이디 및 비밀번호 문의 유효성 체크
					if (!"Y".equals(paramVO.getFindIdpwdYn()) && !"N".equals(paramVO.getFindIdpwdYn()) ) {
						throw new Exception("아이디 및 비밀번호 문의 체크여부 값은 Y또는 N만 입력할 수 있습니다.");
					}
					
					// 사용방법 문의 유효성 체크
					if (!"Y".equals(paramVO.getManualYn()) && !"N".equals(paramVO.getManualYn()) ) {
						throw new Exception("사용방법 문의 체크여부 값은 Y또는 N만 입력할 수 있습니다.");
					}
					
					log.info("아이디및비밀번호 찾기 선택여부:'{}'",paramVO.getFindIdpwdYn());
					log.info("사용방법 선택여부:'{}'",paramVO.getManualYn());
					
					askService.insertAskBoard(paramVO);
					view.addObject("result", "00");		// 문의 정상 등록
					
				}
				
				
			} else if("01".equals(paramVO.getCustomType())) {
				
				// 문의 종류 유효성 체크
				if(StringUtil.isEmpty(paramVO.getCustomType())) {
					throw new Exception("문의 종류 값은 필수입니다.");
				}
				
				// 브랜드명 유효성 체크
				if(StringUtil.isEmpty(paramVO.getRcompanyName())) {
					throw new Exception("브랜드명 입력 값은 필수입니다.");
				}else {
					paramVO.setRcompanyName(StringUtil.replaceEmoji(paramVO.getRcompanyName()));
				}
				
				// 지점명 유효성 체크
				if(StringUtil.isEmpty(paramVO.getBranchName())) {
					throw new Exception("지점명 입력 값은 필수입니다.");
				}else {
					paramVO.setBranchName(StringUtil.replaceEmoji(paramVO.getBranchName()));
				}
				
				// 쿠폰번호 유효성 체크
				if(StringUtil.isEmpty(paramVO.getCouponNum())) {
					throw new Exception("쿠폰번호 입력 값은 필수입니다.");
				}
				
				// 회신받을 고객연락처 유효성 체크
				if(StringUtil.isEmpty(paramVO.getReplyPhoneNo())) {
					throw new Exception("회신받을 고객연락처 입력 값은 필수입니다.");
				}else if(!StringUtil.isNumeric(paramVO.getReplyPhoneNo())) {
					throw new Exception("회신받을 고객연락처는 숫자만 입력 가능합니다.");
				}
				
				// 회신받을 고객이메일 유효성 체크 
				if(StringUtil.isNotEmpty(paramVO.getReplyEmail())) {
					paramVO.setReplyEmail(paramVO.getReplyEmail().toLowerCase());
				}
				
				// 기타문의 유효성 체크
				if(!"Y".equals(paramVO.getUserMemoYn()) && !"N".equals(paramVO.getUserMemoYn())) {
					throw new Exception("기타 문의 체크값은 Y 또는 N만 입력 가능합니다");
				}else if("Y".equals(paramVO.getUserMemoYn()) ) {
					if(StringUtil.isEmpty(paramVO.getUserMemo()) ) { 
						throw new Exception("기타 문의 입력은 필수 값입니다."); 
					}else {
						paramVO.setUserMemo(StringUtil.replaceEmoji(paramVO.getUserMemo()));
					}
				}
				
				// 공통 데이터
				log.info("====================== 문의 접수 요청 =======================");
				log.info(">>>>>>>>>>>>> 요청 IP : "+clientIpAdress.getIp(request));
				log.info("문의종류:'{}'",paramVO.getCustomType());			// 문의 종류 정산문의:00 쿠폰문의:01 쿠폰인증사이트문의:02
				log.info("브랜드:'{}'",paramVO.getRcompanyName());
				log.info("지점명:'{}'",paramVO.getBranchName());
				log.info("쿠폰번호:'{}'",paramVO.getCouponNum());
				log.info("회신번호:'{}'",paramVO.getReplyPhoneNo());
				log.info("이메일:'{}'",paramVO.getReplyEmail());
				log.info("기타문의 선택여부:'{}'",paramVO.getUserMemoYn());
				log.info("기타문의 작성내용:'{}'",paramVO.getUserMemo());
				
				
				
				// 쿠폰 사용여부 문의 유효성 체크
				if (!"Y".equals(paramVO.getCouponUseYn()) && !"N".equals(paramVO.getCouponUseYn()) ) {
					throw new Exception("쿠폰 사용여부 문의 체크여부 값은 Y또는 N만 입력할 수 있습니다.");
				}
				
				// 쿠폰 승인요청 문의 유효성 체크
				if (!"Y".equals(paramVO.getCouponAllowYn()) && !"N".equals(paramVO.getCouponAllowYn()) ) {
					throw new Exception("쿠폰 승인요청 문의 체크여부 값은 Y또는 N만 입력할 수 있습니다.");
				}
				
				// 쿠폰번호 조회 문의 유효성 체크
				if (!"Y".equals(paramVO.getCouponCheckYn()) && !"N".equals(paramVO.getCouponCheckYn()) ) {
					throw new Exception("쿠폰번호 조회 문의 체크여부 값은 Y또는 N만 입력할 수 있습니다.");
				}
				
				// 포스에러로 인한 쿠폰 승인취소 문의 유효성 체크
				if (!"Y".equals(paramVO.getPosErrYn()) && !"N".equals(paramVO.getPosErrYn()) ) {
					throw new Exception("포스에러로 인한 쿠폰 승인취소 문의 체크여부 값은 Y또는 N만 입력할 수 있습니다.");
				}
				
				// 포스 매출확인 불가로 인한 쿠폰 승인 취소 문의 유효성 체크
				if (!"Y".equals(paramVO.getPosSalesYn()) && !"N".equals(paramVO.getPosSalesYn()) ) {
					throw new Exception("포스 매출확인 불가로 인한 쿠폰 승인 취소 문의 체크여부 값은 Y또는 N만 입력할 수 있습니다.");
				}
				
				// 오결제 건 승인취소 문의 유효성 체크
				if (!"Y".equals(paramVO.getFailPaymentYn()) && !"N".equals(paramVO.getFailPaymentYn()) ) {
					throw new Exception("오결제 건 승인취소 문의 체크여부 값은 Y또는 N만 입력할 수 있습니다.");
				}
				
				
				log.info("쿠폰사용 선택여부:'{}'",paramVO.getCouponUseYn());
				log.info("쿠폰승인요청 선택여부:'{}'",paramVO.getCouponAllowYn());
				log.info("쿠폰번호조회 선택여부:'{}'",paramVO.getCouponCheckYn());
				log.info("포스에러 승인취소 선택여부:'{}'",paramVO.getPosErrYn());
				log.info("포스매출확인 불가로 인한 쿠폰 승인취소 선택여부:'{}'",paramVO.getPosSalesYn());
				log.info("오결제건 승인취소 선택여부:'{}'",paramVO.getFailPaymentYn());
				
				askService.insertAskBoard(paramVO);
				view.addObject("result", "00");		// 문의 정상 등록
				
				
			} else {
				throw new Exception("존재하지 않는 문의종류입니다");
			}
			
		} catch(Exception ex) {
			ex.printStackTrace();
			view.addObject("result", "01");		// 문의 등록 실패
		}
		
		return view;
	}
	
	
	/**
	 * 문의 등록 성공 페이지
	 * */
	@RequestMapping("/complete")
	public String goCompletePage() {
		
		return "submit_complete";
	}
	
}
