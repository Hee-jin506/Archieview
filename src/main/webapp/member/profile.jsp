<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>2단 레이아웃</title>
      <style>
    div {
      border: 1px solid #ccc; /* 모든 영역에 테두리 표시 */
    }
    #container {
      width:960px; /* 컨테이너 너비 */
      padding:20px; /* 패딩 */      
      margin:0 auto;  /* 화면 중앙에 배치 */
    }
    #header {
      position: absolute;
      top:0px;
      left:0px;
      width: 100%;
    }
    #header #inner {
      width:960px;
      padding:20px;
      margin:0 auto;
    }
    #contents {
      width: 620px;  /* 너비 */
      padding: 20px;  /* 패딩 */
      float: left;  /* 왼쪽으로 플로팅 */
      margin-bottom: 20px;  /* 아래 요소와의 간격 */
    }
    #sidebar {
      width: 220px;  /* 너비 */
      padding: 20px;  /* 패딩 */
      float: right;  /* 오른쪽으로 플로팅 */
      margin-bottom: 20px;  /* 아래 요소와의 간격 */
      background:#eee;
    }
    #footer {
      clear:both;  /* 양쪽 플로팅 해제 */
      padding:20px;  /* 패딩 */
    }
  </style>
</head>

<body>
  <div id="header">
    <div id="inner">
      <h1>사이트 제목</h1>
    </div>  
  </div>

    <div id="container">
        
    <div id="sidebar">
      <h2>사이드 바</h2>
            <ul>
                <li>모든 국민은 근로의 의무를 진다. 국가는 근로의 의무의 내용과 조건을 민주주의원칙에 따라 법률로 정한다.</li>

            </ul>
    </div>
    <div id="contents">
      <h2>본문</h2>
            <p>재산권의 행사는 공공복리에 적합하도록 하여야 한다. 정부는 회계연도마다 예산안을 편성하여 회계연도 개시 90일전까지 국회에 제출하고, 국회는 회계연도 개시 30일전까지 이를 의결하여야 한다.</p>

            <p>대통령의 임기가 만료되는 때에는 임기만료 70일 내지 40일전에 후임자를 선거한다. 제2항과 제3항의 처분에 대하여는 법원에 제소할 수 없다. 언론·출판에 대한 허가나 검열과 집회·결사에 대한 허가는 인정되지 아니한다.</p>
    </div>
    <div id="footer">
      <h2>푸터</h2>
            <p>이 헌법시행 당시의 법령과 조약은 이 헌법에 위배되지 아니하는 한 그 효력을 지속한다.</p>
    </div>
    </div>
</body>
</html>