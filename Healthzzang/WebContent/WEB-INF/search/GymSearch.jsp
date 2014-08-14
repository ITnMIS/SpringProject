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

 <div style="margin-left: 185px"><h4>-- 헬스장 검색 결과 --</h4></div>

<div class="wrapper">
	<table border="0" class="boardTable">
		<thead>
		<tr>
			<th>헬스장</th>
			<th>지역</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach var="searchGymList" items="${searchGymList}">
		<tr>
			<td class="name"><a href="<%=request.getContextPath()%>/Hbasic/Hbasic.do?gseq=${searchGymList.gidx}">${searchGymList.name}</a></td>
			<td class="city&town">${searchGymList.city} ${searchGymList.town}</td>
				
		</tr>
		</c:forEach>
		</tbody>
	</table>
			<br />
	${GymPageHtml}
	<br /><br />
</div>
</body>
</html>