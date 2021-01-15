<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<c:set var="appRoot" value="${pageContext.servletContext.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	
	<title>아카이뷰</title>
	
	<link href="${appRoot}/node_modules/jquery-ui-dist/jquery-ui.min.css"
		rel="stylesheet" type="text/css" />
	<link
		href="${appRoot}/node_modules/jquery-ui-dist/jquery-ui.theme.min.css"
		rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="${appRoot}/css/reset.css">
	<link rel="stylesheet" href="${appRoot}/css/sidebar.css">
	<link rel="stylesheet" href="${appRoot}/css/footer.css">
	<link rel="stylesheet"
		href="${appRoot}/css/bootstrap/dist/css/custom.css">
	<link rel="stylesheet" href="${appRoot}/css/header.css">
	<link rel="stylesheet" href="${appRoot}/css/main.css">
	<link rel="stylesheet" href="${appRoot}/css/mainFeed.css">
	<link rel="stylesheet" href="${appRoot}/css/newsfeed.css">
	<link rel="stylesheet" href="${appRoot}/css/profile.css">
	<link rel="stylesheet" href="${appRoot}/css/detailForUser.css">
	
	<style>
		#container {
			width: 920px;
			margin: 0 auto;
			margin-top: 75px;
		}
		
		#profile_contents {
			margin-top: 10px;
		}
		
		#body {
			xposition: absolute;
			xleft: 230px;
			xtop: 70px;
			box-sizing: content-box;
			xwidth: 700px;
			height: 700px;
			padding: 0px;
			overflow: hidden;
			overflow-y: scroll;
			-ms-overflow-style: none;
			scrollbar-width: none;
		}
		
		#body::-webkit-scrollbar {
			display: none;
		}
		
		#reveiwDetail img[data-bs-dismiss="modal"] {
			width: 20px;
			position: absolute;
			top: -25px;
			right: -160px;
		}
	</style>
	
	<script
		src="${appRoot}/node_modules/bootstrap/dist/js/bootstrap.bundle.js"></script>
	<script src="${appRoot}/node_modules/jquery/dist/jquery.js"></script>
	<script src="${appRoot}/node_modules/jquery-ui-dist/jquery-ui.js"
		type="text/javascript"></script>

</head>
<body>

	<!-- <div id="headerLine"></div> -->
	<div id="container">
		<tiles:insertAttribute name="header" />
		<tiles:insertAttribute name="sidebar" />
		<div id="body">
			<tiles:insertAttribute name="body" />
		</div>
		<tiles:insertAttribute name="footer" />

	</div>
	
	<div class="modal fade" id="reveiwDetail" tabindex="-1" 
	aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<!-- 모달 화면 -->
				</div>
				<img
					src='${appRoot}/main_resource/x.png'
					data-bs-dismiss="modal">
			</div>
		</div>
	</div>
	
	    
	<div class="modal fade" id ="reportModal" tabindex="-1" 
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div id="report-close">
	        <button type="button" class="btn-close" aria-label="Close" data-bs-dismiss="modal"
	        style="position: absolute;
	         top: 20px;
	         right: 30px;"></button>
	      <div class="modal-body">
	        <!-- 모달 화면 -->
	        </div>
	      </div>
	    </div>
	  </div>
	</div>
	
<script>
"use strict" 
var count = 1;
var body = document.querySelector("#body");

var followButtons = document.querySelectorAll(".follow button");
var modalUnfollowButtons = document.querySelectorAll(".unfollow");

var likeButtons = document.querySelectorAll(".like img");

var moreButtons = document.querySelectorAll('.more');

var menuContents = document.querySelectorAll('.dropdown-content1');

var cards = document.querySelectorAll(".stillcut");
var ReviewDetailModal = new bootstrap.Modal(document.getElementById('reveiwDetail'), {});
var reviewDetail = document.querySelector("#reveiwDetail");
var detailBody = reviewDetail.querySelector(".modal-body");
var reviewNo;

