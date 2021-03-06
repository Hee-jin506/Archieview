<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="appRoot" value="${pageContext.servletContext.contextPath}" />

  <div id='menubar'>
	  <div id='inner'>
	    <div id='logo'>
	      <a href="${appRoot}/app/main/"> 
	        <img src="${appRoot}/main_resource/logo.png" alt="로고">
	      </a>
	    </div>
	    <div id='search'>
	      <form action='${appRoot}/app/main/search'>
	         <input type='text' id='search-data' name='keyword' placeholder='검색' value='${param.keyword != null ? param.keyword : ""}'>
	        <button id='search-btn'><img src='${appRoot}/main_resource/search-outline.png' width="12"></button>
	      </form>
	    </div>
	    <div id='profile'>
		    <div class="dropdown" id="headerProfileImageDropdown" style="    height: 30px;
    width: 30px;">
		    
	        <img class='profile dropdown-toggle' src='${appRoot}/upload/${loginUser.photo}_35x35.jpg' href="#" role="button"  data-bs-toggle="dropdown" aria-expanded="false">
	        
				  <ul class="dropdown-menu dropdown-menu-dark dropdown-menu-lg-end" 
				  aria-labelledby="dropdownMenuLink" 
				  style="background-color: #141517; border-color: #626473; margin-top: 4px;">
				    <li>
				      <a class="dropdown-item" 
				      href='${appRoot}/app/member/profile?no=${loginUser.no}'>
				       <img class='btn-icon' src='${appRoot}/option_resource/profile.png' alt='프로필'>프로필
				      </a>
				    </li>
				    <li>
				      <a class="dropdown-item" 
				      href='${appRoot}/app/member/savedReviews?no=${loginUser.no}'>
				       <img class='btn-icon' src='${appRoot}/option_resource/save.png' 
				       style='    
				              height: 16.02px;
									    margin-left: px;
									    width: 14.15px;
									    margin-left: 1.5px;
									    margin-top: 0px;
									   '
							 alt='저장됨'>저장됨
				      </a>
				    </li>
				    <li>
				      <a class="dropdown-item" href="${appRoot}/app/option/profile">
				      <img class='btn-icon' src='${appRoot}/option_resource/option.png' alt='설정'>설정
				      </a>
				    </li>
				    <li>
				      <hr class="dropdown-divider" 
				      style="border-right: 1px;
									    border-bottom: 1px;
									    border-left: 1px;
									    border-color: #626473;
    background-color: #626473;">
				    </li>
				    <li>
				      <a class="dropdown-item" href="${appRoot}/app/auth/logout">로그아웃
				      </a>
				    </li>
				    
				  </ul>
       </div> 
	    </div> 
	    
	    

		    <div id='icon'>
		      <a href='${appRoot}'>
		        <img src='${appRoot}/main_resource/home-outline.png' width="20" alt='메인화면'></a>
		      <a href='${appRoot}/app/write/movieSearch'>
		        <img src='${appRoot}/main_resource/plus-outline.png' width="20"  alt='글쓰기'></a> 
		      <a href='${appRoot}/app/main/followingFeed'>
		        <img src='${appRoot}/main_resource/heart-outline.png' width="20"  alt='팔로우한 회원의 피드'></a> 
		      <a href='${appRoot}/app/main/newsfeed'>
		        <img src='${appRoot}/main_resource/bell-outline.png' width="20"  alt='알람'></a>
		    </div>
		    
	    </div>
   </div>
   
   
   
 <script>
  var headerProfileImageDropdown = document.getElementById('headerProfileImageDropdown')
  var profile = document.getElementById('profile')
	headerProfileImageDropdown.addEventListener('show.bs.dropdown', function () {
	  profile.setAttribute("style", "border: 2px solid white; margin-top: 9px; margin-right : 0px; cursor:pointer;");
	})
		var dropdownItems = document.querySelectorAll(".dropdown-item");
  
  for(var d of dropdownItems) {
	  d.onclick = function(d) {
			  profile.setAttribute("style", "border: 2px solid white; margin-top: 9px; margin-right : 0px; cursor:pointer;");
	  }
  }
  
	  $('.dropdown-menu').click(function(e) {
	      e.stopPropagation();
	});  
  
	headerProfileImageDropdown.addEventListener('hidden.bs.dropdown', function () {
	  
		
	  var currentPath = window.location.pathname;
	  
	  if (currentPath.includes("profile") || 
			    currentPath.includes("followerList") ||
			    currentPath.includes("followingList") ||
			    currentPath.includes("savedReviews")
			    ) {
			  profile.setAttribute("style", "border: 2px solid white; margin-top: 9px; margin-right : 0px; cursor:pointer;");
			} else {
				profile.setAttribute("style", "");
			}
	  
	})
</script>

 <script type="text/javascript" charset="UTF-8">
 
$(document).ready(function() {
 $("#search-data").autocomplete({
 source : function(request, response) {
 
 $.ajax({
 
 url : "/Archiview/app/main/autocomplete",
 type : "post",
 dataType : "json",
 data: request,
 
 success : function(data) {
 
 var result = data;
 response(result);
 },
 
 error : function(data) {
 alert("에러가 발생하였습니다.")
 }
 });
 }
 });
});
</script>
