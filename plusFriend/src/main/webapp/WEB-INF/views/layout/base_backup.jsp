<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>(주)즐거운 CS 접수</title>
<tiles:insertAttribute name="header"></tiles:insertAttribute>
<script type="text/javascript">
var customType = "${customType}";		//현재 접수 페이지의 문의 종류를 받아와서 담아둠 

/**
 * 문자열이 빈 문자열인지 체크하여 결과값을 리턴한다.
 * @param str       : 체크할 문자열
 */
function isEmpty(str){
     
    if(typeof str == "undefined" || str == null || str == "" || str.length < 1)
        return true;
    else
        return false ;
}


/**
 * input number type 일때 maxlength 체크하는 함수   
 * 사용법: input태그에 maxlength="10" oninput="maxLengthCheck(this)" 
 *
 */
function maxLengthCheck(object){
    if (object.value.length > object.maxLength){
        object.value = object.value.slice(0, object.maxLength);
    }    
}



//이메일 입력시 직접입력과 선택입력에 따른 입력처리 함수
function inputEamil() {
	//이메일 입력방식 선택
	$('#selectEmail').change(function(){
	   $("#selectEmail option:selected").each(function () {
			
			if($(this).val()== '1'){ 						//직접입력일 경우
				 $("#replyEmail2").val('');               	//값 초기화
				 $("#replyEmail2").attr("disabled",false);	//활성화
			}else{ 											//직접입력이 아닐경우
				 $("#replyEmail2").val($(this).text());  	//선택값 입력
				 $("#replyEmail2").attr("disabled",true);	//비활성화
			}
	   });
	});
	
}


//한글만 입력받도록 하는 함수
function onlyHangeul(obj) {
    var value = obj.val();
    obj.val(value.replace(/[^ㄱ-ㅎ가-힣]/g, '')); 
}

// 영문만 입력받도록 하는 함수
function onlyEnglish(obj) {
    var value = obj.val();
    obj.val(value.replace(/[^a-zA-Z]/g, ''));  
}

//이메일 형식 체크 
function chkEmail(str) {

    var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

    if (regExp.test(str)) return true;

    else return false;

}


//휴대폰번호 형식 체크
function chMobileNum(num) {
	var regExp = /^(?:(010-?\d{4})|(01[1|6|7|8|9]-?\d{3,4}))-?\d{4}$/;

	if(regExp.test(num)){
		return true;
	}else{
		return false;
	}
}


// textarea 글자 수 제한 
function limitText(obj, maxByte, $current, $totoal) {            

    var strValue = obj.value;
    var strLen = strValue.length;
    var totalByte = 0;
    var len = 0;
    var oneChar = "";
    var str2 = "";

    function count_text(){
        for (var i = 0; i < strLen; i++) {
            oneChar = strValue.charAt(i);
            if (escape(oneChar).length > 4) {
                totalByte += 2;
            } else {
                totalByte++;
            }

            // 입력한 문자 길이보다 크면 잘라내기 위해 길이저장
            if (totalByte <= maxByte) {
                len = i + 1;
            }
        }

        if($current == undefined || $totoal == undefined ) { return; }
        $($current).text(totalByte);
        $($totoal).text(maxByte);
    }
    count_text();

    // 넘어가는 글자를 자른다.
    if (totalByte > maxByte) {
        alert(maxByte + " 바이트를 초과 입력 할 수 없습니다.");
        str2 = strValue.substr(0, len);
        obj.value = str2;

        // 자른상태로 다시 보기
        limitText(obj, maxByte, $current, $totoal);
    }       
}



/**
 *	고객 문의 접수 
 *
 */
