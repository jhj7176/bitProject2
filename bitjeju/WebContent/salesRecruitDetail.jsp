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

var recruitname ="${recruit.recruit_name}";//el
var recruitnum ="${recruit.recruit_num}";

$(function(){
	$('#recruitadd').on('click',function(){//*************모집공고 등록 서블릿으로, 모집공고 이름과 모집공고 번호전달.
		location.href='lmssalesrecruitfile.bit?recruit_name='+recruitname+'&recruit_num='+recruitnum;
	}); 

});//ready

</script>
<style type="text/css">
.lmscontent {
	width: 600px;
	display: block;
	margin: auto;
	border-bottom:1px solid #e4e4e4;
}
.lmscontent:last-child {
	margin-bottom:300px;
}
#lecturetable{
	border-collapse:collapse;
}
#lecturetable tr{
}
#lecturetable th{
	color:#1E3269;
	padding:30px;
	border-right:1px solid #e4e4e4;
	text-align:right;
}
#lecturetable td{
	padding:25px;
	text-align:left;
}
#recruitadd,#recruitedit,#recruitdelete,#recruitback{
	float:right;
    background-color: #000069;
    border:1px solid #000069;
    color:white;
    margin: 7px;
    width: 50px;
    height: 20px;
}

</style>
</head>
<body>
	<%@ include file="template/lmsheader.jspf"%>
	<%@ include file="template/menu.jspf"%>
	<div id="contents">
		<!--*****************lms메뉴******************-->
		<div class="grid2">
			<div id="lmsmenu">
				<p>영업</p>
				<ul>
					<li class="bigletter">모집공고</li>
					<li><a href="lmssalesrecruitlist.bit">강좌정보</a></li>
					<li class="bigletter">강좌배정</li>
					<li><a href="#">수강생정보</a></li>
<!-- 					<li><a href="lmsstafflecturelist.bit">강좌정보</a></li>
					<li class="bigletter">수강생관리</li>
					<li><a href="lmsstaffstudentlist.bit">수강생정보</a></li> -->
					<li></li>
				</ul>
			</div>
		</div>
		<!--*****************lms메뉴******************-->
		<div id="content" class="grid6">
			&nbsp;
			<!--*************content start****************-->
			<div class="lmscontent">
				<h2>강의관리</h2>
				<h4>강좌정보</h4>
<!-- 
private String lecture_name;
	private Date start_day, end_day;
	private int num, lecture_room,lecture_num;
	


 -->

					<c:set value="${lecture }" var="bean" />
				<table id="lecturetable">
					<tr>
						<th>강좌명</th>
						<td>${bean.lecture_name }</td>
					</tr>
					<tr>
						<th>강사명</th>
						<td>${bean.name }</td>
					</tr>
					<tr>
						<th>강의실</th>
						<td>${bean.lecture_room }</td>
					</tr>
					<tr>
						<th>개강일</th>
						<td>${bean.start_day }</td>
					</tr>
					<tr>
						<th>종강일</th>
						<td>${bean.end_day }</td>
					</tr>
					<tr>
						<th>모집공고</th><!-- recruit테이블에서 모집공고 정보 받아오기 -->
						<td><a href="lmssalesrecruitfiledetail.bit">머신러닝 딥러닝을 이용한 거북선 건조 전문가 양성 과정</a></td>
					</tr>
					<tr>
						<th>모집상태</th><!-- recruit테이블에서 모집공고 정보 받아오기 -->
						<td>모집중</td>
					</tr>
					<tr>
						<th></th>
						<td></td>
					</tr>
				</table>


			</div>
			<div class="lmscontent">
			<button id="recruitback" onclick="window.history.go(-1)">뒤로</button>			
			<button id="recruitdelete">삭제</button>			
			<button id="recruitadd">등록</button>			
			</div>
			<!--*************content end******************-->
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