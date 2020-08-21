<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/bitgrid.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="template/lmshead.jspf"%>


<title>BITCAMP JEJU: LMS행정-강좌정보</title>


<script type="text/javascript">

var lecturename ="${lecture.lecture_name}";//el
var lecturenum ="${lecture.lecture_num}";
var teacher ="${lecture.name}";

$(function(){
	console.log(lecturename, lecturenum);
	$('#lectureedit').on('click',function(){//*************수정 서블릿으로
		location.href='lmsstafflectureedit.bit?lecture_name='+lecturename+'&lecture_num='+lecturenum;
	});
	$('#lecturedelete').on('click',function(){//****************삭제 서블릿으로
		location.href='lmsstafflecturedelete.bit?lecture_name='+lecturename+'&lecture_num='+lecturenum;		
	});
	
	$('#starting').on('click',function(){	//멤버테이블 강사 lecture컬럼에 과목추가. 개강확정
		$.ajax('lmsteacherlecupdate.bit',{
			'method':'post',
			'data':'lecture='+lecturename+'&name='+teacher,
			'success':function(data){
				var result = $(data).find('result').text();
				if(result=='starting'){
					alert('개강확정되었습니다.');
				}else{
					alert('실패');
				}
			}//success
		});//ajax
	});//click
	$('#ending').on('click',function(){		//멤버테이블 강사 lecture컬럼에 과목제거. 종강확정.
		$.ajax('lmsteacherlecdelete.bit',{
			'method':'post',
			'data':'lecture='+lecturename+'&name='+teacher,
			'success':function(data){
				var result = $(data).find('result').text();
				if(result=='ending'){
					alert('종강확정되었습니다.');
				}else{
					alert('실패');
				}
			}//success
		});//ajax
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
.lmscontent:last-child {
	margin-bottom:300px;
}
#lecturetable{
	border-collapse:collapse;
	width:600px;
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
#lectureedit,#lecturedelete,#lectureback{
	float:right;
    background-color: #000069;
    border:1px solid #000069;
    color:white;
    margin: 7px;
    width: 50px;
    height: 20px;
}
#lectureedit:hover,#lecturedelete:hover,#lectureback:hover{
		background-color:white;
		color:#000069;
		cursor: pointer;
}
#starting,#ending{
    background-color: #000069;
    border:1px solid #000069;
    color:white;
    margin: 7px;
    width: 70px;
    height: 20px;
    line-height:20px;
    border-radius:5px;
}

#starting:hover,#ending:hover{
	background-color:white;
	color:#000069;
	cursor: pointer;
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
				<p>행정</p>
				<ul>
					<li class="bigletter">계정관리</li>
					<li><a href="lmsstaffaccountlist.bit">회원정보</a></li>
					<li class="bigletter">강의관리</li>
					<li><a href="lmsstafflectureadd.bit">강좌개설</a></li>
					<li><a href="lmsstafflecturelist.bit">강좌정보</a></li>
					<li class="bigletter">수강생관리</li>
					<li><a href="lmsstaffstudentlist.bit">수강생정보</a></li>
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
						<td>${bean.start_day }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button id="starting">개강확정</button></td>
					</tr>
					<tr>
						<th>종강일</th>
						<td>${bean.end_day }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button id="ending">종강확정</button></td>
					</tr>
					<tr>
						<th></th>
						<td></td>
					</tr>
				</table>


			</div>
			<div class="lmscontent">
			<button id="lectureback" onclick="window.history.go(-1)">뒤로</button>			
			<button id="lecturedelete">삭제</button>			
			<button id="lectureedit">수정</button>			
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