body.onscroll = function(e) {
    if(body.scrollTop >= 1850) {
        count++;
        console.log("스크롤 끝 감지") 
        var xhr = new XMLHttpRequest();
        xhr.open("GET", "/Archiview/app/ajax/review/moreFeed?pageNo=" + count, false);
        xhr.send();
        
        var originContent = body.innerHTML;
        body.innerHTML = originContent + xhr.responseText;
        
        
        var cards = document.querySelectorAll(".stillcut");
        var likeButtons = document.querySelectorAll(".like img");
        var moreButtons = document.querySelectorAll(".more");
        var menuContents = document.querySelectorAll('.dropdown-content1');
        
        var followButtons = document.querySelectorAll(".follow button");
        var modalUnfollowButtons = document.querySelectorAll(".unfollow");
        
        
        for (var e of cards) {
        	  e.onclick = function(e) {
        		  console.log("click");
        	    reviewNo=this.getAttribute("data-no");
        	    ReviewDetailModal.show();
        	  };
        }
        
        for (var e of likeButtons) {
        	  e.addEventListener("mouseover", function(e) {
        	        this.setAttribute("src", "${appRoot}/main_resource/like2.png"); 
        	  });
        	  e.addEventListener("mouseout", function(e) {
        		  if (this.getAttribute("like") == "notLiking") {
                    this.setAttribute("src", "${appRoot}/main_resource/like.png");
        		  } else {
        			  console.log("변하면 안돼!")
        			  this.setAttribute("src", "${appRoot}/main_resource/like2.png")
        		  }
        	  });
        	    e.addEventListener("click", function(e) {
        	          if (this.getAttribute("like") == "liking") {
        	            this.setAttribute("like", "notLiking");
        	            var pops = document.querySelectorAll(".pop");
        	            for (var pop of pops) {
        	              if (pop.getAttribute("data-no") == this.getAttribute("data-no")) {
        	            	  console.log(pop.innerText.split("개")[0]); 
        	                pop.innerText = String(parseInt(pop.innerText.split("개")[0]) - 1) + "개"
        	              }
        	            }
        	            var xhr = new XMLHttpRequest();
        	            var no = this.getAttribute("data-no");
        	            xhr.open("GET", "${appRoot}/app/like/dislikeReview?likedNo=" + no, false);
        	            xhr.send();
        	          } else {
        	            this.setAttribute("like", "liking");
        	            var pops = document.querySelectorAll(".pop");
        	            for (var pop of pops) {
        	              if (pop.getAttribute("data-no") == this.getAttribute("data-no")) {
        	            	  console.log(pop.innerText.split("개")[0]); 
        	                pop.innerText = String(parseInt(pop.innerText.split("개")[0]) + 1) + "개"
        	              }
        	            }
        	            var xhr = new XMLHttpRequest();
        	            var no = this.getAttribute("data-no");
        	            xhr.open("GET", "${appRoot}/app/like/likeReview?likedNo=" + no, false);
        	            xhr.send();
        	          }
        	      });
        }
        
        for (var e of followButtons) {
        	  
            e.addEventListener("mouseover", function(e) {
              if (this.getAttribute("follow") == "following") {
                    this.setAttribute("data-bs-toggle", "modal");
                    this.setAttribute("data-bs-target", "#unfollowModal"
                            +this.getAttribute("target-type")
                            +this.getAttribute("target-no"));
              }
            });
            e.addEventListener("mouseout", function(e) {
                  this.setAttribute("data-bs-toggle", " ");
                  this.setAttribute("data-bs-target", " ");
            });
          
          
            e.addEventListener("click", function(e) {
                 if (this.getAttribute("follow") == "notFollowing") {
                    
                    this.setAttribute("follow", "following");
                    this.setAttribute("class", "btn btn-twitter");
                    this.setAttribute("data-bs-toggle", "modal");
                    this.setAttribute("data-bs-target", "#unfollowModal"
                        +this.getAttribute("target-type")
                        +this.getAttribute("target-no"));
                    
                    $.ajax({
                    
                        url: this.getAttribute("target-type")=="Member" ? 
                                  "${appRoot}/app/follow/addUser" :
                                      "${appRoot}/app/follow/addTag",
                        type: 'get',
                        data: {
                          followedNo: this.getAttribute("target-no")
                        }
                        ,
                        dataType: 'html',
                        done: function(response) {
                        },
                        fail: function(error) {
                        },
                        always: function(response) {
                        }
                      });
                  }
              });
        }

        for (var e of modalUnfollowButtons) {
          e.addEventListener("click", function(e) {
            for (var f of followButtons) {
                   console.log(f.getAttribute("target-no"));
                    console.log(f.getAttribute("target-type"));
              if (this.getAttribute("target-no") == f.getAttribute("target-no") && 
                   this.getAttribute("target-type") == f.getAttribute("target-type")) {
                console.log(this.getAttribute("target-no"));
                console.log(this.getAttribute("target-type"));
                console.log(f.getAttribute("target-no"));
                console.log(f.getAttribute("target-type"));
                  f.setAttribute("follow", "notFollowing");
                  f.setAttribute("class", "btn btn-archiview");
                
                  $.ajax({
                        
                          url: this.getAttribute("target-type")=="Member" ? 
                                    "${appRoot}/app/follow/deleteUser" :
                                        "${appRoot}/app/follow/deleteTag",
                          type: 'get',
                          data: {
                            followedNo: this.getAttribute("target-no")
                          }
                          ,
                          dataType: 'html',
                          done: function(response) {
                          },
                          fail: function(error) {
                          },
                          always: function(response) {
                          }
                        });
                  
              }
            }
          });
        }
        
        for (var element of moreButtons) {
        	element.addEventListener("click", function(e) {
        	    var no = this.getAttribute("data-no");
        	    console.log(no);
        	  for (var menu of menuContents) {
        	      if (menu.getAttribute("data-no") == no) {
        	    console.log(menu.getAttribute("data-no"), this.getAttribute("data-no")); 
        	           if(menu.style.display===""){
        	             menu.style.display="block";
        	             } else {
        	               menu.style.display="";
        	             }
        	        
        	      }
        	    }
        	});
        	}
    }
}; 

