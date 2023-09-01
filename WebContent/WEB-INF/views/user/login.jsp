<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/inc/asset.jsp" %>
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
</style>
</head>
<body>
	<jsp:include page="/inc/header.jsp"></jsp:include>
	<div id="content">
		<div id="box">
			<div id="loginbox" class="findbox">
				<p>CDS 직원 로그인</p>
				<form action="loginok.do" method="post">
					<input type="text" placeholder="아이디를 입력하세요." id="id" name="id"><br>
					<input type="password" placeholder="비밀번호를 입력하세요." id="pwd" name="pwd"><br>
					<input class="inp-cbx" id="cbx" type="checkbox" style="display: none;">
					<label class="cbx" for="cbx">
						<span>
							<svg width="8px" height="6px" viewbox="0 0 12 10">
								<polyline points="1.5 6 4.5 9 10.5 1"></polyline>
							</svg>
						</span>
						<span>아이디 저장</span>
					</label>
					<span id="signup"><a href="/CDSInfo/register.do">회원가입</a></span>
					<input type="submit" value="로그인">
				</form>
				<div id="find">
					<a href="/CDSInfo/findid.do">아이디 찾기</a>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="/CDSInfo/findpw.do">비밀번호 찾기</a>
				</div>
				<!-- <input type="button" value="직원 회원가입" onClick="location.href='/CDSInfo/register.do'"> -->
			</div>
		</div>
	</div>
	<jsp:include page="/inc/footer.jsp"></jsp:include>
	
	<script>
	var key = getCookie("key");
    $("#id").val(key); 
     
    if($("#id").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
        $("#cbx").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
    }
     
    $("#cbx").change(function(){ // 체크박스에 변화가 있다면,
        if($("#cbx").is(":checked")){ // ID 저장하기 체크했을 때,
            setCookie("key", $("#id").val(), 7); // 7일 동안 쿠키 보관
        }else{ // ID 저장하기 체크 해제 시,
            deleteCookie("key");
        }
    });
     
    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
    $("#id").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
        if($("#cbx").is(":checked")){ // ID 저장하기를 체크한 상태라면,
            setCookie("key", $("#id").val(), 7); // 7일 동안 쿠키 보관
        }
    });

 
function setCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}
 
function deleteCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
 
function getCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}
	
	</script>
</body>
</html>