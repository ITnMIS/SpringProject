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
		<title>Caption Hover Effects - Demo 4</title>
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<meta name="author" content="Codrops" />

		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/HealthSearch.css" />
		
		  <!-- CSS -->

    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/component.css" />
    <link href='http://fonts.googleapis.com/css?family=Lato:300,400,700,900' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,300' rel='stylesheet' type='text/css'>

    <!-- login & register -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/login&register.css" />
    <!-- core CSS -->
    <link href="<%=request.getContextPath()%>/css/HealthZzangHome.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/seoul.css" />
    

    <!-- mypage icon-->
     <link href="http://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">

    <!-- mypage-->

	<script src="<%=request.getContextPath()%>/js/custom.js"></script>
	<script type="text/javascript">
	function myFunc(){
		alert("죄송합니다 서비스 준비 중입니다..");
	}
	</script>
		    <!-- JavaScript -->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/init.js"></script>
    <script src="<%=request.getContextPath()%>/js/jquery-1.10.2.js"></script>
	</head>
	<body>

    <!-- navigater-->
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
    <div class="gansugooheader">
    </div>
    <!-- navigater end -->
	<!-- best gym-->   
	<div class="line">
		<p>
			<h4>
				용인시 Best 헬스장 
			</h4>
		</p>
		<div class="gansugoo">
			<ul class="grid cs-style-4">
				<li>
					<figure>
						<div><img src="<%=request.getContextPath()%>/img/Gym/1.png" alt="img01"></div>
						<figcaption>
							<h3>정현 헬스장</h3>
							<span>용인에 이만한 곳 없다. 용인 최대의 장비와 시설이 존재하는 그곳 !!</span>
							<a href="<%=request.getContextPath()%>/Hbasic/Hbasic.do?gseq=1">Take a look</a>
						</figcaption>
					</figure>
				</li>
				<li>
					<figure>
						<div><img src="<%=request.getContextPath()%>/img/Gym/2.png" alt="img02"></div>
						<figcaption>
							<h3>수현 헬스장</h3>
							<span>여성들을 위한 여성들에 의한 여성들의 헬스장! 몸장 여헬스트레이너가 여성들을 책임집니다.</span>
							<a href="<%=request.getContextPath()%>/Hbasic/Hbasic.do?gseq=2">Take a look</a>
						</figcaption>
					</figure>
				</li>
				<li>
					<figure>
						<div><img src="<%=request.getContextPath()%>/img/Gym/3.jpg" alt="img03"></div>
						<figcaption>
							<h3>환희 헬스장</h3>
							<span>음악과 하나가 되는 헬스장. 국내 최초 락컨셉의 헬스장으로 여러분을 초대합니다.</span>
							<a href="<%=request.getContextPath()%>/Hbasic/Hbasic.do?gseq=3">Take a look</a>
						</figcaption>
					</figure>
				</li>
				<li>
					<figure>
						<div><img src="<%=request.getContextPath()%>/img/Gym/4.jpg" alt="img04"></div>
						<figcaption>
							<h3>영숙 헬스장</h3>
							<span>어르신들을 위한 어르신들에 의한 헬스장입니다. 나이는 숫자에 불과하다! 나이를 잊고 건강을 찾으세요.</span>
							<a href="<%=request.getContextPath()%>/Hbasic/Hbasic.do?gseq=4">Take a look</a>
						</figcaption>
					</figure>
				</li>
			</ul>
		</div>
	</div>
	
	<!-- gansugohealth-->
		<div class="gansugoo">
			<ul class="grid cs-style-4">
				<li>
					<figure>
						<div><img src="<%=request.getContextPath()%>/img/Gym/1.png" alt="img01"></div>
						<figcaption>
							<h3>정현 헬스장</h3>
							<span>용인에 이만한 곳 없다. 용인 최대의 장비와 시설이 존재하는 그곳 !!</span>
							<a href="<%=request.getContextPath()%>/Hbasic/Hbasic.do?gseq=1">Take a look</a>
						</figcaption>
					</figure>
				</li>
				<li>
					<figure>
						<div><img src="<%=request.getContextPath()%>/img/Gym/2.png" alt="img02"></div>
						<figcaption>
							<h3>수현 헬스장</h3>
							<span>여성들을 위한 여성들에 의한 여성들의 헬스장! 몸장 여헬스트레이너가 여성들을 책임집니다.</span>
							<a href="<%=request.getContextPath()%>/Hbasic/Hbasic.do?gseq=2">Take a look</a>
						</figcaption>
					</figure>
				</li>
				<li>
					<figure>
						<div><img src="<%=request.getContextPath()%>/img/Gym/3.jpg" alt="img03"></div>
						<figcaption>
							<h3>환희 헬스장</h3>
							<span>음악과 하나가 되는 헬스장. 국내 최초 락컨셉의 헬스장으로 여러분을 초대합니다.</span>
							<a href="<%=request.getContextPath()%>/Hbasic/Hbasic.do?gseq=3">Take a look</a>
						</figcaption>
					</figure>
				</li>
				<li>
					<figure>
						<div><img src="<%=request.getContextPath()%>/img/Gym/4.jpg" alt="img04"></div>
						<figcaption>
							<h3>영숙 헬스장</h3>
							<span>어르신들을 위한 어르신들에 의한 헬스장입니다. 나이는 숫자에 불과하다! 나이를 잊고 건강을 찾으세요.</span>
							<a href="<%=request.getContextPath()%>/Hbasic/Hbasic.do?gseq=4">Take a look</a>
						</figcaption>
					</figure>
				</li>
			</ul>
		</div>
		<div class="gansugoo">
			<ul class="grid cs-style-4">
				<li>
					<figure>
						<div><img src="<%=request.getContextPath()%>/img/Gym/commingsoon.png" alt="commingsoon"></div>
						<figcaption>
							<h3>Health Center1</h3>
							<span>헬스장 소개 내용</span>
							<a href="#">Take a look</a>
						</figcaption>
					</figure>
				</li>
				<li>
					<figure>
						<div><img src="<%=request.getContextPath()%>/img/Gym/commingsoon.png" alt="commingsoon"></div>
						<figcaption>
							<h3>Health Center2</h3>
							<span>헬스장 소개 내용</span>
							<a href="#">Take a look</a>
						</figcaption>
					</figure>
				</li>
				<li>
					<figure>
						<div><img src="<%=request.getContextPath()%>/img/Gym/commingsoon.png" alt="commingsoon"></div>
						<figcaption>
							<h3>Health Center3</h3>
							<span>헬스장 소개 내용</span>
							<a href="#">Take a look</a>
						</figcaption>
					</figure>
				</li>
				<li>
					<figure>
						<div><img src="<%=request.getContextPath()%>/img/Gym/commingsoon.png" alt="commingsoon"></div>
						<figcaption>
							<h3>Health Center4</h3>
							<span>헬스장 소개 내용</span>
							<a href="#">Take a look</a>
						</figcaption>
					</figure>
				</li>
			</ul>
		</div>
		<div class="gansugoo">
			<ul class="grid cs-style-4">
				<li>
					<figure>
						<div><img src="<%=request.getContextPath()%>/img/Gym/commingsoon.png" alt="commingsoon"></div>
						<figcaption>
							<h3>Health Center1</h3>
							<span>헬스장 소개 내용</span>
							<a href="#">Take a look</a>
						</figcaption>
					</figure>
				</li>
				<li>
					<figure>
						<div><img src="<%=request.getContextPath()%>/img/Gym/commingsoon.png" alt="commingsoon"></div>
						<figcaption>
							<h3>Health Center2</h3>
							<span>헬스장 소개 내용</span>
							<a href="#">Take a look</a>
						</figcaption>
					</figure>
				</li>
				<li>
					<figure>
						<div><img src="<%=request.getContextPath()%>/img/Gym/commingsoon.png" alt="commingsoon"></div>
						<figcaption>
							<h3>Health Center3</h3>
							<span>헬스장 소개 내용</span>
							<a href="#">Take a look</a>
						</figcaption>
					</figure>
				</li>
				<li>
					<figure>
						<div><img src="<%=request.getContextPath()%>/img/Gym/commingsoon.png" alt="commingsoon"></div>
						<figcaption>
							<h3>Health Center4</h3>
							<span>헬스장 소개 내용</span>
							<a href="#">Take a look</a>
						</figcaption>
					</figure>
				</li>
			</ul>
		</div>

	<div class="gansugoo">
			<ul class="grid cs-style-4">
				<li>
					<figure>
						<div><img src="<%=request.getContextPath()%>/img/Gym/commingsoon.png" alt="commingsoon"></div>
						<figcaption>
							<h3>Health Center1</h3>
							<span>헬스장 소개 내용</span>
							<a href="#">Take a look</a>
						</figcaption>
					</figure>
				</li>
				<li>
					<figure>
						<div><img src="<%=request.getContextPath()%>/img/Gym/commingsoon.png" alt="commingsoon"></div>
						<figcaption>
							<h3>Health Center2</h3>
							<span>헬스장 소개 내용</span>
							<a href="#">Take a look</a>
						</figcaption>
					</figure>
				</li>
				<li>
					<figure>
						<div><img src="<%=request.getContextPath()%>/img/Gym/commingsoon.png" alt="commingsoon"></div>
						<figcaption>
							<h3>Health Center3</h3>
							<span>헬스장 소개 내용</span>
							<a href="#">Take a look</a>
						</figcaption>
					</figure>
				</li>
				<li>
					<figure>
						<div><img src="<%=request.getContextPath()%>/img/Gym/commingsoon.png" alt="commingsoon"></div>
						<figcaption>
							<h3>Health Center4</h3>
							<span>헬스장 소개 내용</span>
							<a href="#">Take a look</a>
						</figcaption>
					</figure>
				</li>
			</ul>
		</div>

	</body>
</html>