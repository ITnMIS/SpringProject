<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<title>헬스장 소개</title>

<!-- Bootstrap core CSS -->

<!-- login & register -->
<!-- core CSS -->
<link href="<%=request.getContextPath()%>/css/HealthZzangHome.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/intro_health.css"
	rel="stylesheet">

    <!-- border -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/board.css" />
<!-- Custom CSS for the '3 Col Portfolio' Template -->
<link href="<%=request.getContextPath()%>/css/portfolio-item.css"
	rel="stylesheet">
<!-- jQuery -->
<script src="<%=request.getContextPath()%>/js/jquery-1.10.2.js"></script>
<!-- FlexSlider -->
<script defer
	src="<%=request.getContextPath()%>/js/jquery.flexslider.js"></script>

<script type="text/javascript">
	$(function() {
		SyntaxHighlighter.all();
	});
	$(window).load(function() {
		$('.flexslider').flexslider({
			animation : "slide",
			controlNav : "thumbnails",
			start : function(slider) {
				$('Hslider').removeClass('loading');
			}
		});
	});

	function showTabMenu(n) {
		var conId;
		for (i = 1; i < 7; i++) {
			conId = document.getElementById("con" + i);
			if (i == n) {
				conId.style.display = "";
			} else {
				conId.style.display = "none";
			}
		}
	}
	function myFunc(){
			alert("죄송합니다 서비스 준비 중입니다..");
	}

</script>
</head>

<body>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" type="text/css" href="css/component.css" />
<link href='http://fonts.googleapis.com/css?family=Lato:300,400,700,900'
	rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Roboto:400,300'
	rel='stylesheet' type='text/css'>
<title>당신의 건강, 젊음, 아름다움을 위해</title>

<!-- login & register -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/login&register.css" />
<!-- core CSS -->
<link href="<%=request.getContextPath()%>/css/HealthZzangHome.css"
	rel="stylesheet">

<!-- mypage icon-->
<link
	href="http://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css"
	rel="stylesheet">
<!-- mypage-->

<!-- Add custom CSS here -->
<link href="<%=request.getContextPath()%>/css/shop-homepage.css"
	rel="stylesheet">
<!-- mypage icon-->
<link
	href="http://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css"
	rel="stylesheet">
<!-- mypage-->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/seoul.css" />
<!-- mypage JavaScript -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/js/init.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-1.10.2.js"></script>
</head>

