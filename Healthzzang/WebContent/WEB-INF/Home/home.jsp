<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"> 
    <link href='http://fonts.googleapis.com/css?family=Lato:300,400,700,900' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,300' rel='stylesheet' type='text/css'>
    <title>당신의 건강, 젊음, 아름다움을 위해</title>

   
    <!-- login & register -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/login&register.css" />
    <!-- core CSS -->
    <link href="<%=request.getContextPath()%>/css/HealthZzangHome.css" rel="stylesheet">

    <!-- mypage icon-->
     <link href="http://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">
    <!-- mypage-->

    <!-- Add custom CSS here -->
    <link href="<%=request.getContextPath()%>/css/shop-homepage.css" rel="stylesheet">
</head>
	<script type="text/javascript">
	function myFunc(){
			alert("죄송합니다 서비스 준비 중입니다..");
	}
	</script>
	

<body onload="readingServcie()">

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
                    <img src="img/11.png"></img>
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
            </c:choose>
            <!-- login & register -->
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <div class="container">

            <!--center&main content-->
            <div class="col-md-9">

                <div class="row carousel-holder">
                    <div class="event">
                    <img src="img/icon/event.png"/>  
                    </div>
                    <div class="col-md-6">
                        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                            </ol>
                       		<div class="carousel-inner">
                                <div class="item active">
                                    <img class="slide-image" src="img/openevent.png" alt="">
                                </div>
                                <div class="item">
                                    <img class="slide-image" src="img/event1.png" alt="">
                                </div>
                                <div class="item">
                                    <img class="slide-image" src="img/event2.png" alt="">
                                </div>
                            </div>
                            <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                                <span class="glyphicon glyphicon-chevron-left"></span>
                            </a>
                            <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                                <span class="glyphicon glyphicon-chevron-right"></span>
                            </a>
                        </div>      
                    </div>
                    <!-- icon -->
                    <div class="mo">
                        <img src="img/icon/MonthHealthz1.png"/></div>
                    <div class="MonthHealthz">
                     <ul>
                        <li>
                        <div class="shape">
                            <a href="#" class="overlay round"></a>
                            <div class="details">
                                <span class="heading">흑형님</span>
                                <hr/>
                                <p>이번 달의 '나는 헬스짱이다'에 당첨되신 경기도 용인에 사시는 흑형님. 약 한달만에 완벽한 근육을 만들어내셨습니다. 선택받은 종족이라 그런걸까요? 그의 훈련 후기 확인해보시죠! </p>    
                                <a href="<%=request.getContextPath()%>/chealthz/view.do?idx=1" class="button">VIEW</a>
                            </div>
                            <div class="bg"></div>
                        <div class="base">
                            <img src="img/blackH.png" alt="" />
                        </div>
  
                        </div>  
                        </li>
                     </ul>
                    </div>
                </div>
                                    <!-- icon -->
                <div class="re">
                    <img src="img/icon/recomHealth.png"/>
                </div>

               <div class="row">
                  <div class="view view-first">  
                    <img src="img/reGym/sungmin.jpg" />  
                    <div class="mask">  
                        <h2>정현 헬스장<h5 class="pull-right">경기 용인시</h5></h2> 
                        <p>용인에 이만한 곳 없다. 용인 최대의 장비와 시설이 존재하는 그곳 !!</p>
                        <div class="ratings">
                            <p>
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon  glyphicon-star"></span>
                                <span class="glyphicon  glyphicon-star"></span>
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon  glyphicon-star-empty"></span>
                            </p>
                        </div> 
                        <a href="<%=request.getContextPath()%>/Hbasic/Hbasic.do?gseq=1" class="info">구경하기</a> 
                    </div>  
                  </div>
                  <div class="view view-first">  
                    <img src="img/reGym/ryu.jpg" />  
                    <div class="mask">  
                        <h2>지단 헬스장<h5 class="pull-right">서울시 강북구</h5></h2>  
                        <p>근육이 찢어지는 소리가 들리는 그날까지. 멘탈 고정해주는 친절한 헬스장</p> 
                        <div class="ratings">
                            <p>
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon  glyphicon-star"></span>
                                <span class="glyphicon  glyphicon-star"></span>
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon  glyphicon-star"></span>
                            </p>
                        </div> 
                        <a href="<%=request.getContextPath()%>/Hbasic/Hbasic.do?gseq=7" class="info">구경하기</a> 
                    </div>  
                  </div>
                  <div class="view view-first">  
                    <img src="img/reGym/sejoon.jpg" />  
                    <div class="mask">  
                        <h2>펠레 헬스장<h5 class="pull-right">서울시 강북구</h5></h2>
                        <p>몸짱이 될 확률과 적중률을 완벽하게 계산해주는 몸짱 트레이너 펠레가 있는!강북구 명소</p>
                        <div class="ratings">
                            <p>
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon  glyphicon-star"></span>
                                <span class="glyphicon  glyphicon-star"></span>
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon  glyphicon-star"></span>
                            </p>
                        </div> 
                        <a href="<%=request.getContextPath()%>/Hbasic/Hbasic.do?gseq=9" class="info">구경하기</a> 
                    </div>  
                  </div>
                                <!-- icon -->
               
                </div>
            </div>
            <!--center&main content-->
    </div>
    <!-- /.container -->

    <div class="container">

        <hr>

        <footer>
            <div class="row">
                <div class="col-lg-4">
                    <p>Copyright &copy; Company 2013 - Template by HealthZZang
                    </p>
                </div>
            </div>
        </footer>

    </div>
    <!-- /.container -->

    <!-- JavaScript -->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="js/init.js"></script>
    <script src="js/jquery-1.10.2.js"></script>
    <script src="js/bootstrap.js"></script>

</body>

</html>
