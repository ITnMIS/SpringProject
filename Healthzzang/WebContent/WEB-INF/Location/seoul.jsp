<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
		<title>서울시 헬스장</title>
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<meta name="author" content="Codrops" />
 <!-- CSS -->

    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/component.css" />
    <link href='http://fonts.googleapis.com/css?family=Lato:300,400,700,900' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,300' rel='stylesheet' type='text/css'>

    <!-- login & register -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/login&register.css" />
    <!-- core CSS -->
    <link href="<%=request.getContextPath()%>/css/HealthZzangHome.css" rel="stylesheet">

    <!-- mypage icon-->
    <link href="http://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">
    <!-- mypage-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/seoul.css" />
		   <!-- mypage JavaScript -->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/init.js"></script>
    <script src="<%=request.getContextPath()%>/js/jquery-1.10.2.js"></script>
	<script src="<%=request.getContextPath()%>/js/custom.js"></script>
	<script type="text/javascript">
	function myFunc(){
		alert("죄송합니다 서비스 준비 중입니다..");
	}
	</script>
	</head>
	<body>
   <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
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
                        <input id="search" name="search" type="text" placeholder="What do you want?!">
                        <input id="search_submit" value="Rechercher" type="submit">
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
                        <li><a href="<%=request.getContextPath()%>/chealthz/list.do">나는헬스짱이다</a></li>
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
                    <div class="morph-button morph-button-modal morph-button-modal-2 morph-button-fixed">
                      <a href="<%=request.getContextPath()%>/login.do"> <img class="login" src="<%=request.getContextPath()%>/img/login.png"></img>
                        </a> 
                    </div><!-- morph-button -->
                    <strong class="joiner">|</strong>
                    <div class="morph-button morph-button-modal morph-button-modal-3 morph-button-fixed">
                     <a href="<%=request.getContextPath()%>/member/join.do"><img class="register" src="<%=request.getContextPath()%>/img/register.png" ></img>
                      </a>
                    </div><!-- morph-button -->
            </div>
            </c:when>
            </c:choose>
            <!-- login & register -->
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <div class="seoulheader">
    </div>

    <div class="TopBox">
        <div class="box-group">
                    <div class="box-group-title">서울동부1</div>
                    <a href="gangbook.do" class="box-group-item">강북구</a>
                    <a href="#" class="box-group-item-none">광진구</a>
                    <a href="#" class="box-group-item-none">노원구</a>
                    <a href="#" class="box-group-item-none">도봉구</a>

        </div>
         <div class="box-group">
                    <div class="box-group-title">서울동부2</div>
                    <a href="#" class="box-group-item-none">동대문구</a>
                    <a href="#" class="box-group-item-none">성동구</a>
                    <a href="#" class="box-group-item-none">성복구</a>
                    <a href="#" class="box-group-item-none">중랑구</a>
         </div>
        <div class="box-group">
                    <div class="box-group-title">서울동남</div>
                    <a href="#" class="box-group-item-none">강동구</a>
                    <a href="#" class="box-group-item-none">강남구</a>
                    <a href="#" class="box-group-item-none">서초구</a>
                    <a href="#" class="box-group-item-none">송파구</a>
        </div>
        <div class="box-group">
                    <div class="box-group-title">서울서북1</div>
                    <a href="#" class="box-group-item-none">마포구</a>
                    <a href="#" class="box-group-item-none">서대문구</a>
                    <a href="#" class="box-group-item-none">용산구</a>
                    <a href="#" class="box-group-item-none">은평구</a>
        </div>
        <div class="box-group">
                    <div class="box-group-title">서울서북2</div>
                    <a href="#" class="box-group-item-none">종로구</a>
                    <a href="#" class="box-group-item-none">종구</a>
        </div> 
        <div class="box-group">
                    <div class="box-group-title">서울서남1</div>
                    <a href="#" class="box-group-item-none">강서구</a>
                    <a href="#" class="box-group-item-none">구로구</a>
                    <a href="#" class="box-group-item-none">관악구</a>
                    <a href="#" class="box-group-item-none">금천구</a>
        </div>
		<div class="box-group">
                    <div class="box-group-title">서울서남2</div> 
                    <a href="#" class="box-group-item-none">동작구</a>
                    <a href="#" class="box-group-item-none">양천구</a>
                    <a href="#" class="box-group-item-none">영등포구</a>
        </div>
    </div>
	<div class="line">
		<p>
			<h4>
				서울시 Best 헬스장 
			</h4>
		</p>
		<div class="seoulcontainer">
			<ul class="grid cs-style-4">
				<li>
					<figure>
						<div><img src="<%=request.getContextPath()%>/img/Gym/1.png" alt="img01"></div>
						<figcaption>
							<h3>지단 헬스장</h3>
							<span>근육이 찢어지는 소리가 들리는 그날까지. 멘탈 고정해주는 친절한 헬스장</span>
							<a href="<%=request.getContextPath()%>/Hbasic/Hbasic.do?gseq=7">Take a look</a>
						</figcaption>
					</figure>
				</li>
				<li>
					<figure>
						<div><img src="<%=request.getContextPath()%>/img/Gym/2.png" alt="img02"></div>
						<figcaption>
							<h3>펠레 헬스장</h3>
							<span>몸짱이 될 확률과 적중률을 완벽하게 계산해주는 몸짱 트레이너 펠레가 있는!강북구 명소</span>
							<a href="<%=request.getContextPath()%>/Hbasic/Hbasic.do?gseq=9">Take a look</a>
						</figcaption>
					</figure>
				</li>
			</ul>
		</div>
	</div>

	</body>
</html>