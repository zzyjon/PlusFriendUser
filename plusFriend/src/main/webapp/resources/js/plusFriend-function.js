/*
 * 
 * plus friend user 함수 모음
 * 
 */

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



	function Check_nonTag(text){
	 var opentag = '><';
	 var i ; 
	 
	 for ( i=0; i < text.length; i++ ){
	  if( opentag.indexOf(text.substring(i,i+1)) > 0){
	   break ; 
	  }
	 }
	 
	 if ( i != text.length ){
	  return false;
	 }else{
	  return true ;
	 } 
	 
	 return false;
	} 

	function Check_nonTagReturn(inputId){
	  alert("HTML 태그는 입력하실 수 없습니다! 예)< > 기호...");
	  document.getElementById(inputId).focus();
	  return false;
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
				 $(".replyEmail2").hide();
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

//숫자만 입력받도록 하는 함수
function onlyNumber(obj) {
    var value = obj.val();
    obj.val(value.replace(/[^0-9]/g, ''));  
}


//한글입력 안되게 처리
function onlyEngNum(obj){
	if (!(event.keyCode >=37 && event.keyCode<=40)) {
		
		var inputVal = obj.val();
		
		$(this).val(inputVal.replace(/[^a-z0-9]/gi,''));
		
	}
}


// 키보드 입력 시 영어와 숫자만 입력 가능하도록
function IsAlphaNumeric(event) {
   var inputChar = String.fromCharCode(event.keyCode);
   var ret = false;
   if (inputChar == "" && inputChar == null) { 
      ret = false; 
   } else { 
      if (inputChar.search(/[a-z0-9]+$/gi) >= 0) { ret = true; } else { ret = false; } 
   }
   // error message
   if (!ret) { 
      alert("영어와 숫자만 입력 가능. \n char:" + String.fromCharCode(event.keyCode) + ", keycode: " + event.keyCode); 
   }
   return ret;
}


//이메일 형식 체크 
function chkEmail(str) {
    //var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    var regExp = /([A-Za-z0-9`~!@#$%^&*|\\\'\";:\/?,.()=+-]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    if (regExp.test(str)) return true;

    else return false;
}


function chEmoji(str) {
    
    return str;	
}




//이메일 도메인 형식 체크 
function chkEmailDomain(str) {

    var regExp = /[0-9a-zA-Z]*.[a-zA-Z]{2,3}$/i;

    if (regExp.test(str)) return true;

    else return false;

}


//한글 자음 또는 모음만 입력 검사하는 함수
function correctHangeul(str) {
	var regExp = /([^가-힣\x20])/i;
	//obj.val(value.replace(/([^가-힣\x20])/i, ''));  
	if(regExp.test(str) == true){
		return true;
	}else{
		return false;
	}
}

//공백 금지
function isBlank(str){
	//var blank_pattern = /^\s+|\s+$/g;(/\s/g
	var pattern = /[\s]/g;
	if( pattern.test( str) == true){
		return true;
	}else{
		return false;
	}
}


//공백만 입력 금지
function isOnlyBlank(str){
	var pattern = /^\s+|\s+$/g;
	if( pattern.test( str) == true){
		return true;
	}else{
		return false;
	}
}


// 한글 영문 숫자 공백 허용
function isHanEngNumBlank(str){
	var pattern = /^[ㄱ-ㅎ가-힣a-zA-Z\s0-9]+$/; //한글+영문+숫자+공백
	if( pattern.test( str) == true){
		return true;
	}else{
		return false;
	}
}


// 영어 금지
function isEng(str){
	var pattern = /[^a-zA-Z]/g;
	if( pattern.test( str) == true){
		return true;
	}else{
		return false;
	}
}


//한글과 영어만 입력
function isHanEng(str){
	var pattern = /([^가-힣\x20a-zA-Z])/i;  
	if( pattern.test( str) == true){
		return true;
	}else{
		return false;
	}
}


//한글과 영어 숫자만 입력
function isHanEngNum(str){
	var pattern = /([^ㄱ-ㅎ가-힣\x20a-zA-Z0-9])/i;  
	if( pattern.test( str) == true){
		return true;
	}else{
		return false;
	}
}

//숫자와 영어만 입력
function isNumEng(str){
	//var pattern = /([^0-9\x20a-zA-Z]){6,22}/g;  
	//var pattern = /^[A-Za-z0-9]+$/; 
	var pattern = /^[A-Za-z0-9+]{4,22}$/;
	if( pattern.test( str) == true){
		return true;
	}else{
		return false;
	}
}


//숫자만 입력받도록 하는 함수
function isNumber(str){
	var pattern = /([^0-9])/i;  
	if( pattern.test( str) == true){
		return true;
	}else{
		return false;
	}
}


// 한글 영어 숫자 특수문자 허용
function isHanEngNumSpecial(str){
	var pattern = /[ㄱ-ㅎ가-힣a-z0-9`~!@#$%^&*|\\\'\";:\/?,.()=+-]/gi;
	if( pattern.test(str) == true ){
		return true;
	}else{
		return false;
	}
}

//한글 영어 숫자 공백 허용
function isEngHanNumBlank(str){
	var pattern = /^[A-Z0-9ㄱ-ㅎ가-힣 _]*[A-Z0-9ㄱ-ㅎ가-힣][A-Z0-9ㄱ-ㅎ가-힣 _]*$/;
	if( pattern.test(str) == true ){
		return true;
	}else{
		return false;
	}
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

// 일반전화 형식 체크
function chHPNum(num) {
	//var regExp = /^(0(2|3[1-3]|4[1-4]|5[1-5]|6[1-4]))-(\d{3,4})-(\d{4})$/;
	var regExp = /^(070|02|031|032|033|041|042|043|051|052|053|054|055|061|062|063|064)-?\d{3,4}-?\d{4}$/;

	if(regExp.test(num)){
		return true;
	}else{
		return false;
	}
}


// 이메일 아이디 유효성 체크
function isEmailID(str){
	//var pattern = /^[A-za-z0-9]{5,15}/g;
	var pattern = /^[A-Za-z0-9`~!@#$%^&*|\\\'\";:\/?,.()=+-<>]{2,20}$/;
	if( pattern.test( str) == true){
		return true;
	}else{
		return false;
	}
}


//사업자등록번호 체크 
function checkBizID(bizID) {
	
	if(bizID.length != 10){
		return false;
	}
	
    // bizID는 숫자만 10자리로 해서 문자열로 넘긴다. 
    var checkID = new Array(1, 3, 7, 1, 3, 7, 1, 3, 5, 1); 
    var tmpBizID, i, chkSum=0, c2, remander; 
     bizID = bizID.replace(/-/gi,''); 

     for (i=0; i<=7; i++) chkSum += checkID[i] * bizID.charAt(i); 
     c2 = "0" + (checkID[8] * bizID.charAt(8)); 
     c2 = c2.substring(c2.length - 2, c2.length); 
     chkSum += Math.floor(c2.charAt(0)) + Math.floor(c2.charAt(1)); 
     remander = (10 - (chkSum % 10)) % 10 ; 

    if (Math.floor(bizID.charAt(9)) == remander) return true ; // OK! 
      return false; 
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
 * 엔터키 눌렀을 때 이벤트 
 * */
function doEnterPress($this) {
	if($this.keyCode == 13){
		
	}
}

/* 영문입력시 자동으로 대문자 변환 */
function upper(e,r){
	r.value=r.value.toUpperCase();
}

/* html태그 제거 */
function strip_tags (input, allowed) {
    allowed = (((allowed || "") + "").toLowerCase().match(/<[a-z][a-z0-9]*>/g) || []).join(''); // making sure the allowed arg is a string containing only tags in lowercase (<a><b><c>)
    var tags = /<\/?([a-z][a-z0-9]*)\b[^>]*>/gi,
        commentsAndPhpTags = /<!--[\s\S]*?-->|<\?(?:php)?[\s\S]*?\?>/gi;
    return input.replace(commentsAndPhpTags, '').replace(tags, function ($0, $1) {        return allowed.indexOf('<' + $1.toLowerCase() + '>') > -1 ? $0 : '';
    });
}


/**
 * 문자열의 바이트수 리턴
 * @returns {Number}
 */
function byteLength(str) {
    var l= 0;
    
    if(str == null){
    	return 0;
    }else if(str.length > 0 ){
    	for(var idx=0; idx < str.length; idx++) {
    		var c = escape(str.charAt(idx));
    		
    		if( c.length==1 ) l ++;
    		else if( c.indexOf("%u")!=-1 ) l += 2;
    		else if( c.indexOf("%")!=-1 ) l += c.length/3;
    	}
    }
    
    return l;
};


function hideDiv(arg) {
	
    var id = arg.getAttribute('id');
    console.log(id);
    $('.'+id).hide();
	
	
	/*$("#"+arg).on("propertychange change keyup paste input", function() {
	    var currentVal = $(this).val();
	    if(currentVal == oldVal) {
	        return;
	    }
	    oldVal = currentVal;
	    

	    alert("changed!");
	});*/
	
}

//정산 문의 등록 ajax
function doFormsubmit(customType) {

	// 공통 항목
	var customType				= "";														// 문의종류
	customType					= customType;		
	var rcompanyName			= $("#rcompanyName").val().trim();							// 브랜드명
	var branchName 				= $("#branchName").val().trim();							// 지점명
	var replyPhoneNo			= $("#replyPhoneNo").val();									// 회신받을 연락처(고객연락처)
	var replyEmail1				= $("#replyEmail1").val().trim();							// 고객이메일 아이디
	var replyEmail2				= $("#replyEmail2").val().trim();							// 고객이메일 도메인
	var replyEmail				= "";														// 고객이메일 replyEmail1 + replyEmail2 합친것 'admin' + '@' + 'test.com'
	var userMemoYn				= $("input:checkbox[id='userMemoYn']").is(":checked");		// 기타문의 체크시 true 미체크시  false
	var userMemo				= $("#userMemo").val().trim();								// 기타문의 고객이 직접 작성한 내용
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

	
	// 브랜드 유효성 체크
	if(isEmpty(rcompanyName)){
		//alert("브랜드명을 입력해주세요");
		$(".rcompanyName").show().text("브랜드명을 입력해주세요.").css('color','red').css('font-size', '80%');
		$("#rcompanyName").focus();
		return false;
	}else if(!isHanEngNumSpecial(rcompanyName)){
		$(".rcompanyName").show().text("브랜드명은 한글 영어 숫자 특수문자만 입력 가능합니다.").css('color','red').css('font-size', '80%');
		//alert("브랜드명은 한글 영어 숫자 특수문자만 입력 가능합니다.");
		$("#rcompanyName").focus();
		return false;
	}else{
		var value = strip_tags(rcompanyName);
		$("#rcompanyName").val(value);
	}  

	
	// 지점명 유효성 체크
	if(isEmpty(branchName)){
		$(".branchName").show().text("지점명을 입력해주세요.").css('color','red').css('font-size', '80%');
		//alert("지점명을 입력해주세요");
		$("#branchName").focus();
		return false;
	}else if(isHanEngNum(branchName)){
		$(".branchName").show().text("지점명은 한글 영어 숫자만 입력할 수 있습니다.").css('color','red').css('font-size', '80%');
		//alert("지점명은 한글 영어 숫자만 입력할 수 있습니다");
		$("#branchName").focus();
		return false;
	}

	
	// 연락처 번호 유효성 체크
	if(isEmpty(replyPhoneNo)) {
		$(".replyPhoneNo").show().text("연락처를 입력해주세요.").css('color','red').css('font-size', '80%');
		//alert("연락처를 입력해주세요");
		$("#replyPhoneNo").focus();
		return false;
	}else if(isNumber(replyPhoneNo)){
		$(".replyPhoneNo").show().text("연락처는 숫자만 입력해주세요.").css('color','red').css('font-size', '80%');
		//alert("연락처는 숫자만 입력해주세요");
		$("#replyPhoneNo").focus();
		return false;
	}else if(!chHPNum(replyPhoneNo) && !chMobileNum(replyPhoneNo)){
		$(".replyPhoneNo").show().text("올바른 번호를 입력해주세요.").css('color','red').css('font-size', '80%');
		//alert("번호 형식을 확인해주세요\n핸드폰번호: \n예시1)01012345678 11자리 \n예시2)0119876543 10자리 \n일반전화: \n예시1)029876543 서울02 9~10자리 이외 지역 10~11자리  ");
		$("#replyPhoneNo").focus();
		return false;
	}
	
	if((!isEmpty(replyEmail1) && !isEmpty(replyEmail2)) || (!isEmpty(replyEmail1) || !isEmpty(replyEmail2)) ){
		// 이메일 첫부분(아이디)과 두번째부분(도메인)의 입력을 체크 후 이메일 형식으로 합침 
		if(isEmpty(replyEmail1)){
			$(".replyEmail1").show().text("이메일 아이디를 입력해주세요.").css('color','red').css('font-size', '80%');
			//alert("이메일 아이디를 입력해주세요");
			$("#replyEmail1").focus();
			return false;
		}else if(!isEmailID(replyEmail1)){
			$(".replyEmail1").show().text("이메일 아이디 형식을 확인해주세요. 아이디 형식은 영문 숫자 특수문자 2~20글자 입니다.").css('color','red').css('font-size', '80%');
			//alert("이메일 아이디 형식을 확인해주세요\n아이디 형식은 영문 숫자 특수문자 2~20글자 입니다.");
			$("#replyEmail1").focus();
			return false;
		}else{
			var value = strip_tags(replyEmail1);
			$("#replyEmail1").val(value);
		}
		if(isEmpty(replyEmail2) && !isEmpty(replyEmail1)){
			$(".replyEmail2").show().text("이메일 도메인을 입력해주세요.").css('color','red').css('font-size', '80%');
			//alert("이메일 도메인을 입력해주세요");
			$("#replyEmail2").focus();
			return false;
		}else{
			replyEmail = replyEmail1.concat("@",replyEmail2);	// 이메일 아이디와 이메일 도메인이 모두 입력 된 상태에서 이메일 형식으로 합침
			
			if(!chkEmail(replyEmail)){
				$(".replyEmail2").show().text("이메일 형식이 맞지 않습니다.예시) google.com").css('color','red').css('font-size', '80%');
				//alert("이메일 형식이 맞지 않습니다.\n예시) google.com");
				$("#replyEmail2").focus();
				return false;
			}else{
				$("input[name=replyEmail]").val(replyEmail);
				console.log("이메일 :"+replyEmail);
			};
		}
	}
	

	// 세금계산서 선택했을 경우 필수 날짜 입력 체크 및 Y N 처리
	if(!taxYn){
		$("input[name=taxYn]").val("N");
	}else if(isEmpty(taxYnStartDate)) {
		$(".taxYnStartDate").show().text("조회 시작일을 입력해주세요.").css('color','red').css('font-size', '80%');
		$("#taxYnStartDate").focus();
		return false;
	}else if(isEmpty(taxYnEndDate)) {
		$(".taxYnEndDate").show().text("조회 종료일을 입력해주세요.").css('color','red').css('font-size', '80%');
		$("#taxYnEndDate").focus();
		return false;
	}else{
		$("input[name=taxYn]").val("Y");
	}

	
	// 입금일정 문의 체크 여부에 따른 Y N 처리 
	if(!$("input:checkbox[id='depositYn']").is(":checked")){
		$("input[name=depositYn]").val("N");
	}else{
		$("input[name=depositYn]").val("Y");
	}


	// 정산금액 문의 선택했을 경우 필수 날짜 입력 체크 및 Y N 처리
	if(!calculateYn){
		$("input[name=calculateYn]").val("N");
	}else if(isEmpty(calculateYnStartDate)) {
		$(".calculateYnStartDate").show().text("조회 시작일을 입력해주세요.").css('color','red').css('font-size', '80%');
		//alert("조회 시작일을 입력해주세요");
		$("#calculateYnStartDate").focus();
		return false;
	}else if(isEmpty(calculateYnEndDate)) {
		$(".calculateYnEndDate").show().text("조회 종료일을 입력해주세요.").css('color','red').css('font-size', '80%');
		//alert("조회 종료일을 입력해주세요");
		$("#calculateYnEndDate").focus();
		return false;
	}else{
		$("input[name=calculateYn]").val("Y");
	}

	// 수수료 문의 체크 여부에 따른 Y N 처리 
	if(!commissionYn){
		$("input[name=commissionYn]").val("N");
	}else{
		$("input[name=commissionYn]").val("Y");
	}


	// 매출자료 문의 선택했을 경우 필수 날짜 입력 체크 및 Y N 처리
	if(!salesDataYn){
		$("input[name=salesDataYn]").val("N");
	}else if(isEmpty(salesDataYnStartDate)) {
		$(".salesDataYnStartDate").show().text("조회 시작일을 입력해주세요.").css('color','red').css('font-size', '80%');
		//alert("조회 시작일을 입력해주세요");
		$("#salesDataYnStartDate").focus();
		return false;
	}else if(isEmpty(salesDataYnEndDate)) {
		$(".salesDataYnEndDate").show().text("조회 종료일을 입력해주세요.").css('color','red').css('font-size', '80%');
		//alert("조회 종료일을 입력해주세요");
		$("#salesDataYnEndDate").focus();
		return false;
	}else{
		$("input[name=salesDataYn]").val("Y");
	}


	// 기타 문의 선택했을 경우 내용 입력 체크 
	if(!userMemoYn){
		$("input[name=userMemoYn]").val("N");
	}else if(isEmpty(userMemo)) {
		$(".userMemo").show().text("문의 내용을 입력해주세요.").css('color','red').css('font-size', '80%');
		//alert("문의 내용을 입력해주세요");
		$("#userMemo").focus();
		return false;
	}else{
		var memo = strip_tags(userMemo);
		$("#userMemo").val(memo);
		$(".current").text(byteLength(memo));
		$("input[name=userMemoYn]").val("Y");
	}
	
	// 문의 내용 항목 선택 체크
	if(!$(".askCheck").is(":checked")){
		alert("문의내용 항목을 최소 1개 이상 선택해주세요");
		return false;
	}
	
	// 개인정보활용동의 체크
	if(!$("#infoAllow").is(":checked")){
		alert("개인정보활용동의에 체크해주세요");
		return false;
	}
	
	//var params = JSON.stringify($("#calForm").serialize());
	var params = $("#calForm").serialize();
	
	/*
	// 폼 전송
	var form = $('#calForm').attr('action', "/insertAsk")
	form.attr("method", "post").submit();
	*/
	
	if(isProcess) {
		alert("요청을 처리 중입니다.")
		return;
	} else {
		isProcess = true;
	}
	
	
	// customType에 따른 문의 등록 ajax
	$.ajax({
		url: "/insertAsk",
		type: "post",
		data: params,
		dataType: "json",
		success: function(data){
			
			if(data.result == "00"){
				//location.href="/complete";
				location.replace("/complete");
			}else{
				alert("문의 등록이 실패했습니다\n페이지 새로고침 후 다시 시도해주세요");
				isProcess = false;
			}
			console.log(data);
		},
		error: function(data){
			console.log(data);
			alert("시스템 에러 고객센터에 문의 주세요");
			isProcess = false;
		}
	});
	
	
}

//쿠폰문의 등록 ajax 
function doSubmitConpon() {
	
	// 공통 항목
	var rcompanyName			= $("#rcompanyName").val().trim();							// 브랜드명
	var branchName 				= $("#branchName").val().trim();							// 지점명
	var replyPhoneNo			= $("#replyPhoneNo").val();									// 회신받을 연락처(고객연락처)
	var replyEmail1				= $("#replyEmail1").val().trim();							// 고객이메일 아이디
	var replyEmail2				= $("#replyEmail2").val().trim();							// 고객이메일 도메인
	var replyEmail				= "";														// 고객이메일 replyEmail1 + replyEmail2 합친것 'admin' + '@' + 'test.com'
	var userMemoYn				= $("input:checkbox[id='userMemoYn']").is(":checked");		// 기타문의 체크시 true 미체크시  false
	var userMemo				= $("#userMemo").val().trim();								// 기타문의 고객이 직접 작성한 내용
	// 쿠폰문의 항목
	var couponNum				= $("#couponNum").val().trim();								// 쿠폰번호
	var couponUseYn				= $("input:checkbox[id='couponUseYn']").is(":checked");		// 쿠폰사용여부 조회 체크 여부 체크시 true 미체크시 false
	var couponAllowYn			= $("input:checkbox[id='couponAllowYn']").is(":checked");	// 쿠폰승인요청 체크 여부 체크시 true 미체크시 false	
	var couponCheckYn			= $("input:checkbox[id='couponCheckYn']").is(":checked");	// 쿠폰번호 조회 체크 여부 체크시 true 미체크시 false
	var posErrYn				= $("input:checkbox[id='posErrYn']").is(":checked");		// 포스에러로 인한 쿠폰 승인취소 요청 체크시 true 미체크시 false
	var posSalesYn				= $("input:checkbox[id='posSalesYn']").is(":checked");		// 포스매출확인 불가로 인한 쿠폰 승인취소 요청 체크 시 true 미체크시 false
	var failPaymentYn			= $("input:checkbox[id='failPaymentYn']").is(":checked");	// 오결제 건 승인취소 요청 체크시 true 미체크시 false

	// 브랜드 유효성 체크
	if(isEmpty(rcompanyName)){
		//alert("브랜드명을 입력해주세요");
		$(".rcompanyName").show().text("브랜드명을 입력해주세요.").css('color','red').css('font-size', '80%');
		$("#rcompanyName").focus();
		return false;
	}else if(!isHanEngNumSpecial(rcompanyName)){
		$(".rcompanyName").show().text("브랜드명은 한글 영어 숫자 특수문자만 입력 가능합니다.").css('color','red').css('font-size', '80%');
		//alert("브랜드명은 한글 영어 숫자 특수문자만 입력 가능합니다.");
		$("#rcompanyName").focus();
		return false;
	}else{
		var value = strip_tags(rcompanyName);
		$("#rcompanyName").val(value);
	}  

	
	// 지점명 유효성 체크
	if(isEmpty(branchName)){
		$(".branchName").show().text("지점명을 입력해주세요.").css('color','red').css('font-size', '80%');
		//alert("지점명을 입력해주세요");
		$("#branchName").focus();
		return false;
	}else if(isHanEngNum(branchName)){
		$(".branchName").show().text("지점명은 한글 영어 숫자만 입력할 수 있습니다.").css('color','red').css('font-size', '80%');
		//alert("지점명은 한글 영어 숫자만 입력할 수 있습니다");
		$("#branchName").focus();
		return false;
	}

	
	// 쿠폰번호 유효성 체크
	if(isEmpty(couponNum)){
		$(".couponNum").show().text("쿠폰번호를 입력해주세요.").css('color','red').css('font-size', '80%');
		$("#couponNum").focus();
		return false;
	}else if(!isNumEng(couponNum)){
		$(".couponNum").show().text("쿠폰번호는 4자리 이상 22자리 이하 숫자와 영어만 입력할 수 있습니다.").css('color','red').css('font-size', '80%');
		//alert("쿠폰번호는 4자리 이상 22자리 이하 숫자와 영어만 입력할 수 있습니다");
		$("#couponNum").focus();
		return false;
	}
	
	// 연락처 번호 유효성 체크
	if(isEmpty(replyPhoneNo)) {
		$(".replyPhoneNo").show().text("연락처를 입력해주세요.").css('color','red').css('font-size', '80%');
		//alert("연락처를 입력해주세요");
		$("#replyPhoneNo").focus();
		return false;
	}else if(isNumber(replyPhoneNo)){
		$(".replyPhoneNo").show().text("연락처는 숫자만 입력해주세요.").css('color','red').css('font-size', '80%');
		//alert("연락처는 숫자만 입력해주세요");
		$("#replyPhoneNo").focus();
		return false;
	}else if(!chHPNum(replyPhoneNo) && !chMobileNum(replyPhoneNo)){
		$(".replyPhoneNo").show().text("번호 형식을 확인해주세요\n핸드폰번호: \n예시1)01012345678 11자리 \n예시2)0119876543 10자리 \n일반전화: \n예시1)029876543 서울02 9~10자리 이외 지역 10~11자리 ").css('color','red').css('font-size', '80%');
		//alert("번호 형식을 확인해주세요\n핸드폰번호: \n예시1)01012345678 11자리 \n예시2)0119876543 10자리 \n일반전화: \n예시1)029876543 서울02 9~10자리 이외 지역 10~11자리  ");
		$("#replyPhoneNo").focus();
		return false;
	}
	
	
	if((!isEmpty(replyEmail1) && !isEmpty(replyEmail2)) || (!isEmpty(replyEmail1) || !isEmpty(replyEmail2)) ){
		// 이메일 첫부분(아이디)과 두번째부분(도메인)의 입력을 체크 후 이메일 형식으로 합침 
		if(isEmpty(replyEmail1)){
			$(".replyEmail1").show().text("이메일 아이디를 입력해주세요.").css('color','red').css('font-size', '80%');
			//alert("이메일 아이디를 입력해주세요");
			$("#replyEmail1").focus();
			return false;
		}else if(!isEmailID(replyEmail1)){
			$(".replyEmail1").show().text("이메일 아이디 형식을 확인해주세요. 아이디 형식은 영문 숫자 특수문자 2~20글자 입니다.").css('color','red').css('font-size', '80%');
			//alert("이메일 아이디 형식을 확인해주세요\n아이디 형식은 영문 숫자 특수문자 2~20글자 입니다.");
			$("#replyEmail1").focus();
			return false;
		}else{
			var value = strip_tags(replyEmail1);
			$("#replyEmail1").val(value);
		}
		if(isEmpty(replyEmail2) && !isEmpty(replyEmail1)){
			$(".replyEmail2").show().text("이메일 도메인을 입력해주세요.").css('color','red').css('font-size', '80%');
			//alert("이메일 도메인을 입력해주세요");
			$("#replyEmail2").focus();
			return false;
		}else{
			replyEmail = replyEmail1.concat("@",replyEmail2);	// 이메일 아이디와 이메일 도메인이 모두 입력 된 상태에서 이메일 형식으로 합침
			
			if(!chkEmail(replyEmail)){
				$(".replyEmail2").show().text("이메일 형식이 맞지 않습니다.예시) google.com").css('color','red').css('font-size', '80%');
				//alert("이메일 형식이 맞지 않습니다.\n예시) google.com");
				$("#replyEmail2").focus();
				return false;
			}else{
				$("input[name=replyEmail]").val(replyEmail);
				console.log("이메일 :"+replyEmail);
			};
		}
	}
	
	// 쿠폰사용문의 체크 여부에 따른 Y N 처리 
	if(!$("input:checkbox[id='couponUseYn']").is(":checked")){
		$("input[name=couponUseYn]").val("N");
	}else{
		$("input[name=couponUseYn]").val("Y");
	}
	console.log("쿠폰사용문의 체크 여부: "+$("input[name='couponUseYn']").val());


	// 쿠폰승인요청문의 여부에 따른 Y N 처리
	if(!$("input:checkbox[id='couponAllowYn']").is(":checked")){
		$("input[name=couponAllowYn]").val("N");
	}else{
		$("input[name=couponAllowYn]").val("Y");
	}
	console.log("쿠폰승인요청문의 체크 여부: "+$("input:checkbox[id='couponAllowYn']").val());


	// 쿠폰번호조회요청 체크 여부에 따른 Y N 처리 
	if(!$("input:checkbox[id='couponCheckYn']").is(":checked")){
		$("input[name=couponCheckYn]").val("N");
	}else{
		$("input[name=couponCheckYn]").val("Y");
	}
	console.log("쿠폰번호조회요청 문의 체크 여부: "+$("input:checkbox[id='couponCheckYn']").val());
	
	// 포스에러로 인한 쿠폰 승인취소 체크 여부에 따른 Y N 처리
	if(!$("input:checkbox[id='posErrYn']").is(":checked")){
		$("input[name=posErrYn]").val("N");
	}else{
		$("input[name=posErrYn]").val("Y");
	}
	console.log("포스에러로 인한 쿠폰 승인취소 체크 여부: "+$("input:checkbox[id='posErrYn']").val());
	
	// 포스매출확인 불가로 인한 쿠폰 승인취소 요청 체크 여부에 따른 Y N 처리 
	if(!$("input:checkbox[id='posSalesYn']").is(":checked")){
		$("input[name=posSalesYn]").val("N");
	}else{
		$("input[name=posSalesYn]").val("Y");
	}
	console.log("포스매출확인 불가로 인한 쿠폰 승인취소 요청 체크 여부: "+$("input:checkbox[id='posSalesYn']").val());
	
	// 오결제건 승인취소 요청 체크 여부에 따른 Y N 처리 
	if(!$("input:checkbox[id='failPaymentYn']").is(":checked")){
		$("input[name=failPaymentYn]").val("N");
	}else{
		$("input[name=failPaymentYn]").val("Y");
	}
	console.log("오결제건 승인취소 요청 체크 여부: "+$("input:checkbox[id='failPaymentYn']").val());
	
	// 기타 문의 선택했을 경우 내용 입력 체크 
	if(!userMemoYn){
		$("input[name=userMemoYn]").val("N");
	}else if(isEmpty(userMemo)) {
		$(".userMemo").show().text("문의 내용을 입력해주세요.").css('color','red').css('font-size', '80%');
		//alert("문의 내용을 입력해주세요");
		$("#userMemo").focus();
		return false;
	}else{
		var memo = strip_tags(userMemo);
		$("#userMemo").val(memo);
		$(".current").text(byteLength(memo));
		$("input[name=userMemoYn]").val("Y");
	}
	
	console.log("기타문의 체크 여부: "+$("#userMemoYn").val());
	console.log("기타문의 내용: "+$("#userMemo").val());
	

	// 문의 내용 항목 선택 체크
	if(!$(".askCheck").is(":checked")){
		alert("문의내용 항목을 최소 1개 이상 선택해주세요");
		return false;
	}
	
	// 개인정보활용동의 체크
	if(!$("#infoAllow").is(":checked")){
		alert("개인정보활용동의에 체크해주세요");
		return false;
	}
	

	//var params = JSON.stringify($("#calForm").serialize());
	var params = $("#couponlForm").serialize();
	
	if(isProcess) {
		alert("요청을 처리 중입니다.")
		return;
	} else {
		isProcess = true;
	}
	
	// customType에 따른 문의 등록 ajax
	$.ajax({
		url: "/insertAsk",
		type: "post",
		data: params,
		dataType: "json",
		success: function(data){
			
			if(data.result == "00"){
				location.replace("/complete");
			}else{
				alert("문의 등록이 실패했습니다\n페이지 새로고침 후 다시 시도해주세요");
				isProcess = false;
			}
			console.log(data);
		},
		error: function(data){
			console.log(data);
			alert("시스템 에러 고객센터에 문의 주세요");
			isProcess = false;
		}
	});
}



/**
 *	쿠폰인증 사이트 문의 접수 
 *
 */
function doSubmitSite() {
	
	// 공통 항목 
	var customType				= "${customType}";											// 문의종류
	var rcompanyName			= $("#rcompanyName").val().trim();							// 브랜드명
	var branchName 				= $("#branchName").val().trim();							// 지점명
	var replyPhoneNo			= $("#replyPhoneNo").val();									// 회신받을 연락처(고객연락처)
	var replyEmail1				= $("#replyEmail1").val().trim();							// 고객이메일 아이디
	var replyEmail2				= $("#replyEmail2").val().trim();							// 고객이메일 도메인
	var replyEmail				= "";														// 고객이메일 replyEmail1 + replyEmail2 합친것 'admin' + '@' + 'test.com'
	var userMemoYn				= $("input:checkbox[id='userMemoYn']").is(":checked");		// 기타문의 체크시 true 미체크시  false
	var userMemo				= $("#userMemo").val().trim();										// 기타문의 고객이 직접 작성한 내용
	// 쿠폰인증 사이트 문의 항목
	var findIdpwdYn				= $("input:checkbox[id='findIdpwdYn']").is(":checked");		// 아이디 및 비밀번호 문의 체크시 true 미체크시 false
	var manualYn				= $("input:checkbox[id='manualYn']").is(":checked");		// 사용방법 문의 체크시 true 미체크시 false

	
	// 브랜드 유효성 체크
	if(isEmpty(rcompanyName)){
		$(".rcompanyName").show().text("브랜드명을 입력해주세요.").css('color','red').css('font-size', '80%');
		$("#rcompanyName").focus();
		return false;
	}else if(!isHanEngNumSpecial(rcompanyName)){
		$(".rcompanyName").show().text("브랜드명은 한글 영어 숫자 특수문자만 입력 가능합니다.").css('color','red').css('font-size', '80%');
		$("#rcompanyName").focus();
		return false;
	}  
	
	// 지점명 유효성 체크
	if(isEmpty(branchName)){
		$(".branchName").show().text("지점명을 입력해주세요.").css('color','red').css('font-size', '80%');
		$("#branchName").focus();
		return false;
	}else if(isHanEngNum(branchName)){
		$(".branchName").show().text("지점명은 한글 영어 숫자만 입력할 수 있습니다.").css('color','red').css('font-size', '80%');
		$("#branchName").focus();
		return false;
	}
	
	// 연락처 번호 유효성 체크
	if(isEmpty(replyPhoneNo)) {
		$(".replyPhoneNo").show().text("연락처를 입력해주세요.").css('color','red').css('font-size', '80%');
		$("#replyPhoneNo").focus();
		return false;
	}else if(isNumber(replyPhoneNo)){
		$(".replyPhoneNo").show().text("연락처는 숫자만 입력해주세요.").css('color','red').css('font-size', '80%');
		$("#replyPhoneNo").focus();
		return false;
	}else if(!chHPNum(replyPhoneNo) && !chMobileNum(replyPhoneNo)){
		$(".replyPhoneNo").show().text("번호 형식을 확인해주세요. 핸드폰번호:예시1)01012345678 11자리 예시2)0119876543 10자리 일반전화: 예시1)029876543 서울02 9~10자리 이외 지역 10~11자리.").css('color','red').css('font-size', '80%');
		$("#replyPhoneNo").focus();
		return false;
	}
	
	if((!isEmpty(replyEmail1) && !isEmpty(replyEmail2)) || (!isEmpty(replyEmail1) || !isEmpty(replyEmail2)) ){
		// 이메일 첫부분(아이디)과 두번째부분(도메인)의 입력을 체크 후 이메일 형식으로 합침 
		if(isEmpty(replyEmail1)){
			$(".replyEmail1").show().text("이메일 아이디를 입력해주세요.").css('color','red').css('font-size', '80%');
			//alert("이메일 아이디를 입력해주세요");
			$("#replyEmail1").focus();
			return false;
		}else if(!isEmailID(replyEmail1)){
			$(".replyEmail1").show().text("이메일 아이디 형식을 확인해주세요. 아이디 형식은 영문 숫자 특수문자 2~20글자 입니다.").css('color','red').css('font-size', '80%');
			//alert("이메일 아이디 형식을 확인해주세요\n아이디 형식은 영문 숫자 특수문자 2~20글자 입니다.");
			$("#replyEmail1").focus();
			return false;
		}else{
			var value = strip_tags(replyEmail1);
			$("#replyEmail1").val(value);
		}
		if(isEmpty(replyEmail2) && !isEmpty(replyEmail1)){
			$(".replyEmail2").show().text("이메일 도메인을 입력해주세요.").css('color','red').css('font-size', '80%');
			//alert("이메일 도메인을 입력해주세요");
			$("#replyEmail2").focus();
			return false;
		}else{
			replyEmail = replyEmail1.concat("@",replyEmail2);	// 이메일 아이디와 이메일 도메인이 모두 입력 된 상태에서 이메일 형식으로 합침
			
			if(!chkEmail(replyEmail)){
				$(".replyEmail2").show().text("이메일 형식이 맞지 않습니다.예시) google.com").css('color','red').css('font-size', '80%');
				//alert("이메일 형식이 맞지 않습니다.\n예시) google.com");
				$("#replyEmail2").focus();
				return false;
			}else{
				$("input[name=replyEmail]").val(replyEmail);
				console.log("이메일 :"+replyEmail);
			};
		}
	}
	
	// 기타 문의 선택했을 경우 내용 입력 체크 
	if(!userMemoYn){
		$("input[name=userMemoYn]").val("N");
	}else if(isEmpty(userMemo)) {
		$(".userMemo").show().text("문의 내용을 입력해주세요.").css('color','red').css('font-size', '80%');
		//alert("문의 내용을 입력해주세요");
		$("#userMemo").focus();
		return false;
	}else{
		var memo = strip_tags(userMemo);
		$("#userMemo").val(memo);
		$(".current").text(byteLength(memo));
		$("input[name=userMemoYn]").val("Y");
	}

	console.log("기타문의 체크 여부: "+$("#userMemoYn").val());
	console.log("기타문의 내용: "+$("#userMemo").val());

	// 아이디 및 비밀번호 찾기 문의 체크 여부에 따른 Y N 처리
	if(!$("input:checkbox[id='findIdpwdYn']").is(":checked")){
		$("input[name=findIdpwdYn]").val("N");
	}else{
		$("input[name=findIdpwdYn]").val("Y");
	}
	console.log("아이디 및 비밀번호 찾기 문의 체크 여부: "+$("input[name=findIdpwdYn]").val());
	
	// 사용방법 문의 체크 여부에 따른 Y N 처리
	if(!$("input:checkbox[id='manualYn']").is(":checked")){
		$("input[name=manualYn]").val("N");
	}else{
		$("input[name=manualYn]").val("Y");
	}
	console.log("사용방법 문의 체크 여부: "+$("input[name=manualYn]").val());

	// 문의 내용 항목 선택 체크
	if(!$(".askCheck").is(":checked")){
		alert("문의내용 항목을 최소 1개 이상 선택해주세요");
		return false;
	}
	
	// 개인정보활용동의 체크
	if(!$("#infoAllow").is(":checked")){
		alert("개인정보활용동의에 체크해주세요");
		return false;
	}
	
	var params = $("#siteForm").serialize();
	
	// 더블클릭 방지
	if(isProcess) {
		alert("요청을 처리 중입니다.")
		return;
	} else {
		isProcess = true;
	}
	
	// customType에 따른 문의 등록 ajax
	$.ajax({
		url: "/insertAsk",
		type: "post",
		data: params,
		dataType: "json",
		success: function(data){
			if(data.result == "00"){
				location.replace("/complete");
			}else{
				alert("문의 등록이 실패했습니다\n페이지 새로고침 후 다시 시도해주세요");
				isProcess = false;
			}
			
			console.log(data);
		},
		error: function(data){
			console.log(data);
			alert("시스템 오류가 발생했습니다 \n잠시 후 다시 시도해주세요");
			
		}
	});

}
