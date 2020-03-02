<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <div class="container">
    <!-- Outer Row -->
    <div class="row justify-content-center">
      <div class="col-xl-10 col-lg-12 col-md-9">
        <div class="card o-hidden border-0 shadow-lg my-5">
          <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
              <div class="col-lg-12">
                <div class="p-5">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">쿠폰인증 사이트 문의</h1>
                  </div>
                  <div class="text-right">
				  	<small class="text-danger">*표기된 항목은 필수 입력 항목입니다.</small>
   				  </div>
                  <form id="siteForm" class="user form-horizontal">
                  	<input type="hidden" name="customType" value="${customType}"/>
   					<input type="hidden" name="userMemoYn" value=""/>
   					<input type="hidden" name="findIdpwdYn" value=""/>
   					<input type="hidden" name="manualYn" value=""/>
                  	<input type="hidden" id="replyEmail" name="replyEmail">
                    <label for="rcompanyName" class="control-label"><span class="text-danger mr-1">*</span>브랜드명</label>
                    <div class="rcompanyName text-danger h6" style="display: none;"><span class="text-danger mr-1"></span></div>
     				<div class="form-group">
     					<div class="col-xs-12 col-lg-12">
       					<input type="text" id="rcompanyName" name="rcompanyName" class="form-control" maxlength="10" oninput="maxLengthCheck(this)" onchange="hideDiv(this)" onkeyup="hideDiv(this)" onpaste="hideDiv(this)">
       					</div>
     				</div>
					<label for="branchName" class="control-label"><span class="text-danger mr-1">*</span>지점명</label>	
					<div class="branchName text-danger h6" style="display: none;"><span class="text-danger mr-1"></span></div>
					<div class="form-group">
						<div class="col-xs-12 col-lg-12">
							<input type="text" class="form-control" id="branchName" name="branchName"  maxlength="15" oninput="maxLengthCheck(this)" onchange="hideDiv(this)" onkeyup="hideDiv(this)" onpaste="hideDiv(this)" required="required">
						</div>
					</div>
					<label for="replyPhoneNo" class="control-label"><span class="text-danger mr-1">*</span>회신받을 연락처</label>
					<div class="replyPhoneNo" style="display: none;"><span class="text-danger mr-1"></span></div>
					<div class="form-group">
						<div class="col-xs-12 col-lg-12">
							<input type="text" class="form-control" id="replyPhoneNo" name="replyPhoneNo"  maxlength="11" oninput="maxLengthCheck(this)" onchange="hideDiv(this)" onkeyup="hideDiv(this)" onpaste="hideDiv(this)" pattern="\d*" placeholder="'-'없이 숫자만 입력해주세요" required="required">
						</div>
					</div>
                    <label for="replyEmail" class="control-label">이메일</label>
                    <div class="replyEmail1 replyEmail2" style="display: none;"><span class="text-danger mr-1"></span></div>
                    <div class="form-inline form-group">
						<div class="input-group col-xs-12 col-md-12 col-lg-5">
							<input type="text" id="replyEmail1" name="replyEmail1" class="form-control"  maxlength="20" oninput="maxLengthCheck(this)" onchange="hideDiv(this)" onkeyup="hideDiv(this)" onpaste="hideDiv(this)"required="required">
						</div>
						<div class="input-group col-xs-12 col-md-8 col-lg-4">
				      		<div class="input-group-prepend">
				        		<span class="input-group-text" id="basic-addon1">@</span>
				      		</div>
						  	<input type="text" id="replyEmail2" name="replyEmail2" class="form-control" maxlength="15" oninput="maxLengthCheck(this)" onchange="hideDiv(this)" onkeyup="hideDiv(this)" onpaste="hideDiv(this)" aria-describedby="basic-addon1">
					    </div>
					  	<div class="input-group col-xs-12 col-md-4 col-lg-3">
					  		<select id="selectEmail" class="form-control" > 
	        					<option value="1">직접입력</option> 
					        	<option value="naver.com">naver.com</option> 
					        	<option value="gmail.com">gmail.com</option> 
					        	<option value="daum.net">daum.net</option> 
					        	<option value="nate.com">nate.com</option> 
	           				</select>
					  	</div>
                    </div>
                    <div class="form-group">
                      <label for="replyEmail" class="control-label"><span class="text-danger mr-1">*</span>문의내용</label>
                      <div class="text-right"><small class="text-danger text-right">최소 1개 이상 문의를 선택해야합니다.</small></div>
                      <div class="custom-control custom-checkbox small">
                      	<div class="col-xs-12 col-lg-12">
	                       <input type="checkbox" class="custom-control-input askCheck" id="findIdpwdYn">
	                       <label class="custom-control-label" for="findIdpwdYn">아이디 및 비밀번호 문의</label>
                        </div>
                      </div>
                      <div class="custom-control custom-checkbox small">
                      	<div class="col-xs-12 col-lg-12">
	                        <input type="checkbox" class="custom-control-input askCheck" id="manualYn">
	                        <label class="custom-control-label" for="manualYn">사용방법 문의</label>
                        </div>
                      </div>
                      <div class="custom-control custom-checkbox small">
                      	<div class="col-xs-12 col-lg-12">
						<input type="checkbox" class="custom-control-input askCheck" id="userMemoYn">
						<label class="custom-control-label" for="userMemoYn">기타 문의</label>
						<div class="userMemo text-danger h6" style="display: none;"><span class="text-danger mr-1"></span></div>
						<div id="userMemoView" class="form-group" style="display:none;">
					    	<div class="form-row" >
								<div class="col-md-12 mb-3">
						      		<textarea class="form-control" id="userMemo"  name="userMemo" onkeyup="limitText(this, 1000, '.current', '.total');" onkeydown="hideDiv(this)" onpaste="hideDiv(this)" ></textarea>
						    	</div>
						    	<div class="col-md-12 mb-3 reply-limit">
						      		<em class="current">0</em> / <em class="total">1000</em>
						    	</div>
					    	</div>
						</div>
						</div>
					   </div>
                    </div>
                    <hr>
                    <div class="custom-control custom-checkbox small">
						<div class="col-xs-12 col-lg-12">
							<input type="checkbox" class="custom-control-input" id="infoAllow" required="required">
							<label class="custom-control-label" for="infoAllow">개인정보활용동의</label>
	  						<a id="modaltest" href="#" class="badge badge-secondary" onClick="event.preventDefault()" data-toggle="modal" data-target="#infoAllowModal">전문보기</a>
						</div>
					</div>
                    <button class="btn btn-primary btn-user btn-block" type="button" onClick="doSubmitSite()">접수</button>
                  </form>
                  <hr>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>