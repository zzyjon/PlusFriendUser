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
                    				<h1 class="h4 text-gray-900 mb-4">정산 문의</h1>
                  				</div>
                  				<div class="text-right">
                  					<small class="text-danger">*표기된 항목은 필수 입력 항목입니다.</small>
                  				</div>
                  				<form id="calForm"  class="form-horizontal" novalidate>
                  					<input type="hidden" name="customType" value="${customType}"/>
                  					<input type="hidden" name="userMemoYn" value=""/>
                  					<input type="hidden" name="taxYn" value=""/>
                  					<input type="hidden" name="depositYn" value=""/>
                  					<input type="hidden" name="calculateYn" value=""/>
                  					<input type="hidden" name="commissionYn" value=""/>
                  					<input type="hidden" name="salesDataYn" value=""/>
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
  											<input type="text" class="form-control" id="branchName" name="branchName"  maxlength="15" oninput="maxLengthCheck(this)" onkeyup="hideDiv(this)" onpaste="hideDiv(this)" required="required">
  										</div>
									</div>
									<label for="replyPhoneNo" class="control-label"><span class="text-danger mr-1">*</span>회신받을 연락처</label>
									<div class="replyPhoneNo" style="display: none;"><span class="text-danger mr-1"></span></div>
									<div class="form-group">
										<div class="col-xs-12 col-lg-12">
											<input type="text" class="form-control" id="replyPhoneNo" name="replyPhoneNo"  maxlength="11" oninput="maxLengthCheck(this)" onkeyup="hideDiv(this)" onpaste="hideDiv(this)" pattern="\d*" placeholder="'-'없이 숫자만 입력해주세요" required="required">
										</div>
									</div>
				                    <label for="replyEmail" class="control-label">이메일</label>
				                    <div class="replyEmail1 replyEmail2" style="display: none;"><span class="text-danger mr-1"></span></div>
				                    <div class="form-inline form-group">
										<div class="input-group col-xs-12 col-md-12 col-lg-5">
											<input type="text" id="replyEmail1" name="replyEmail1" class="form-control"  maxlength="20" oninput="maxLengthCheck(this)" onkeyup="hideDiv(this)" onpaste="hideDiv(this)" required="required">
										</div>
										<div class="input-group col-xs-12 col-md-8 col-lg-4">
								      		<div class="input-group-prepend">
								        		<span class="input-group-text" id="basic-addon1">@</span>
								      		</div>
										  	<input type="text" id="replyEmail2" name="replyEmail2" class="form-control" maxlength="15" oninput="maxLengthCheck(this)" onkeyup="hideDiv(this)" onpaste="hideDiv(this)" aria-describedby="basic-addon1">
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
                      					<label class="control-label"><span class="text-danger mr-1">*</span>문의내용</label>
                      					<div class="text-right"><small class="text-danger text-right">최소 1개 이상 문의를 선택해야합니다.</small></div>
                      					<div class="custom-control custom-checkbox small">
                      						<div class="col-xs-12 col-lg-12">
                        					<input type="checkbox" class="custom-control-input askCheck" id="taxYn" required="required">
                        					<label class="custom-control-label" for="taxYn">세금계산서 문의</label>
	                        				<div id="taxDate" class="form-group" style="display:none;">
								    			<div class="form-row" >
													<div class="col-md-6 mb-3">
									      				<label for="taxYnStartDate">조회 시작</label>
									      				<div class="taxYnStartDate text-danger h6" style="display: none;"><span class="text-danger mr-1"></span></div>
									      				<input type="text" class="form-control from" onfocus="blur()" onkeyup="hideDiv(this)" onmouseenter="hideDiv(this)" onpaste="hideDiv(this)" id="taxYnStartDate" name="taxYnStartDate" required="required">
									    			</div>
									    			<div class="col-md-6 mb-3">
										      			<label for="taxYnEndDate">조회 종료</label>
										      			<div class="taxYnEndDate text-danger h6" style="display: none;"><span class="text-danger mr-1"></span></div>
										      			<input type="text" class="form-control to" onfocus="blur()" onkeyup="hideDiv(this)" onmouseenter="hideDiv(this)" onpaste="hideDiv(this)" id="taxYnEndDate" name="taxYnEndDate" required="required">
										      		</div>
								    			</div>
											</div>
                      						</div>
										</div>
										<div class="custom-control custom-checkbox small">
											<div class="col-xs-12 col-lg-12">
												<input type="checkbox" class="custom-control-input askCheck" id="depositYn" required="required">
												<label class="custom-control-label" for="depositYn">입금일정 문의</label>
											</div>
										</div>
										<div class="custom-control custom-checkbox small">
											<div class="col-xs-12 col-lg-12">
												<input type="checkbox" class="custom-control-input askCheck" id="calculateYn" required="required">
												<label class="custom-control-label" for="calculateYn">정산금액 문의</label>
												<div id="calculateDate" class="form-group" style="display:none;">
												    <div class="form-row" >
														<div class="col-md-6 mb-3">
														    <label for="calculateYnStartDate">조회 시작</label>
														    <div class="calculateYnStartDate text-danger h6" style="display: none;"><span class="text-danger mr-1"></span></div>
														    <input type="text" class="form-control dayFrom" onfocus="blur()" onkeyup="hideDiv(this)"  onpaste="hideDiv(this)" id="calculateYnStartDate" name="calculateYnStartDate"  required="required">
													    </div>
													    <div class="col-md-6 mb-3">
													    	<label for="calculateYnEndDate">조회 종료</label>
													    	<div class="calculateYnEndDate text-danger h6" style="display: none;"><span class="text-danger mr-1"></span></div>
													    	<input type="text" class="form-control dayTo" onfocus="blur()" onkeyup="hideDiv(this)"  onpaste="hideDiv(this)" id="calculateYnEndDate" name="calculateYnEndDate" required="required">
													    </div>
												    </div>
												</div>
											</div>
										</div>
										<div class="custom-control custom-checkbox small">
											<div class="col-xs-12 col-lg-12">
												<input type="checkbox" class="custom-control-input askCheck" id="commissionYn"  required="required">
												<label class="custom-control-label" for="commissionYn">수수료 문의</label>
											</div>
										</div>
										<div class="custom-control custom-checkbox small">
											<div class="col-xs-12 col-lg-12">
												<input type="checkbox" class="custom-control-input askCheck" id="salesDataYn" required="required">
												<label class="custom-control-label" for="salesDataYn">매출자료 문의</label>
												<div id="salesDataDate" class="form-group" style="display:none;">
											    	<div class="form-row" >
														<div class="col-md-6 mb-3">
												      		<label for="salesDataYnStartDate">조회 시작</label>
												      		<div class="salesDataYnStartDate text-danger h6" style="display: none;"><span class="text-danger mr-1"></span></div>
												      		<input type="text" class="form-control dayFrom" onfocus="blur()" onkeyup="hideDiv(this)" onmouseenter="hideDiv(this)" onpaste="hideDiv(this)" id="salesDataYnStartDate"  name="salesDataYnStartDate"   required>
												    	</div>
												    	<div class="col-md-6 mb-3">
												    		<label for="salesDataYnEndDate">조회 종료</label>
												    		<div class="salesDataYnEndDate text-danger h6" style="display: none;"><span class="text-danger mr-1"></span></div>
												      		<input type="text" class="form-control dayTo" onfocus="blur()" onkeyup="hideDiv(this)" onmouseenter="hideDiv(this)" onpaste="hideDiv(this)" id="salesDataYnEndDate" name="salesDataYnEndDate" required>
												    	</div>
											    	</div>
												</div>
											</div>
										</div>
										<div class="custom-control custom-checkbox small">
											<div class="col-xs-12 col-lg-12">
												<input type="checkbox" class="custom-control-input askCheck" id="userMemoYn" required="required">
												<label class="custom-control-label" for="userMemoYn">기타 문의</label>
												<div class="userMemo text-danger h6" style="display: none;"><span class="text-danger mr-1"></span></div>
												<div id="userMemoView" class="form-group" style="display:none;">
											    	<div class="form-row" >
														<div class="col-md-12 mb-3">
												      		<textarea class="form-control" id="userMemo" name="userMemo" onkeyup="limitText(this, 1000, '.current', '.total');" onkeydown="hideDiv(this)" onpaste="hideDiv(this)" ></textarea>
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
                    				<button id="submitBtn" class="btn btn-primary btn-user btn-block" type="button" onClick="doFormsubmit('${customType}')">접수</button>
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