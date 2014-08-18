<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
 <div style="margin-left: 185px"><h4>-- 와글와글 게시판 검색 결과 --</h4></div>
<div class="wrapper">
	<table border="0" class="boardTable">
		<thead>
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>조회수</th>
			<th>추천수</th>
			<th>작성일</th>	
		</tr>
		</thead>
		<tbody>
		<c:forEach var="searchCFreeList" items="${searchCFreeList}">
		<tr>
 	 		<td class="idx">${searchCFreeList.idx}</td>
			<td align="left" class="subject">
				<a href="<%=request.getContextPath()%>/cfree/view.do?idx=${searchCFreeList.idx}">${searchCFreeList.subject}</a></td>
			<td class="writerId">${searchCFreeList.writerId}</td>
			<td class="hitcount">${searchCFreeList.hitcount}</td>
			<td class="recommendcount">${searchCFreeList.recommendcount}</td>
			<td class="time">${searchCFreeList.time}</td>		
		</tr>
		</c:forEach>
		</tbody>
	</table>
			<br />
	${CfreePageHtml}
	<br /><br />
</div>
</body>
</html>