for (var e of likeButtons) {
	
	  e.addEventListener("mouseover", function(e) {
	        this.setAttribute("src", "${appRoot}/main_resource/like2.png");  // undefined
	      });
      e.addEventListener("mouseout", function(e) {
          if (this.getAttribute("like") == "notLiking") {
                this.setAttribute("src", "${appRoot}/main_resource/like.png");
          } else {
            this.setAttribute("src", "${appRoot}/main_resource/like2.png");
          }
      });
    e.addEventListener("click", function(e) {
          if (this.getAttribute("like") == "liking") {
            this.setAttribute("like", "notLiking");
            var pops = document.querySelectorAll(".pop");
            for (var pop of pops) {
            	if (pop.getAttribute("data-no") == this.getAttribute("data-no")) {
            		console.log(pop.innerText.split("개")[0]); 
            		pop.innerText = String(parseInt(pop.innerText.split("개")[0]) - 1) + "개"
            	}
            }
            var xhr = new XMLHttpRequest();
            var no = this.getAttribute("data-no");
            xhr.open("GET", "${appRoot}/app/like/dislikeReview?likedNo=" + no, false);
            xhr.send();
          } else {
            this.setAttribute("like", "liking");
            var pops = document.querySelectorAll(".pop");
            for (var pop of pops) {
              if (pop.getAttribute("data-no") == this.getAttribute("data-no")) {
            	  console.log(pop.innerText.split("개")[0]); 
                pop.innerText = String(parseInt(pop.innerText.split("개")[0]) + 1) + "개"
              }
            }
            var xhr = new XMLHttpRequest();
            var no = this.getAttribute("data-no");
            xhr.open("GET", "${appRoot}/app/like/likeReview?likedNo=" + no, false);
            xhr.send();
          }
      });
}

