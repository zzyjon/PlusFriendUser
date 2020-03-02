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
var isProcess = false;

$(function(){
	// 날짜 입력용으로 날짜를 받아옴
	var startDate = new Date();
	var fechaFin = new Date();
	var FromEndDate = new Date();
	var ToEndDate = new Date();


	// datepicker 날짜 입력 년월 ex)2019/02
	$('.from').datepicker({
		language : 'ko', // 화면에 출력될 언어를 한국어로 설정한다.
	    autoclose: true,
	    minViewMode: 1,
	    format: 'yyyy/mm'
	}).on('changeDate', function(selected){
	        startDate = new Date(selected.date.valueOf());
	        startDate.setDate(startDate.getDate(new Date(selected.date.valueOf())));
	        $('.to').datepicker('setStartDate', startDate);
	        $('.taxYnStartDate').hide();
	    });
	$('.to').datepicker({
		language : 'ko', // 화면에 출력될 언어를 한국어로 설정한다.
	    autoclose: true,
	    minViewMode: 1,
	    format: 'yyyy/mm' 
	}).on('changeDate', function(selected){
	        FromEndDate = new Date(selected.date.valueOf());
	        FromEndDate.setDate(FromEndDate.getDate(new Date(selected.date.valueOf())));
	        $('.from').datepicker('setEndDate', FromEndDate);
	        $('.taxYnEndDate').hide();
	    });

	// datepicker 날짜 입력 년월일 ex)2019/02/12
    $('.dayFrom').datepicker({
    	language : 'ko', // 화면에 출력될 언어를 한국어로 설정한다.
		autoclose: true,
		format: 'yyyy/mm/dd'
    }).on('changeDate', function(selected){
        startDate = new Date(selected.date.valueOf());
        startDate.setDate(startDate.getDate(new Date(selected.date.valueOf())));
        $('.dayTo').datepicker('setStartDate', startDate);
        $('.calculateYnStartDate').hide();
        $('.salesDataYnStartDate').hide();
    }); 
    $('.dayTo').datepicker({
    	language : 'ko', // 화면에 출력될 언어를 한국어로 설정한다.
		autoclose: true,
		format: 'yyyy/mm/dd'
    }).on('changeDate', function(selected){
        FromEndDate = new Date(selected.date.valueOf());
        FromEndDate.setDate(FromEndDate.getDate(new Date(selected.date.valueOf())));
        $('.dayFrom').datepicker('setEndDate', FromEndDate);
        $('.calculateYnEndDate').hide();
        $('.salesDataYnEndDate').hide();
    });


	// 세금계산서 문의 체크에 따른 날짜 입력폼 노출 여부 
	$("#taxYn").change(function(){
        if($("#taxYn").is(":checked")){
            $("#taxDate").show();
        }else{
        	$("#taxDate").hide();
        	$("#taxYnStartDate").val("");	// 입력값 삭제
        	$("#taxYnEndDate").val("");		// 입력값 삭제
        	$('.taxYnStartDate').hide();
        	$('.taxYnEndDate').hide();
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
        	$('.calculateYnStartDate').hide();
           
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
        	$('.salesDataYnStartDate').hide();
        }
    });
    
	
	inputEamil();	// 이메일 직접입력이나 선택입력에 따른 입력 처리 함수
	
	// 브랜드 직접입력 선택입력에 따른 입력폼 노출 여부
	$("#selectBrand").change(function() {
        //직접입력을 누를 때 나타남
		if($("#selectBrand").val() == "1") {
			$("#enterRcompanyName").show();
		}  else {
			$("#enterRcompanyName").hide();
		}
	}) 

	// 기타 문의 체크에 따른 입력폼 노출 여부
	$("#userMemoYn").change(function(){
        if($("#userMemoYn").is(":checked")){
            $("#userMemoView").show();
        }else{
        	$("#userMemoView").hide();
        	$("#userMemo").val(""); // 입력값 삭제
        	$(".current").text("0");
        	$(".userMemo").hide();
        }
    });
    
	// 소수점 입력 막기
	$("#couponNum").on("keydown", function(e){
	  /* e(지수), .(소수점) -(마이너스) 예외처리 */
		if(e.keyCode == 69 || e.keyCode == 190 || e.keyCode == 109){
			return false;              
		} 
	});
	
	
});
</script>
</head>
<body class="bg-gradient-primary">
 	<tiles:insertAttribute name="body"></tiles:insertAttribute>
	<tiles:insertAttribute name="modal"></tiles:insertAttribute>
</body>
	<tiles:insertAttribute name="footer"></tiles:insertAttribute>
</html>
