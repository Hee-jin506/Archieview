<%@page import="java.util.Map"%>
<%@page import="bitcamp.acv.domain.Tag"%>
<%@page import="bitcamp.acv.domain.Member"%>
<%@page import="java.util.List"%>
<%@page import="bitcamp.acv.domain.Review"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id='cards'>
	<%
	  List<Review> list = (List<Review>) request.getAttribute("list");
	for (Review review : list) {
	%>
	<div class='card'>
		<div class='cardHeader'>
			<a
				href='<%=getServletContext().getContextPath()%>/app/member/profile?no=${tm.no}'>
				<img class='profile'
				src='<%=getServletContext().getContextPath() + "/upload/" + review.getWriterPhoto() + "_35x35.jpg"%>'>
			</a> <a class='nickname'
				href='<%=getServletContext().getContextPath()%>/app/member/profile?no=${tm.no}'>
				<%=review.getWriterNick()%></a>
			<%
			  if (!review.getWriterNick().equals(((Member) (request.getAttribute("loginUser"))).getNickName())) {
			%>
			<%
			  if (review.getIsFollowing() != 0) {
			%>
			<div class='follow'>
				<form action='<%=getServletContext().getContextPath()%>/app/follow/deleteUser'>
        <input type='hidden' name='followedNo' value=<%=review.getWriterNo() %>>
					<button class="btn btn-twitter">팔로우</button>
				</form>
			</div>
			<%} else {%>
			<div class='follow'>
				<form action='<%=getServletContext().getContextPath()%>/app/follow/addUser'>
        <input type='hidden' name='followedNo' value=<%=review.getWriterNo() %>>
					<button class="btn btn-archiview">팔로우</button>
				</form>
			</div>
			<%
			  }
			}
			%>
			<div class="dropdown1">
			<button class='more' data-no='<%=review.getNo()%>'>
				<img src='<%=getServletContext().getContextPath()%>/main_resource/more.png' >
			</button>
				<div class="dropdown-content1" data-no='<%=review.getNo()%>'>
				<c:if test='<%=review.getWriterNick().equals(((Member) (request.getAttribute("loginUser"))).getNickName())%>'>
				  <a herf="#">수정</a>
				  <hr style="margin: 0px;">
				  <a herf="#">삭제</a>
				</c:if>
				<c:if test='<%=!review.getWriterNick().equals(((Member) (request.getAttribute("loginUser"))).getNickName())%>'>
				  <a herf="#">신고</a>
				</c:if>
				</div>
			</div>
		</div>
		
		<div class='stillcut' data-no='<%=review.getNo() %>'>
			<%if (review.getStcUrl() != null) {%>
			<img src=<%=review.getStcUrl()%> data-no='<%=review.getNo() %>'>
			<%
	        } else {
	          %>
	          <div class='no-stillcut'>
	          </div>
	          <%
	        }
	      %>
			<div class='reviewText' data-no='<%=review.getNo() %>'>
				<p><%=review.getText()%>
				</p>
			</div>

			<div class='tags'>
				<%
				  List<Tag> tags = review.getTags();
				for (Tag tag : tags) {
				  if (tag.getTitle() != null) {
				%>
				<a class='tag'
					href='<%=getServletContext().getContextPath() + "/app/main/search?keyword=%23" + tag.getTitle()%>'>
					#<%=tag.getTitle()%></a>
				<%}
}%>
			</div>
		</div>

		<div class='cardFooter'>
			<a class='movie'><%=review.getMovieTitle()%></a>
			<p class='rdt'><%=(review.getRdtFromNow())%></p>
      <div class='like'>
          <img
          src='<%=getServletContext().getContextPath()%>/main_resource/<%=review.getIsLiking() != 0 ? "like2.png" : "like.png"%>'
          alt='좋아요'  data-no='<%=review.getNo()%>' like='<%=review.getIsLiking() != 0 ? "liking" : "notLiking" %>'>
         <span class='pop' data-no='<%=review.getNo()%>'><%=review.getLiking()%>개</span>
      </div>
		</div>
	<div class='reviewDetail'>
	<button></button>
	</div>
	</div>
	<%
	}%>
	
</div>
