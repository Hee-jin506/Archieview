<%@page import="bitcamp.acv.domain.Tag"%>
<%@page import="bitcamp.acv.domain.Movie"%>
<%@page import="bitcamp.acv.domain.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<div id='sidebar'>
	<div id='topMembers' class='sidebar-member'>
		<div class='sidebar-title'>추천 리뷰어 목록</div>
		<hr>
		
		<% Member[] members = (Member[])request.getAttribute("topMembers");
		for (Member member : members) {
		%>
		<div class='sidebar-member-row'>
			<div class='sidebar-member-row-image'>
			  <a href='<%=getServletContext().getContextPath()%>/app/member/profile?no=<%=member.getNo()%>'>
			    <img class='profile' src='<%=getServletContext().getContextPath()%>/upload/<%= member.getPhoto()%>_35x35.jpg'>
			  </a>
			</div>
			<div class='sidebar-member-row-image-text'>
				<p>
				  <a class='nickname' href='<%=getServletContext().getContextPath()%>/app/member/profile?no=<%=member.getNo()%>'>
				    <%=member.getNickName()%>
				  </a>
				</p>
			  <p class='explanation'><%= member.getIntro()%></p>
			</div>
		</div>
		<%
		}
		%>
	</div>

	<div id='topMovies' class='sidebar'>
	 <div class='sidebar-title'>인기 영화 목록</div>
		<hr>
			<% Movie[] movies = (Movie[])request.getAttribute("topMovies");
			int count = 1;
			for (Movie movie : movies) {
			%>
		<div class='sidebar-movie-tag-row'>
			<p class='title'><%=count%> <%=movie.getTitle()%></p>
			<p class='explanation'>게시물 <%=movie.getReviews().size()%>개</p>
		</div>
			<%
			count++;
			}
			%>
	</div>

	<div id='topTags' class='sidebar'>
	 <div class='sidebar-title'>인기 태그 목록</div>
		<hr>
			<% Tag[] tags = (Tag[])request.getAttribute("topTags");
			for (Tag tag : tags) {
			%>
		<div class='sidebar-movie-tag-row'>
			<p class='title'># <%=tag.getTitle()%></p>
			<p class='explanation'>게시물 <%=tag.getReviews().size()%>개 팔로워 <%=tag.getFollowers().size()%>명</p>
		</div>
			<%
			}
			%>
	</div>
</div>