function doSubmit() {

	// 공통 항목 
	var rcompanyName			= $("#rcompanyName").val();									// 브랜드명
	var branchName 				= $("#branchName").val();									// 지점명
	var ownerName 				= $("#ownerName").val();									// 점주성함
	var corpNo 					= $("#corpNo").val();										// 사업자번호
	var replyPhoneNo			= $("#replyPhoneNo").val();									// 회신받을 연락처(고객연락처)
	var replyEmail1				= $("#replyEmail1").val();									// 고객이메일 아이디
	var replyEmail2				= $("#replyEmail2").val();									// 고객이메일 도메인
	var replyEmail				= "";														// 고객이메일 replyEmail1 + replyEmail2 합친것 'admin' + '@' + 'test.com'
	var userMemoYn				= $("input:checkbox[id='userMemoYn']").is(":checked");		// 기타문의 체크시 true 미체크시  false
	var userMemo				= $("#userMemo").val();										// 기타문의 고객이 직접 작성한 내용
	// 정산문의 항목
	var taxYn					= $("input:checkbox[id='taxYn']").is(":checked");			// 세금계산서 체크 여부 체크시 true 미체크시 false
	var taxYnStartDate			= $("#taxYnStartDate").val();								// 세금계산서 조회 시작 일
	var taxYnEndDate			= $("#taxYnEndDate").val();									// 세금계산서 조회 종료 일
	var depositYn				= $("input:checkbox[id='depositYn']").is(":checked");		// 입금일정 문의 체크시 true 미체크시 false
	var calculateYn				= $("input:checkbox[id='calculateYn']").is(":checked");		// 정산금액 문의 체크시 true 미체크시 false
	var calculateYnStartDate	= $("#calculateYnStartDate").val();							// 정산금액 문의 조회 시작 일
	var calculateYnEndDate		= $("#calculateYnEndDate").val();							// 정산금액 문의 조회 종료 일
	var commissionYn			= $("input:checkbox[id='commissionYn']").is(":checked");	// 수수료 문의  체크시 true 미체크시 false
	var salesDataYn				= $("input:checkbox[id='salesDataYn']").is(":checked");		// 매출자료 문의 체크시  true 미체크시 false
	var salesDataYnStartDate	= $("#salesDataYnStartDate").val();							// 매출자료 문의 조회 시작 일
	var salesDataYnEndDate		= $("#salesDataYnEndDate").val();							// 매출자료 문의 조회 종료 일
	// 쿠폰문의 항목
	var couponUseYn				= $("input:checkbox[id='couponUseYn']").is(":checked");		// 쿠폰사용여부 조회 체크 여부 체크시 true 미체크시 false
	var couponAllowYn			= $("input:checkbox[id='couponAllowYn']").is(":checked");	// 쿠폰승인요청 체크 여부 체크시 true 미체크시 false	
	var couponCheckYn			= $("input:checkbox[id='couponCheckYn']").is(":checked");	// 쿠폰번호 조회 체크 여부 체크시 true 미체크시 false
	var posErrYn				= $("input:checkbox[id='posErrYn']").is(":checked");		// 포스에러로 인한 쿠폰 승인취소 요청 체크시 true 미체크시 false
	var posSalesYn				= $("input:checkbox[id='posSalesYn']").is(":checked");		// 포스매출확인 불가로 인한 쿠폰 승인취소 요청 체크 시 true 미체크시 false
	var failPaymentYn			= $("input:checkbox[id='failPaymentYn']").is(":checked");	// 오결제 건 승인취소 요청 체크시 true 미체크시 false
	// 쿠폰인증 사이트 문의 항목
	var findIdpwdYn				= $("input:checkbox[id='findIdpwdYn']").is(":checked");		// 아이디 및 비밀번호 문의 체크시 true 미체크시 false
	var manualYn				= $("input:checkbox[id='manualYn']").is(":checked");		// 사용방법 문의 체크시 true 미체크시 false

	
	if(isEmpty(rcompanyName)){
		alert("브랜드를 선택해주세요");
		$("#rcompanyName").focus();
		return false;
	}else if(isEmpty(branchName)) {
		alert("지점명을 입력해주세요");
		$("#branchName").focus();
		return false;
	}else if(isEmpty(ownerName)) {
		alert("고객성함을 입력해주세요");
		$("#ownerName").focus();
		return false;
	}else if(isEmpty(corpNo)) {
		alert("사업자번호를 입력해주세요");
		$("#corpNo").focus();
		return false;
	}
	
	console.log("문의 종류: "+customType);
	

	// 핸드폰 번호 유효성 체크
	if(isEmpty(replyPhoneNo)) {
		alert("회신 받을 핸드폰 번호를 입력해주세요");
		$("#replyPhoneNo").focus();
		return false;
	}else if(!chMobileNum(replyPhoneNo)){
		alert("핸드폰 번호 형식을 확인해주세요");
		return false;
	}
	console.log("핸드폰번호:"+replyPhoneNo);


	
	console.log("이메일 아이디와 도메인 입력 여부 : "+(isEmpty(replyEmail1) && isEmpty(replyEmail2)));
	console.log("이메일 아이디 :"+replyEmail1);
	console.log("이메일 도메인 :"+replyEmail2);
	
	
	// 이메일 첫부분(아이디)과 두번째부분(도메인)의 입력을 체크 후 이메일 형식으로 합침 
	if(isEmpty(replyEmail1)) {
		alert("이메일 아이디를 입력해주세요");
		$("#replyEmail1").focus();
		return false;
	}else if(isEmpty(replyEmail2)){
		alert("이메일 도메인을 입력해주세요");
		$("#replyEmail2").focus();
		return false;
	}else{
		replyEmail = replyEmail1.concat("@",replyEmail2);	// 이메일 아이디와 이메일 도메인이 모두 입력 된 상태에서 이메일 형식으로 합침
		
		console.log("이메일 :"+replyEmail);

		// 이메일 형식 체크 		
		if(chkEmail(replyEmail)){
			console.log("이메일 형식 정상");
		}else{
			alert("이메일 형식을 확인해주세요");
			return false;
		}
	}

	
	// 세금계산서 선택했을 경우 필수 날짜 입력 체크 및 Y N 처리
	if(!taxYn){
		taxYn = "N"
	}else if(isEmpty(taxYnStartDate)) {
		alert("조회 시작일을 입력해주세요");
		$("#taxYnStartDate").focus();
		return false;
	}else if(isEmpty(taxYnEndDate)) {
		alert("조회 종료일을 입력해주세요");
		$("#taxYnEndDate").focus();
		return false;
	}else{
		taxYn = "Y";
	}

	console.log("세금계산서 문의 체크 여부: "+taxYn);
	console.log("세금계산서 문의 조회 시작일: "+taxYnStartDate);
	console.log("세금계산서 문의 조회 종료일: "+taxYnEndDate);

	
	// 입금일정 문의 체크 여부에 따른 Y N 처리 
	if(!depositYn){
		depositYn = "N";
	}else{
		depositYn = "Y";
	}

	console.log("입금일정 문의 체크 여부: "+depositYn);


	// 정산금액 문의 선택했을 경우 필수 날짜 입력 체크 및 Y N 처리
	if(!calculateYn){
		calculateYn = "N"
	}else if(isEmpty(calculateYnStartDate)) {
		alert("조회 시작일을 입력해주세요");
		$("#calculateYnStartDate").focus();
		return false;
	}else if(isEmpty(calculateYnEndDate)) {
		alert("조회 종료일을 입력해주세요");
		$("#calculateYnEndDate").focus();
		return false;
	}else{
		calculateYn = "Y";
	}

	console.log("정산금액 문의 체크 여부: "+calculateYn);
	console.log("정산금액 문의 조회 시작일: "+calculateYnStartDate);
	console.log("정산금액 문의 조회 종료일: "+calculateYnEndDate);


	// 수수료 문의 체크 여부에 따른 Y N 처리 
	if(!commissionYn){
		commissionYn = "N";
	}else{
		commissionYn = "Y";
	}

	console.log("입금일정 문의 체크 여부: "+commissionYn);


	// 매출자료 문의 선택했을 경우 필수 날짜 입력 체크 및 Y N 처리
	if(!salesDataYn){
		salesDataYn = "N"
	}else if(isEmpty(salesDataYnStartDate)) {
		alert("조회 시작일을 입력해주세요");
		$("#salesDataYnStartDate").focus();
		return false;
	}else if(isEmpty(salesDataYnEndDate)) {
		alert("조회 종료일을 입력해주세요");
		$("#salesDataYnEndDate").focus();
		return false;
	}else{
		salesDataYn = "Y";
	}

	console.log("매출자료 문의 체크 여부: "+salesDataYn);
	console.log("매출자료 문의 조회 시작일: "+salesDataYnStartDate);
	console.log("매출자료 문의 조회 종료일: "+salesDataYnEndDate);

	
	// 기타 문의 선택했을 경우 내용 입력 체크 
	if(!userMemoYn){
		userMemoYn = "N"
	}else if(isEmpty(userMemo)) {
		alert("문의 내용을 입력해주세요");
		$("#userMemo").focus();
		return false;
	}else{
		userMemoYn = "Y";
	}

	console.log("기타문의 체크 여부: "+userMemoYn);
	console.log("기타문의 내용: "+userMemo);

	
	// 문의 내용 항목 선택 체크
	if(!$("input:checkbox").is(":checked")){
		alert("문의내용 항목을 최소 1개 이상 선택해주세요");
		return false;
	}



	// 쿠폰사용문의 체크 여부에 따른 Y N 처리 
	if(!couponUseYn){
		couponUseYn = "N";
	}else{
		couponUseYn = "Y";
	}
	console.log("쿠폰사용문의 체크 여부: "+couponUseYn);


	// 쿠폰승인요청문의 여부에 따른 Y N 처리 
	if(!couponAllowYn){
		couponAllowYn = "N";
	}else{
		couponAllowYn = "Y";
	}
	console.log("쿠폰승인요청문의 체크 여부: "+couponAllowYn);


	// 쿠폰번호조회요청 체크 여부에 따른 Y N 처리 
	if(!couponCheckYn){
		couponCheckYn = "N";
	}else{
		couponCheckYn = "Y";
	}
	console.log("쿠폰번호조회요청 체크 여부: "+couponCheckYn);

	
	// 포스에러로 인한 쿠폰 승인취소 체크 여부에 따른 Y N 처리 
	if(!posErrYn){
		posErrYn = "N";
	}else{
		posErrYn = "Y";
	}
	console.log("포스에러로 인한 쿠폰 승인취소 체크 여부: "+posErrYn);
	
	// 포스매출확인 불가로 인한 쿠폰 승인취소 요청 체크 여부에 따른 Y N 처리 
	if(!posSalesYn){
		posSalesYn = "N";
	}else{
		posSalesYn = "Y";
	}
	console.log("포스매출확인 불가로 인한 쿠폰 승인취소 요청 체크 여부: "+posSalesYn);

	// 오결제건 승인취소 요청 체크 여부에 따른 Y N 처리 
	if(!failPaymentYn){
		failPaymentYn = "N";
	}else{
		failPaymentYn = "Y";
	}
	console.log("오결제건 승인취소 요청 체크 여부: "+failPaymentYn);

	// 아이디 비밀번호 문의 체크 여부에 따른 Y N 처리 
	if(!findIdpwdYn){
		findIdpwdYn = "N";
	}else{
		findIdpwdYn = "Y";
	}
	console.log("아이디 비밀번호 문의 체크 여부: "+findIdpwdYn);

	// 사용방법 체크 여부에 따른 Y N 처리 
	if(!manualYn){
		manualYn = "N";
	}else{
		manualYn = "Y";
	}
	console.log("사용방법 체크 여부: "+manualYn);

	
	// customType에 따른 문의 등록 ajax
	$.ajax({
		url: "/insertAsk",
		type: "post",
		contentType: "application/json",
		data: {"customType":customType, "rcompanyName":rcompanyName,"branchName":branchName, "ownerName":ownerName, "corpNo":corpNo, "replyPhoneNo":replyPhoneNo,
			   "replyEmail":replyEmail, "taxYn":taxYn, "taxYnStartDate":taxYnStartDate, "taxYnEndDate":taxYnEndDate, "depositYn":depositYn, 
			   "calculateYn":calculateYn, "calculateYnStartDate":calculateYnStartDate, "calculateYnEndDate":calculateYnEndDate, "commissionYn":commissionYn,
			   "salesDataYn":salesDataYn, "salesDataYnStartDate":salesDataYnStartDate, "salesDataYnEndDate":salesDataYnEndDate, "userMemoYn":userMemoYn, "userMemo":userMemo,
			   "couponUseYn":couponUseYn, "couponAllowYn":couponAllowYn, "couponCheckYn":couponCheckYn, "posErrYn":posErrYn, "posSalesYn":posSalesYn, "failPaymentYn":failPaymentYn,
			   "findIdpwdYn":findIdpwdYn, "manualYn":manualYn
			   },
		dataType: "json",
		success: function(data){

			alert(data.responseText);
			
			if(data.result == "00"){
				//alert("문의가 정상 등록되었습니다.");
				
				
				
				location.reload();
			}else{
				alert("입력 정보를 다시 확인해주세요");
			}
			
			console.log(data);
		},
		error: function(data){
			console.log(data);

			alert("잘못된 접근입니다");
			
		}
	});

}



