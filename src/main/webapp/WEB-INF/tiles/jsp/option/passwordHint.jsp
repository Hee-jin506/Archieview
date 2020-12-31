<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%!
    private String getHint(int questionsNo) {
      switch (questionsNo) {
        case 1 :
          return "내가 키우는 애완 동물의 이름은 ?";
        case 2:
          return "가장 기억에 남는 선생님의 성함은 ?";
        case 3:
          return "어머니의 고향은 ?";
        case 4:
          return "아버지의 고향은 ?";
        default:
          return "가장 친한 친구의 이름은 ?";
      }
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 힌트변경</title>
<style>
</style>
</head>

<body style="background-color: #000000">
<div id="box">
  <div class="menus">
    <div id='menu1'>
      <a href='<%=getServletContext().getContextPath()%>/app/option/profile'>프로필 변경</a>
    </div>
    <div id='menu2'>
      <a href='<%=getServletContext().getContextPath()%>/app/option/passwordUpdate'>비밀번호 변경</a>
    </div>
    <div id='menu3'>
      <a href='<%=getServletContext().getContextPath()%>/app/option/passwordHint'>비밀번호 힌트 변경</a>
    </div>
    <div id='menu4'>
      <a href='<%=getServletContext().getContextPath()%>/app/option/withdraw'>회원탈퇴</a>
    </div>
  </div>
  
  <div class="contents">
    <form action='updateHint' method='post'>
        <input type='hidden' name='no' value='${member.no}'>
        <img id='profile-photo' src='<%=getServletContext().getContextPath()%>/upload/${member.photo}_150x150.jpg' style="border-radius: 50px" width="60">
        <span id='email'>${member.email}</span>
      <div class="mb-3" style="margin-top: 30px">
        <label for="hint" class="form-label"  style="margin: 20px; font-size: small;">질문</label>
        <div class="col-sm-11">
	        <select class="form-control" aria-label="Default select example" name='hint'> <option selected value="${member.questionsNo}">
	          <c:if test='${member.questionsNo == 1}'>내가 키우는 애완 동물의 이름은 ?</c:if>
	          <c:if test='${member.questionsNo == 2}'>가장 기억에 남는 선생님의 성함은 ?</c:if>
	          <c:if test='${member.questionsNo == 3}'>어머니의 고향은 ?</c:if>
	          <c:if test='${member.questionsNo == 4}'>아버지의 고향은 ?</c:if>
	          <c:if test='${member.questionsNo == 5}'>가장 친한 친구의 이름은 ?</c:if>
	          </option>
	          <option value="1">내가 키우는 애완 동물의 이름은 ?</option>
	          <option value="2">가장 기억에 남는 선생님의 성함은 ?</option>
	          <option value="3">어머니의 고향은 ?</option>
	          <option value="4">아버지의 고향은 ?</option>
	          <option value="5">가장 친한 친구의 이름은 ?</option>
	        </select>
	      </div>
	    </div>
      <div class="mb-3">
        <label for="hintAnswer" class="form-label"  style="margin: 20px; font-size: small;">답</label>
        <div class="col-sm-10">
          <input type='text' autocomplete="off" class="form-control" name='hintAnswer' value='${member.questionsAnswer}'>
        </div>
      </div>
      <button id='next'>변경</button>
    </form>
  </div>
</div>
</body>
</html>