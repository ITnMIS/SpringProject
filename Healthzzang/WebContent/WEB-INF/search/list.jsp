<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>검색</title>
<link href="<%=request.getContextPath()%>/css/board.css"
	rel="stylesheet" type="text/css" />
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

<!-- mypage JavaScript -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/js/init.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-1.10.2.js"></script>
</head>

<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-1.7.1.js"></script>
<script type="text/javascript">
	function errCodeCheck() {
		var errCode = $
		{
			errCode
		}
		;
		if (errCode != null || errCode != "") {
			switch (errCode) {
			case 1:
				alert("검색된 데이터가 없습니다.");
				alert("ex)서울시 강서구.");
				break;
			}
		}
	}
</script>
</head>
<body onload="errCodeCheck()">
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
					<li class="link"><a class="side-menu" href="#">기본 정보</a></li>
					<li class="link"><a class="side-menu" href="#">나의 헬스장</a></li>
					<li class="link"><a class="side-menu" href="#">찜한 헬스장</a></li>
					<li class="link"><a class="side-menu"
						href="<%=request.getContextPath()%>/logout.do">Logout</a></li>
					<li class="link"><a class="side-menu"
						href="<%=request.getContextPath()%>/member/Hchange.do">비밀번호수정</a></li>
					<li class="link"><a class="side-menu" href="#">Menu opt3</a></li>
				</ul>
			</div>
			</mypage>
			<div id="wrap">
				<form action="list.do" method="post" autocomplete="on">
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
								<li><a
									href="<%=request.getContextPath()%>/Location/seoul.do">서울</a></li>
								<li><a
									href="<%=request.getContextPath()%>/Location/gyeonggi.do">경기</a></li>
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

	</div>
	<!-- /.container --> </nav>
	<!-- navi end -->
	<div class="loginheader">
		<h3 style="text-align: center"><%=request.getParameter("search")%>
			검색 결과
		</h3>
	</div>
	<jsp:include page="GymSearch.jsp"></jsp:include>
	<jsp:include page="CeventSearch.jsp"></jsp:include>
	<jsp:include page="ChealthzSearch.jsp"></jsp:include>
	<jsp:include page="CFreeSearch.jsp"></jsp:include>
	<jsp:include page="CideaSearch.jsp"></jsp:include>



</body>
</html>