for (var e of followButtons) {
	
		e.addEventListener("mouseover", function(e) {
			if (this.getAttribute("follow") == "following") {
            this.setAttribute("data-bs-toggle", "modal");
            this.setAttribute("data-bs-target", "#unfollowModal"
                    +this.getAttribute("target-type")
                    +this.getAttribute("target-no"));
			}
	  });
	  e.addEventListener("mouseout", function(e) {
          this.setAttribute("data-bs-toggle", " ");
          this.setAttribute("data-bs-target", " ");
	  });
	
	
    e.addEventListener("click", function(e) {
         if (this.getAttribute("follow") == "notFollowing") {
        	  
            this.setAttribute("follow", "following");
            this.setAttribute("class", "btn btn-twitter");
            this.setAttribute("data-bs-toggle", "modal");
            this.setAttribute("data-bs-target", "#unfollowModal"
            		+this.getAttribute("target-type")
            		+this.getAttribute("target-no"));
            
            $.ajax({
            
            	  url: this.getAttribute("target-type")=="Member" ? 
                          "${appRoot}/app/follow/addUser" :
                              "${appRoot}/app/follow/addTag",
            	  type: 'get',
            	  data: {
            		  followedNo: this.getAttribute("target-no")
            	  }
            	  ,
            	  dataType: 'html',
            	  done: function(response) {
            	  },
            	  fail: function(error) {
            	  },
            	  always: function(response) {
            	  }
            	});
          }
      });
}

for (var e of modalUnfollowButtons) {
	e.addEventListener("click", function(e) {
		for (var f of followButtons) {
		       console.log(f.getAttribute("target-no"));
		        console.log(f.getAttribute("target-type"));
			if (this.getAttribute("target-no") == f.getAttribute("target-no") && 
					 this.getAttribute("target-type") == f.getAttribute("target-type")) {
				console.log(this.getAttribute("target-no"));
				console.log(this.getAttribute("target-type"));
				console.log(f.getAttribute("target-no"));
				console.log(f.getAttribute("target-type"));
			    f.setAttribute("follow", "notFollowing");
			    f.setAttribute("class", "btn btn-archiview");
			  
			    $.ajax({
		            
	                url: this.getAttribute("target-type")=="Member" ? 
	                          "${appRoot}/app/follow/deleteUser" :
	                              "${appRoot}/app/follow/deleteTag",
	                type: 'get',
	                data: {
	                  followedNo: this.getAttribute("target-no")
	                }
	                ,
	                dataType: 'html',
	                done: function(response) {
	                },
	                fail: function(error) {
	                },
	                always: function(response) {
	                }
	              });
			    
			}
		}
	});
}

for (var element of moreButtons) {
element.addEventListener("click", function(e) {
    var no = this.getAttribute("data-no");
  for (var menu of menuContents) {
      if (menu.getAttribute("data-no") == no) {
           if(menu.style.display===""){
             menu.style.display="block";
             } else {
               menu.style.display="";
             }
        
      }
    }
});
}


reviewDetail.addEventListener('show.bs.modal', function (event) {
	console.log("show.bs.modal")
	var xhr = new XMLHttpRequest();
	xhr.open("GET", "/Archiview/app/ajax/review/detailForUser?reviewNo=" + reviewNo, false);
	xhr.send();
	detailBody.innerHTML = xhr.responseText;
	
	 var saveButtons = document.querySelectorAll(".save img");
     
     for (var e of saveButtons) {
       
        e.addEventListener("mouseover", function(e) {
          console.log("hahaha");
              this.setAttribute("src", "<%=getServletContext().getContextPath()%>/main_resource/saved.png");
            });
          e.addEventListener("mouseout", function(e) {
          console.log("hahaha");
              if (this.getAttribute("save") == "notSaving") {
                    this.setAttribute("src", "<%=getServletContext().getContextPath()%>/main_resource/saved-outline.png");
              } else {
                this.setAttribute("src", "<%=getServletContext().getContextPath()%>/main_resource/saved.png");
              }
          });
        e.addEventListener("click", function(e) {
          console.log("hahaha");
              if (this.getAttribute("save") == "saving") {
                this.setAttribute("save", "notSaving");
                var xhr = new XMLHttpRequest();
                var no = this.getAttribute("data-no");
                xhr.open("GET", "<%=getServletContext().getContextPath()%>/app/save/delete?savedNo=" + no, false);
                xhr.send();
              } else {
                this.setAttribute("save", "saving");
                var xhr = new XMLHttpRequest();
                var no = this.getAttribute("data-no");
                xhr.open("GET", "<%=getServletContext().getContextPath()%>/app/save/add?savedNo=" + no, false);
                xhr.send();
              }
          });
    }
    
  var level2btn = document.querySelectorAll(".level-2");
  var register = document.querySelector(".register");
  var targetNo, groupNo, level;
  
  for (var e of level2btn) {
    e.onclick = function(e) {
        dataNo = e.target.getAttribute("data-no");
        var comment = comments[dataNo];
        var originContent = register.innerHTML;
        register.innerHTML = originContent + 
           "<input type='hidden' name='targetNo' value='"+ comment.targetNo +"'>";
        document.querySelector(".register input[name='level']").setAttribute("value", 2);
        document.querySelector(".register input[name='reviewNo']").setAttribute("value", ${param.reviewNo});
        document.querySelector(".register input[name='content']").setAttribute("value", "@" + comment.writer +" ");
        console.log(register.innerHTML)
      };
    } 
    
});

