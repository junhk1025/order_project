<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/inc/asset.jsp"></jsp:include>
<link rel="stylesheet" href="css/login.css">
<script src="js/global.js"></script>

<style>
.findbox {
	text-align :center;
}
input[type=button] {
    width: 281px;
    height: 53px;
    border: 1px solid black;
    border-radius: 25px;
    background-color: rgba(255,255,255, .5);
    color: black;
    margin-top:10px;
    }
    .phone {
    	opacity:
    }
    
#sel {
	width: 313px;
	padding: .8em .5em;
	background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	border: 1px solid #c2c2c2;
	border-radius: 6px;
	background-color: rgba(255,255,255, .7);
}
#box {
	height:600px;
	top:165px;
}

select::-ms-expand {
  /* for IE 11 */
  display: none;
}
/* .findbox > p {
	padding-bottom: 30px;
} */
</style>
</head>
<body>
	<jsp:include page="/inc/header.jsp"></jsp:include>
	<div id="content">
		<div id="box">
			<div id="joinbox" class="findbox">
				<p>직원 회원가입</p>
				<form action="/CDSInfo/registerok.do" method="POST">
					<input type="text" name="id" placeholder="아이디를 입력하세요." id="id"><br>
					<input type="password" name="pw" placeholder="비밀번호를 입력하세요." id="pwd"><br>
					<input type="text" name="name" placeholder="이름을 입력하세요." id="id"><br>
					<input type="text" name="phone" placeholder="휴대폰 번호를 입력하세요." class="phone"><br>
					<select name="sel" id="sel" class="form-control">
						<option value="2">발주담당자</option>
						<option value="3">매입담당자</option>
						<option value="4">거래처직원</option>
					</select>
					<div id="back"><a href="#" onclick="history.back();">돌아가기</a></div>
					<input type="submit" value="회원가입">
				</form>
					<!-- <input type="button" value="돌아가기" onclick="history.back();"> -->
			</div>
		</div>
	</div>
	<jsp:include page="/inc/footer.jsp"></jsp:include>
</body>
</html>
