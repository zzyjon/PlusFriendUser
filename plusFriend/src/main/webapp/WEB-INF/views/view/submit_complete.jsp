<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
	<!-- Outer Row -->
    <div class="row justify-content-center" style="height: 861px;">
		<div class="col-xl-10 col-lg-12 col-md-9">
			<div class="card o-hidden border-0 shadow-lg my-5">
				<div class="card-body p-0">
            		<!-- Nested Row within Card Body -->
            		<div class="row">
              			<div class="col-lg-12">
                			<div class="p-5">
                  				<div class="text-center">
                    				<h1 class="h4 text-gray-900 mb-4">문의가 등록됐습니다.</h1>
                    				<span class="h6 text-gray-900 mb-4">담당자 확인 후 연락드리겠습니다.</span>
                  				</div>
                  				<div class="text-center">
                  					<p class="text-gray-900"><small>추가 문의 등록을 원하실 경우<br> 아래 버튼을 선택해주세요.</small></p>
                  				</div>
                    			<a href='<c:url value="/calculate"></c:url>' class="btn btn-secondary btn-user btn-block">정산 문의</a>
                    			<a href='<c:url value="/coupon"></c:url>' class="btn btn-secondary btn-user btn-block">쿠폰 문의</a>
                    			<a href='<c:url value="/site"></c:url>' class="btn btn-secondary btn-user btn-block">쿠폰인증사이트 문의</a>
                  				<hr>
                			</div>
              			</div>
            		</div>
          		</div>
        	</div>
      	</div>
    </div>
</div>