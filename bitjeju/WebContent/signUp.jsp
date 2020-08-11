<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/bitgrid.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="template/lmshead.jspf"%>
<title>Insert title here</title>

<script type="text/javascript">



function pwCheck(passwordVal){
		var chek_num = passwordVal.search(/[0-9]/g);
		var chek_eng = passwordVal.search(/[a-z]/g);
		if(chek_num<0 || chek_eng<0){
			return true;
		}else{
			return false;
		}	
}

$(function(){
	
$('#signup').submit(function(){ //등록버튼 눌렀을 때 이벤트.
	var emailVal = $("#signupemailid").val();//id창에 입력된 값
	var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	var memberInfo = 'emailid='+$('#signupemailid').val()+'&pw='+$('#signuppw').val();
	memberInfo += '&phone='+$('#phone').val()+'&name='+$('#name').val();
	console.log(memberInfo);
	/* 
		비밀번호는 영문 + 숫자 조합, 8~12자리 
	*/
	var passwordVal=$('#signuppw').val();//비밀번호
	
	
	if($('#signupemailid').val()=="" || $('#signuppw').val()==""||$('#name').val()=="" ||$('#phone').val()==""){
		alert("모든 정보를 입력해야 합니다.");
	
		return false;
	}else if(emailVal.match(regExp) == null){
		alert("아이디는 이메일 형식 입니다.");
		return false;
	
	}else if(pwCheck(passwordVal)){
		//비밀번호 검증 하기.	영문이나 숫자가 포함되어야함., 포함되어있으면 false 영어나숫자만 true
		alert('비밀번호는 영문 + 숫자 조합이어야 합니다.');
		return false;
	}else if(passwordVal.length<8 || passwordVal.length>12){
		//비밀번호 길이는 8자~12자까지. 
		alert('비밀번호는 8 ~ 12자리 입니다.');	
		return false;
	}else{
		
	
		
	}//else		
});//submit

$('#overlap').on('click',function(){ // 아이디 중복검사 버튼
	var chk_id=$('#signupemailid').val()
	
	 $.ajax('lmsteacherattupdate.bit',{
		'method':'post',
		'data':'num='+pnum+'&nalja='+pnalja,
		'success':function(){
			/* location.href="lmsteacherattupdate.bit?num="+pnum+"&nalja="+pnalja; */
			var date= pnalja;
			//var url ="lmsteacherattupdate.bit?num="+pnum+"&nalja="+pnalja;	
			var title="new window";
			var option = "width=600,height=400,top=200,left=400, toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no";
			window.open("lmsteacherattupdate.bit?num="+pnum+"&nalja="+pnalja,title,option);
			
			/* popup(pnum,pnalja); */				  
			 console.log('성공');
		} 		

	})//ajax
	
	
});//click

var pnalja = $(this).text();//누른 날짜.
var pnum = $(this).prev().text();

$(this).on('click',function(){
	
		return false;
});//click

});//ready
</script>

<style type="text/css">
.lmscontent {
	width: 600px;
	display: block;
	margin: auto;
	border-bottom:1px solid #e4e4e4;
}

#signup{
	margin-bottom:400px;
}
#signuptable{
	border-collapse:collapse;
}
#signuptable tr{
}
#signuptable th{
	color:#1E3269;
	padding:30px;
	border-right:1px solid #e4e4e4;
	text-align:right;
}
#signuptable td{
	padding:25px;
	text-align:left;
}

#signupemailid,#deptselect,#name,#phone,#signuppw{
    width: 330px;
    height: 43px;
    margin: 7px;
    border-radius: 5px;
    border: 1px solid #969696;
    font-size:120%;
    text-align:center;
}

#signupbtn,#signupreset,#signupback{/* 버튼 */
	float:right;
    background-color: #000069;
    border:1px solid #000069;
    color:white;
    margin: 7px;
    width: 50px;
    height: 20px;
}
#overlap{
	float:right;
    background-color: #000069;
    border:1px solid #000069;
    color:white;
    margin-top : 9px;
    width: 60px;
    height: 43px;
    border-radius:5px;

}
#header .grid3{
	margin-top:40px;
	position:relative;
	
}

</style>
</head>
<body>
	<%@ include file="template/header.jspf"%>
	<%@ include file="template/menu.jspf"%>
	<div id="contents">
		<!--*****************lms메뉴******************-->
		<div class="grid2">
			<div id="lmsmenu">
				<p>비트캠프</p>
				<ul>
					<li class="bigletter">환영합니다♡</li>

					<li></li>
				</ul>
			</div>
		</div>
		<!--*****************lms메뉴******************-->
		<div id="content" class="grid6">
			&nbsp;
			
			<form action="signup.bit" method="post" id="signup">
			<!--*************content start****************-->
			<div class="lmscontent">
				<h2>회원가입</h2>
				<h4>정보를 입력해주세요</h4>
<!-- 
--회원테이블
	num number primary key, 				--회원번호
	id_email varchar2(50) unique not null,  --이메일을 아이디로씀
	name varchar2(15),						--회원이름
	dept varchar2(20) default '일반회원',		
	lvl number(1) default 1,				--등급
	password varchar2(15) not null, 		--비밀번호 영문+숫자조합
	phone number,							--전화번호
	lecture varchar2(30),					--강좌명 
 -->


				<table id="signuptable">
					<tr>
						<th>이메일</th>
						<td><input type="email" id="signupemailid" name="emailid" placeholder="이메일을 입력하세요."/>
						<button type="button" id="overlap">중복</button>
						
						</td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input type="text" id="name" name="name" placeholder="이름을 입력하세요."/></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" id="signuppw" name="pw" placeholder="영문+숫자조합 8~12자리 입니다."/></td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td><input type="tel" name="phone" id="phone" placeholder="'-' 없이 입력해주세요."/></td>
					</tr>
					<tr>
						<th></th>
						<td></td>
					</tr>
				</table>
				
			</div>
			<div class="lmscontent">
			<button id="signupback" type="button" onclick="window.history.go(-1)">뒤로</button>			
			<button id="signupreset" type="reset">리셋</button>			
			<button id="signupbtn" type="submit">등록</button>			
			</div>
			<!--*************content end******************-->
			</form>
			<%@ include file="template/footer.jspf"%>
</body>
</html>
<!-- 
-1번라인의 charset, pageEncoding 5번라인의 charset모두 utf-8로 맞춰주세요.
-2번의 doctype도 다지우고 위처럼 html만 남겨주세요.
-content내부에 content와 sidebar로 나눔 ->content에 작업하면됩니다.
-sidebar에서 사용하고 있는 id: #signin #emailid #pw #login #createccount #gotolms #campus #campusinfo #classinfo #open
-footer에서 사용하고있는 id: #footercon
위의 아이디들은 작업시 사용하지 마세요 이름바꾸고 싶으면 저와 의논바람
 -->