$(function(){
	// 날짜 입력용으로 날짜를 받아옴
	var startDate = new Date();
	var fechaFin = new Date();
	var FromEndDate = new Date();
	var ToEndDate = new Date();


	// datepicker 날짜 입력 년월 ex)2019/02
	$('.from').datepicker({
	    autoclose: true,
	    minViewMode: 1,
	    format: 'yyyy/mm'
	}).on('changeDate', function(selected){
	        startDate = new Date(selected.date.valueOf());
	        startDate.setDate(startDate.getDate(new Date(selected.date.valueOf())));
	        $('.to').datepicker('setStartDate', startDate);
	    }); 
	$('.to').datepicker({
	    autoclose: true,
	    minViewMode: 1,
	    format: 'yyyy/mm'
	}).on('changeDate', function(selected){
	        FromEndDate = new Date(selected.date.valueOf());
	        FromEndDate.setDate(FromEndDate.getDate(new Date(selected.date.valueOf())));
	        $('.from').datepicker('setEndDate', FromEndDate);
	    });

	// datepicker 날짜 입력 년월일 ex)2019/02/12
    $('.dayFrom').datepicker({
		autoclose: true,
		format: 'yyyy/mm/dd'
    }).on('changeDate', function(selected){
        startDate = new Date(selected.date.valueOf());
        startDate.setDate(startDate.getDate(new Date(selected.date.valueOf())));
        $('.dayTo').datepicker('setStartDate', startDate);
    }); 
    $('.dayTo').datepicker({
		autoclose: true,
		format: 'yyyy/mm/dd'
    }).on('changeDate', function(selected){
        FromEndDate = new Date(selected.date.valueOf());
        FromEndDate.setDate(FromEndDate.getDate(new Date(selected.date.valueOf())));
        $('.from').datepicker('setEndDate', FromEndDate);
    });


	// 세금계산서 문의 체크에 따른 날짜 입력폼 노출 여부 
	$("#taxYn").change(function(){
        if($("#taxYn").is(":checked")){
            $("#taxDate").show();
        }else{
        	$("#taxDate").hide();
        	$("#taxYnStartDate").val("");	// 입력값 삭제
        	$("#taxYnEndDate").val("");		// 입력값 삭제
        }
    });
	
	// 정산금액 문의 체크에 따른 날짜 입력폼 노출 여부
	$("#calculateYn").change(function(){
        if($("#calculateYn").is(":checked")){
            $("#calculateDate").show();
        }else{
        	$("#calculateDate").hide();
        	$("#calculateYnStartDate").val(""); // 입력값 삭제
        	$("#calculateYnEndDate").val("");	// 입력값 삭제
        }
    });

	// 매출자료 문의 체크에 따른 날짜 입력폼 노출 여부
	$("#salesDataYn").change(function(){
        if($("#salesDataYn").is(":checked")){
            $("#salesDataDate").show();
        }else{
        	$("#salesDataDate").hide();
        	$("#salesDataYnStartDate").val(""); // 입력값 삭제
        	$("#salesDataYnEndDate").val("");	// 입력값 삭제
        }
    });
    
	
	inputEamil();	// 이메일 직접입력이나 선택입력에 따른 입력 처리 함수


	// 기타 문의 체크에 따른 입력폼 노출 여부
	$("#userMemoYn").change(function(){
        if($("#userMemoYn").is(":checked")){
            $("#userMemoView").show();
        }else{
        	$("#userMemoView").hide();
        	$("#userMemo").val(""); // 입력값 삭제
        }
    });
	

    
});
</script>
</head>
<body class="bg-gradient-primary">
 	<tiles:insertAttribute name="body"></tiles:insertAttribute>
</body>
	<tiles:insertAttribute name="footer"></tiles:insertAttribute>
</html>
