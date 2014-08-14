<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 보기: ${cevent.subject}</title>
   <!-- border -->
         <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/board.css" />
    <!-- core CSS -->
    <link href="<%=request.getContextPath()%>/css/HealthZzangHome.css" rel="stylesheet">

    <!-- mypage icon-->
     <link href="http://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">
    <!-- mypage-->

    <!-- Add custom CSS here -->
    <link href="<%=request.getContextPath()%>/css/shop-homepage.css" rel="stylesheet">

		   <!-- mypage JavaScript -->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/init.js"></script>
    <script src="<%=request.getContextPath()%>/js/jquery-1.10.2.js"></script></head>

<script type="text/javascript">
	function errCodeCheck(){
		var errCode = <%=request.getParameter("errCode")%>;
		if(errCode != null || errCode != ""){
			switch (errCode) {
			case 1:
				alert("잘못된 접근 경로입니다!");
				break;
			case 2:
				alert("댓글이 있어 글을 삭제하실 수 없습니다!");
				break;
			}
		}		
	}
	
	function commentDelete(commentIdx, linkedArticleNum){
		if(confirm("선택하신 댓글을 삭제하시겠습니까?")){
			location.href ="commentDelete.do?idx="+commentIdx+"&linkedArticleNum="+linkedArticleNum;
			/* document.write(commentIdx); */
		}		
	}
	
	function moveAction(where){
		switch (where) {
		case 1:
			if(confirm("글을 삭제하시겠습니까?")){
				location.href ="delete.do?idx=${cevent.idx}";
			}
			break;

		case 2:
			if(confirm("글을 수정하시겠습니까?")){
				location.href = "modify.do?idx=${cevent.idx}";
			}
			break;
			
		case 3:
			location.href = "list.do";			
			break;
		
		case 4:
			if(confirm("글을 추천하시겠습니까?")){
				location.href = "recommend.do?idx=${cevent.idx}";
			}
			break;
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
            <div class="mockup-content" id="disp" style="display:inline;" >
                    <div class="morph-button morph-button-modal morph-button-modal-2 morph-button-fixed">
                      <a href="<%=request.getContextPath()%>/login.do"> <button type="button"><img class="login" src="<%=request.getContextPath()%>/img/login.png"></img>
                        </a> 
                    </div><!-- morph-button -->
                    <strong class="joiner">|</strong>
                    <div class="morph-button morph-button-modal morph-button-modal-3 morph-button-fixed">
                     <a href="<%=request.getContextPath()%>/member/join.do">  <button type="button"><img class="register" src="<%=request.getContextPath()%>/img/register.png" ></img>
                      </a>
                    </div><!-- morph-button -->
            </div>
            <!-- login & register -->
            <!-- /.navbar-collapse -->
            </div>
        <!-- /.container -->
    </nav>
<!-- navi end -->
 <div class="loginheader"></div>

<div class="wrapper">	
	<table class="boardView">
		<tr>
			<td colspan="4"><h1>${cevent.subject}</h1></td>
		</tr>
		<tr>
			<th>작성자</th>
			<th>조회수</th>
			<th>추천수</th>
			<th>작성일</th>
		</tr>
		<tr>
			<td>${cevent.writerId}</td>
			<td>${cevent.hitcount}</td>
			<td>${cevent.recommendcount}</td>
			<td>${cevent.time}</td>
		</tr>
		<tr>
			<th colspan="4">내용</th>
		</tr>
		<c:if test="${cevent.fileupload != null }">
		<tr>
			<td colspan="4" align="left"><span class="date">첨부파일:&nbsp;<a href="<%=request.getContextPath()%>/files/${cevent.fileupload}" target="_blank">${cevent.fileupload}</a></span></td>
		</tr>
		</c:if>	
		<tr>
			<td colspan="4" align="left"><p>${cevent.content}</p><br /><br /></td>
		</tr>		
	</table>
	<table class="commentView">
		<tr>
			<th colspan="2">댓글</th>
		</tr>		
		<c:forEach var="comment" items="${commentList}">
		<tr>
			<td class="writer">				
				<p>${comment.writerId}
				<c:if test="${comment.writerId == id}">
					<br /><a onclick="commentDelete(${comment.idx}, ${cevent.idx})" ><small>댓글 삭제</small></a>					
				</c:if>				
				</p>
			</td>
			<td class="content" align="left">
				<span class="date">${comment.time}</span>
				<p>${comment.content}</p>

			</td>
		</tr>
		</c:forEach>
		<tr>
			<td class="writer"><strong>댓글 쓰기</strong></td>
			<td class="content">
				<form action="commentWrite.do" method="post">					
					<input type="hidden" id="writerId" name="writerId" value="${id}" />
					<input type="hidden" id="linkedArticleNum" name="linkedArticleNum" value="${cevent.idx}" />
					<textarea id="content" name="content" class="commentForm"></textarea>
					<input type="submit" value="확인" class="commentBt" />
				</form>
			</td>
		</tr>
	</table>
	<br />
	<c:choose>
		<c:when test="${cevent.writerId == id}">
			<input type="button" value="삭제" class="writeBt" onclick="moveAction(1)" />
			<input type="button" value="수정" class="writeBt" onclick="moveAction(2)" />
			<input type="button" value="목록" class="writeBt" onclick="moveAction(3)" />
		</c:when>
		<c:otherwise>
			<input type="button" value="추천" class="writeBt" onclick="moveAction(4)" />
			<input type="button" value="목록" class="writeBt" onclick="moveAction(3)" />
		</c:otherwise>
	</c:choose>
</div>
</body>
</html>