reviewDetail.addEventListener('shown.bs.modal', function (event) {
	  console.log("shown.bs.modal")
});

reviewDetail.addEventListener('hidden.bs.modal', function (event) {
	  console.log("hidden.bs.modal")
});

for (var e of cards) {
	e.onclick = function(e) {
		console.log("클릭")
		console.log(this.getAttribute("data-no"));
		reviewNo=this.getAttribute("data-no");
		ReviewDetailModal.show();
	};
}
	
document.addEventListener('load', function (event) {
		console.log("${param.reviewNo}" != "");
		if ("${param.reviewNo}" != "") {
		console.log("실행!")
		reviewNo = "${param.reviewNo}";
		ReviewDetailModal.show();
	}
});

</script>

<script>
var el = document.querySelectorAll(".report-form");
var myModal = new bootstrap.Modal(document.getElementById('reportModal'), {});
var reportModal = document.querySelector("#reportModal");
var exampleModalBody = reportModal.querySelector("#reportModal .modal-body");
var memberNo;

reportModal.addEventListener('show.bs.modal', function (event) {
  console.log("show.bs.modal")
  $("#reportModal .modal-body").load("../ajax/report/form?reportedNo=" + memberNo);
  
});

reportModal.addEventListener('shown.bs.modal', function (event) {
  console.log("shown.bs.modal")
});

reportModal.addEventListener('hidden.bs.modal', function (event) {
  console.log("hidden.bs.modal 종료")
});  

for (var e of el) {
  e.onclick = function(e) {
    e.preventDefault();
    memberNo = e.target.getAttribute("data-no");
    console.log("click");
    myModal.show();
  };
}
</script>

<script>

/* 헤더 아이콘 색 채우기 */
var currentPath = window.location.pathname;
var profile = document.getElementById('profile');
var homeIcon = document.querySelector("#icon a:nth-child(1) img");
var plusIcon = document.querySelector("#icon a:nth-child(2) img");
var heartIcon = document.querySelector("#icon a:nth-child(3) img");
var bellIcon = document.querySelector("#icon a:nth-child(4) img");

console.log(plusIcon);

plusIcon.onclick = function(plusIcon) {
    console.log("아니 클릭햇다고");
  };


if (currentPath.includes("profile") || 
		currentPath.includes("followerList") ||
		currentPath.includes("followingList") ||
		currentPath.includes("savedReviews")
		) {
	profile.setAttribute("style", "border: 2px solid white; margin-top: 5px; margin-right : 0px; cursor:pointer;");
} else if (currentPath.includes("write")) {
	console.log("write");
	plusIcon.setAttribute("src", "${appRoot}/main_resource/plus.png");
} else if (currentPath.includes("followingFeed")) {
	heartIcon.setAttribute("src", "${appRoot}/main_resource/like2.png");
	heartIcon.setAttribute("style", "height:20px;");
} else if (currentPath.includes("newsfeed")) {
	bellIcon.setAttribute("src", "${appRoot}/main_resource/bell.png");
	bellIcon.setAttribute("style", "height:21.25px;");
} else {
	homeIcon.setAttribute("src", "${appRoot}/main_resource/home.png");
	homeIcon.setAttribute("style", "height:20px;");
}

console.log(currentPath);

</script>


</body>
</html>
