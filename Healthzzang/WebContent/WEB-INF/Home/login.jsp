<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
<link rel="stylesheet" type="text/css" href="css/login&register.css" />
<c:if test="${errCode == null}">
	<c:set var="errCode" value="\"\""></c:set>
</c:if>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"> 
  <!-- CSS -->

    <link rel="stylesheet" type="text/css" href="css/component.css" />
    <link href='http://fonts.googleapis.com/css?family=Lato:300,400,700,900' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,300' rel='stylesheet' type='text/css'>

    <!-- login & register -->
    <link rel="stylesheet" type="text/css" href="css/login&register.css" />
    <!-- core CSS -->
    <link href="css/HealthZzangHome.css" rel="stylesheet">

    <!-- mypage icon-->
     <link href="http://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">
    <!-- mypage-->
    <!-- mypage JavaScript -->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="js/init.js"></script>
    <script src="js/jquery-1.10.2.js"></script>
<script type="text/javascript">
	function checkErrCode(){
		var errCode = ${errCode};
		if(errCode != null || errCode != ""){
			switch (errCode) {
			case 1:
				alert("가입된 ID가 아닙니다!");
				break;
			case 2:
				alert("비밀번호가 일치하지 않습니다!");
			 	break;
			}
		}
	}
	function myFunc(){
		alert("죄송합니다 서비스 준비 중입니다..");
	}
	
</script>
</head>
<body onload="checkErrCode()">
<!-- navi-->
   <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button> 
                <a class="navbar-brand" href="home.do">
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
                    <form action="search/list.do" method="post" autocomplete="on">
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
                      <a href="<%=request.getContextPath()%>/login.do"> <img class="login" src="img/login.png"></img>
                        </a> 
                    </div><!-- morph-button -->
                    <strong class="joiner">|</strong>
                    <div class="morph-button morph-button-modal morph-button-modal-3 morph-button-fixed">
                     <a href="<%=request.getContextPath()%>/member/join.do"><img class="register" src="img/register.png" ></img>
                      </a>
                    </div><!-- morph-button -->
            </div>
            </c:when>
<%--             <c:otherwise>
            <h4> dfdf</h4>
            	<div class="mockup-content">
            		<div class="morph-button morph-button-modal morph-button-modal-2 morph-button-fixed">
            			 <button type="button" value="로그아웃"></button>
            		</div>
            	</div>
            </c:otherwise> --%>
            </c:choose>
            <!-- login & register -->
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
<!-- navi-->
<div class="loginheader"></div>
 <div class="wrapper">
        <div>
           <div class="content-style-form content-style-form-1">
                  <h1>Login  </h1>
                  <h2>for Your Health!</h2><br>
                   <spring:hasBindErrors name="LoginModel" />
				   <form:errors path="LoginModel" />
                   <form action="login.do" method="post"charset='UTF-8'>
                       <p><input type="text" name="id" placeholder="ID를 입력하세요" value='' maxlength="50" size="30"/>
                       </p><br><center><span class="error"><form:errors path="LoginModel.id" /></span></center>
                       <br>
                       <p><input type='password' name='pw' id='pw' maxlength="50" size="30" placeholder="Password" /></p>
                       <br><center><span class="error"><form:errors path="LoginModel.pw" /></span></center></br>
                       <p><input type='submit' name='Submit' value='Login' /></p>
                         <br><br>
                       <center><a href="<%=request.getContextPath()%>/home.do">홈페이지 이동</a></center>
                       
                       <div id="bottom">
                      	    <br>
                        	<a class="right_a" href="#">비번까먹으심?</a>
                       </div>
                    </form>
            </div>
         </div>
 </div>
</body>
</html>