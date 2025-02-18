 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
 * 
 * @author 이형준
 * @since  2022.05.24
 * @version  v.1.0
 * 		
 * 					작업이력 )
 * 						2022.05.24	-	담당자 : 이형준
 * 										내용   : view 제작
 						2022.05.27	-	담당자 : 이형준
 										내용   : ajax 성공
 *
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BeforePay</title>
<link rel="stylesheet" type="text/css" href="/deli/resources/css/user.css">
<link rel="stylesheet" type="text/css" href="/deli/resources/css/w3.css">
<script type="text/javascript" src="/deli/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/deli/resources/js/pay/pay.js?ver=7"></script>
<!-- jQuery -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
	
<script type="text/javascript">
$(document).ready(function(){
});
</script>
</head>
<body>
	<div class="mxw700 w3-content w3-center">
		<form method="POST" action="/deli/payment/afterPay.dlv" id="pageFrm" name="pageFrm">
			<input type="hidden" name="bno" id="bno" value="${PO.bno}">
			<input type="hidden" name="mname1" id="mname1" value="${PO.amname}">
			<input type="hidden" name="price1" id="price1" value="${PO.myprice}">
			<input type="hidden" id="tel" name="tel" value="${MPO.tel}">
			<input type="hidden" id="mail" name="mail" value="${MPO.mail}">
			<input type="hidden" id="name" name="name" value="${MPO.name}">
			<input type="hidden" id="myid" name="myid" value="${SID}">
			<input type="hidden" id="addr" name="addr" value="${MPO.addr}">
			<input type="hidden" id="mymno" name="mymno" value="${MPO.mno}">
			<input type="hidden" id="mymenu" name="mymenu" value="${PO.amname}">
			<input type="hidden" id="amount" name="amount" value="${PO.mtprice}">
			<input type="hidden" id="restno" name="restno" value="${PO.restno}">
			<input type="hidden" id="minPrice" name="minPrice" value="${PO.minprice}">
			<input type="hidden" id="Aprice" name="Aprice" value="${APRICE}">
			<input type="hidden" id="token" name="token" >
			<input type="hidden" id="imp_uid" name="imp_uid" >
			<input type="hidden" id="merchant_uid" name="merchant_uid" >
			<input type="hidden" id="paym" name="paym" >
		<h1 class="mgb10 w3-border pdAll10" style="margin-bottom: 5px;"><strong>Delivery Project</strong></h1>
		<div class="w3-col w3-light-grey">
			<div class="w3-col w3-border-bottom " align="left">
				<h4 class="w3-center w3-col mgl10">식당 이름 : <span id="rsname">${PO.rname}</span></h4><br><br>
			</div>
			<div class="w3-col w3-border-bottom " align="left">
				<h4 class="w3-left w3-col mgl10">배달 장소 : <span id="addr">${MPO.addr}</span></h4>
			</div>
			<div class="w3-col w3-border-bottom " align="left" >
				<h4 class="mgl10">${SID} 님이 선택하신 메뉴</h4>
				<h4 class="mgl10">${PO.amname} : ${PO.myprice}</h4>
				<h4 class="mgl10">요청 사항 : </h4>
				<input id="rq" name="rq" class="w3-col w3-border m11 mgl10">
				<h4 class="w3-col mgl10">가격 : <span >${PO.myprice}</span></h4>
			</div>
<c:forEach var="data" items="${MENU}" varStatus="status"  >
<c:set var="memb" value="${MEMBER[status.index]}" />
<c:if test="${SID ne memb.aid && memb.aid != null}">
			<div class="w3-col w3-border-bottom" align="left" >
				<h4 class="mgl10">${memb.aid} 님이 선택하신 메뉴</h4>
				<h4 class="mgl10"><span id="abcdef">${data.mname} : </span><span>${data.mprice}</span><span></span></h4>
				<h4 class="mgl10">가격 : <span>${data.mprice}</span></h4>
			</div>
</c:if> 
</c:forEach>
			<div class="w3-col w3-border-bottom" align="left" >
			<h4 class="mgl10">${SID} 님 금 액 : <span>${PO.myprice}</span></h4><br>
<c:forEach var="data" items="${MENU}" varStatus="status"  >
<c:set var="memb" value="${MEMBER[status.index]}" />
<c:if test="${SID ne memb.aid && memb.aid != null}">
				<h4 class="mgl10">${memb.aid} 님 금 액 : <span>${data.mprice}</span></h4><br>
</c:if>
</c:forEach>
			</div>
			<div class="w3-col w3-border-bottom" align="left" >	
				<h4 class="mgl10">최소주문 금액 : ${PO.minprice}</h4>
			</div>
			<div class="w3-col w3-border-bottom" align="left" >	
				<h4 class="mgl10">${SID}님이 지불하실 배달비  : <span>${DLP}</span></h4>
				<h4 class="mgl10">${SID}님이 지불하실 금액  : <span>${PO.mtprice}</span></h4>
			</div>
		</div>
		</form>
		<div class="w3-col w3-margin-top w3-card-4 w3-center" >
		<c:if test="${PO.minprice+0 <= APRICE+0}">
			<div class="w3-half w3-button w3-green" id="pbtn">결제</div>
			<div class="w3-half w3-button w3-deep-orange" id="cbtn">취소</div>
		</c:if>
		<c:if test="${PO.minprice+0 > APRICE+0}">
			<div class="w3-col" id="backbtn">최소주문금액에 도달하지 못했습니다.</div>
			<div class="w3-half w3-button w3-green" id="pbtn">결제</div>
			<div class="w3-half w3-button w3-deep-orange" id="cbtn">취소</div>
		</c:if>
		</div>
		</div>
		
<div class="w3-container" >
	<div id="id01" class="w3-modal">
	  <div class="w3-modal-content">
	    <header class="w3-container w3-teal"> 
	      <span onclick="document.getElementById('id01').style.display='none'" 
	      class="w3-button w3-display-topright">&times;</span>
	      <h2>Delivery Project</h2>
	    </header>
	    <div class="w3-container" id="id02">
	    </div>
	  </div>
	</div>
</div>
</body>
</html>