<body>
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-ex1-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="<%=request.getContextPath()%>/home.do">
				<img src="<%=request.getContextPath()%>/img/11.png"></img>
			</a>

			<!-- mypage-->
			<mypage>
			<div id="home" class="headercon">
				<a class="menu-icon" href="#"><i class="icon-reorder"></i></a>

				<ul class="side-menu">
 					 <h2 class="title">
                        <c:choose>
      				     	<c:when test="${id == null}">로그인해주세요.</c:when>
			           	<c:otherwise>
			           		${id}			           		
			           	</c:otherwise>
			           	</c:choose>
           			  </h2>
           			  <li class="link"><a class="side-menu" href="javascript:void(myFunc())">기본 정보</a></li>
                      <li class="link"><a class="side-menu" href="javascript:void(myFunc())">나의 헬스장</a></li>
                      <li class="link"><a class="side-menu" href="javascript:void(myFunc())">찜한 헬스장</a></li>
                      <li class="link"><a class="side-menu" href="<%=request.getContextPath()%>/logout.do">Logout</a></li>
                      <li class="link"><a class="side-menu" href="<%=request.getContextPath()%>/member/Hchange.do">비밀번호수정</a></li>
                 </ul>
			</div>
			</mypage>
			<div id="wrap">
				<form action="<%=request.getContextPath()%>/search/list.do" method="post" autocomplete="on">
					<input id="search" name="search" type="text"
						placeholder="What do you want?!"> <input
						id="search_submit" value="Rechercher" type="submit">
				</form>
			</div>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="gridcontainer clearfix">
			<div class="grid_3">
				<ul>
					<li>
						<div class="fmcircle_out findH">
							<a href="#web">
								<div class="fmcircle_in fmcircle_H">
									<img src="<%=request.getContextPath()%>/img/Qmark.png" alt="" />
								</div>
							</a>
							<ul>
								<li><a href="#">전체보기</a></li>
								<li><a href="<%=request.getContextPath()%>/Location/seoul.do">서울</a></li>
								<li><a href="<%=request.getContextPath()%>/Location/gyeonggi.do">경기</a></li>
							</ul>
						</div>
					</li>
				</ul>
			</div>
			<div class="grid_3">
				<ul>
					<li>
						<div class="fmcircle_out commH">
							<a href="#web">
								<div class="fmcircle_in fmcircle_H">
									<img src="<%=request.getContextPath()%>/img/comm.png" alt="" />
								</div>
							</a>
							<ul>
								<li><a href="<%=request.getContextPath()%>/cevent/list.do">이벤트</a></li>
								<li><a
									href="<%=request.getContextPath()%>/chealthz/list.do">나는헬스짱이다</a></li>
								<li><a href="<%=request.getContextPath()%>/cfree/list.do">와글와글</a></li>
								<li><a href="<%=request.getContextPath()%>/cidea/list.do">헬스지식인</a></li>
							</ul>
						</div>
					</li>
				</ul>
			</div>
		</div>
		<!-- gridcontainer end-->
		<!-- login & register -->
		<c:choose>
			<c:when test="${id == null}">
				<div class="mockup-content">
					<div
						class="morph-button morph-button-modal morph-button-modal-2 morph-button-fixed">
						<a href="<%=request.getContextPath()%>/login.do"> <img
							class="login" src="<%=request.getContextPath()%>/img/login.png"></img>
						</a>
					</div>
					<!-- morph-button -->
					<strong class="joiner">|</strong>
					<div
						class="morph-button morph-button-modal morph-button-modal-3 morph-button-fixed">
						<a href="<%=request.getContextPath()%>/member/join.do"><img
							class="register"
							src="<%=request.getContextPath()%>/img/register.png"></img> </a>
					</div>
					<!-- morph-button -->
				</div>
			</c:when>

		</c:choose>
		<!-- login & register -->
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container --> </nav>
	<!-- navi end -->
	<div class="loginheader"></div>
	<div class="container">
		<div class="row">
			<div class="col-md-2">
				<p class="lead">
					<a herf="#" class="list-group-item"> ${hbasic.name} </a>
				</p>
				<div class="list-group">
					<a class="list-group-item active">헬스장정보</a> <a
						href="javascript:showTabMenu(1)" class="list-group-item">-시설&소개
					</a> <a href="javascript:showTabMenu(2)" class="list-group-item">-공지사항
					</a> <a href="javascript:showTabMenu(3)" class="list-group-item">-시간&요금
					</a> <a href="javascript:showTabMenu(4)" class="list-group-item">-약도
					</a> <a href="javascript:showTabMenu(5)" class="list-group-item">-트레이너</a>
				</div>
				<div class="list-group">
					<a class="list-group-item active">게시판</a> <a
						href="javascript:showTabMenu(6)" class="list-group-item">-이용후기</a>
					<a href="javascript:showTabMenu(7)" class="list-group-item">-질문&답변</a>
				</div>
			</div>
			<!--  jstl test -->
			<div class="contents" id="con1">
				<div class="col-md-5">
					<div class="loading">
						<div id="main" role="main">
							<section class="slider">
							<div class="flexslider">
								<ul class="slides">
									<li data-thumb="<%=request.getContextPath()%>/img/1.png">
										<img src="<%=request.getContextPath()%>/img/1.png" />
									</li>
									<li data-thumb="<%=request.getContextPath()%>/img/2.png">
										<img src="<%=request.getContextPath()%>/img/2.png" />
									</li>
									<li data-thumb="<%=request.getContextPath()%>/img/3.jpg">
										<img src="<%=request.getContextPath()%>/img/3.jpg" />
									</li>
									<li data-thumb="<%=request.getContextPath()%>/img/4.jpg">
										<img src="<%=request.getContextPath()%>/img/4.jpg" />
									</li>
								</ul>
							</div>
							</section>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<h3>${hbasic.name}</h3>
					<p>${hbasic.intro}</p>
					<h3>연락처</h3>
					<ul>
						<li>${hbasic.phone}</li>
					</ul>
					<h3>위치</h3>
					<ul>
						<li>${hbasic.city}${hbasic.town}</li>
					</ul>
					<h3>규모</h3>
					<ul>
						<li>${hbasic.scale}</li>
					</ul>
				</div>
			</div>
			<div class="contents" id="con2" style="display: none">
				<div class="col-md-4">
					<h4>공지사항을 입력하세요</h4>
				</div>
			</div>
			<div class="contents" id="con3" style="display: none">
				<div class="col-md-4">
					<table border="0" class="boardTable">
					<thead>
						<tr>
							<th>기간</th>
							<th>요금</th>
							<th>추가요금</th>
						</tr>
					</thead>
					<tbody style="text-align: center">
						<c:forEach var="gymfee" items="${gymfeeList}">
							<tr>
								<td class="period">${gymfee.period}</td>
								<td class="fee">${gymfee.fee}</td>
								<td class="SubFee">${gymfee.subFee}</td>
							</tr>
						</c:forEach>
					</tbody>
					</table>
				</div>
			</div>
			<div class="contents" id="con4" style="display: none">
				<h3>지도</h3>
					<iframe
						src="http://dna.daum.net/include/tools/routemap/map_view.php?width=800&height=550&latitude=37.51804554027873&longitude=127.04732808813993&contents=&zoom=4"
						width="400" height="350" scrolling="no" frameborder="0"></iframe>
			</div>
			<div class="contents" id="con5" style="display: none; text-align: center">
				<div class="col-md-4">	
					<table border="0" class="boardTable">
					<thead>
						<tr>
							<th>이름</th>
							<th>사진</th>
							<th>수상경력</th>
							<th>트레이너의 한마디..</th>
						</tr>
					</thead>
					<tbody style="text-align: center">
						<c:forEach var="trainer" items="${trainerList}">
							<tr>
								<td class="name">${trainer.name}</td>
								<td class="img">${trainer.img}</td>
								<td class="SubFee">${trainer.career}</td>
								<td class="intro">${trainer.intro}</td>	
							</tr>
						</c:forEach>
					</tbody>
					</table>
				</div>
			</div>
			<div class="contents" id="con6" style="display: none">
				<div class="col-md-4">	
					준비중입니다...
					<%-- <c:import url="http://localhost:8787/project_ing/qna/list.do?gseq=${hbasic.GYM_Seq}"></c:import>  --%>
				</div>
			</div>

		</div>
	</div>
	<!-- /.container -->

	<div class="container">
		<footer>
		<div class="row">
			<div class="col-lg-12">
				<p>Copyright &copy; Company 2013 - Template by HealthZZang</p>
			</div>
		</div>
		</footer>
	</div>
	<!-- /.container -->


</body>
</html>