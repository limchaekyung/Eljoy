<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- jQuery -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<!-- iamport.payment.js -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
	<p>결제 모듈</p>
	<button id="check_module" type="button">결제 모듈 테스트</button>
	<script>
	$("#check_module").click(function () {
	//가맹점 식별하기
	var IMP = window.IMP; 		// 생략가능
	IMP.init('imp49624008');	//가맹점 식별코드	
	
	//결제창 호출코드 추가하기
	IMP.request_pay({	//param
	pg: 'inicis', 
	pay_method: 'card',
	merchant_uid: 'merchant_' + new Date().getTime(),	//주문번호
	name: '주문명:결제테스트',
	amount: 1000,
	buyer_email: "gildong@gmail.com",
    buyer_name: "홍길동",
    buyer_tel: "010-4242-4242",
    buyer_addr: "서울특별시 강남구 신사동",
    buyer_postcode: "01181"
	}, function (rsp) {	//callback
	console.log(rsp);
	if (rsp.success) {	//결제 성공
	var msg = '결제가 완료되었습니다.';
	msg += '고유ID : ' + rsp.imp_uid;
	msg += '상점 거래ID : ' + rsp.merchant_uid;
	msg += '결제 금액 : ' + rsp.paid_amount;
	msg += '카드 승인번호 : ' + rsp.apply_num;
	} else {	//결제 실패
	var msg = '결제에 실패하였습니다.';
	msg += '에러내용 : ' + rsp.error_msg;
	}
	alert(msg);
	});
	});
</script>

</body>
</html>