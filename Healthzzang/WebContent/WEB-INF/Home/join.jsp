<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>enjoin your Health, Youth, Beauty</title>
<!-- css -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/login&register.css" />

    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/component.css" />
    <link href='http://fonts.googleapis.com/css?family=Lato:300,400,700,900' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,300' rel='stylesheet' type='text/css'>
    <link href="<%=request.getContextPath()%>/css/HealthZzangHome.css" rel="stylesheet">
    <!-- mypage icon-->
    <link href="http://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">
     <!-- mypage JavaScript -->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/init.js"></script>
    <script src="<%=request.getContextPath()%>/js/jquery-1.10.2.js"></script>


<c:if test="${errCode == null}">
	<c:set var="errCode" value="\"\""></c:set>
</c:if>
<script type="text/javascript">
	function errCodeCheck(){
		var errCode = ${errCode};
		if(errCode != null || errCode != ""){
			switch (errCode) {
			case 1:
				alert("이미 가입된 이메일 또는 아이디 입니다!");
				break;
			case 2:
				alert("회원가입 처리가 실패하였습니다. 잠시 후 다시 시도해 주십시오.");
				break;
			case 3:
				alert("회원가입 처리가 완료되었습니다! 로그인 해 주세요!");
				break;
			}
		}
	}
	
	function memberCheck(){
		if($("#id").val() == ''){
			alert("아이디를 입력하세요! ");
			$("#id").focus();
			return false;
		} else if($("#email").val() == ''){
			alert("이메일을 입력하세요!");
			$("#email").focus();
			return false;
		}else{
			return true;
		}
		
	}
	function myFunc(){
		alert("죄송합니다 서비스 준비 중입니다..");
	}

</script>
</head>

<body onload="errCodeCheck()">
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
	<div class="joinheader"></div>
         <div class="morph-content">
               <div class="content-style-form content-style-form-2">
                    <h1>Sign Up</h1>
                       <p><h5>저희 헬스짱은 고객님의 안전한 정보를 보호하기위해 이메일 인증제도를 실시하고 있습니다. 회원 가입시 고객님의 이메일로 임시비밀번호가 발송되며 임시비밀번호를 통해 로그인 하신 뒤 변경 부탁드립니다. :)</h5></p>
                        <spring:hasBindErrors name="MemberModel" />
					  	 <form:errors path="MemberModel" />
                         <form action="<%=request.getContextPath()%>/member/join.do" method="post"charset='UTF-8' onsubmit="return memberCheck()">
                            <p><input type="text" name="id" placeholder="ID를 입력하세요" value='' maxlength="50" size="30"/></p><br>
                            </p><span class="error"><form:errors path="MemberModel.id" /></span>
                         <br><br>
                            <p><input type="text" name="email" placeholder="e-mail을 입력하세요" value='' maxlength="50" size="30"/></p><br>
							</p><span class="error"><form:errors path="MemberModel.email" /></span><br><br>
                            <input type='submit' name='Submit' value='회원가입하기'/></p>
                            <br>
                           <center><a href="<%=request.getContextPath()%>/home.do">홈페이지 이동</a></center>
                         </form>
                </div>
          </div>
</body>
</html>