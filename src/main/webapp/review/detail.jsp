<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html>
<head><title>게시물 상세 조회</title></head>
<body>
<jsp:include page="/main/admin-topbar.jsp"></jsp:include>
<br>
<a href='../report/add?no=<%=request.getParameter("no")%>'>신고</a>

<h3>[게시물 상세 조회]</h3>
게시물 번호: ${review.no}<br>
작성자: ${review.writer.nickName}<br>
등록일: ${review.registeredDate}<br>
<%-- 영화 번호:${review.numOfReviews}<br> --%>
영화 제목: ${review.movieTitle}<br>
#해시태그: <jsp:include page="/tag/listByReviewNo?no=${review.no}"></jsp:include><br>
내용: ${review.text}<br>
<a href='delete?no=${review.no}'>삭제</a>
<a href='active?no=${review.no}'>복구</a>
</body>
</html>
