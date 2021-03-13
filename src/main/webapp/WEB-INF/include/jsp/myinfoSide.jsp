<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>     

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css">
<style type="text/css">
	/*google 웹폰트 */
	@import url('https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@500&display=swap');
	
	div, h1, h2, h3, h4, h5, h6, p {
	   font-family: 'Noto Serif KR', serif;
	}

	/* 사이드바 스타일 */
	.sidenav {
		height:100%;
		width: 0;
		position: fixed;
		z-index:1;
		top: 0;
		left: 0;
		background-color: #FDE3D7;
		overflow-x: hidden;
		transition:0.5s ease-in-out;
		padding-top: 60px;
	}
	.sidenav a {		
		/*padding: 8px 8px 8px 32px;*/
		text-decoration: none;
		font-size: 16px;
		color: black;
		display: block;
		transition: 0.2s ease-in-out;
	}
	.sidenav a:hover, .offcanvas a:focus {
		color: #F9A781;
	}
	.closebtn {
		position: absolute;
		top: 0;
		right: 25px;
		font-size: 20px !important;
		margin-left: 50px;
	}
	.openmenu:hover {
		color:rgb(0,154,200);
		transition:0.5s ease-in-out;
	}
	.openmenu {
		font-size: 25px;
		cursor:pointer;
		transition:0.5s ease-in-out;
	}
	.openmenu > i {
		font-size: 20px;
	}
	/* 미디어쿼리 적용 */
	@media screen and (max-height:450px) {
		.sidenav {
			padding-top:15px;
		}
		.sidenav a {
			font-size: 18px;
		}
	}
		
	.section-header {
		position: relative;
		margin-bottom: 40px;
		font-size: 26px;
		font-weight: 400;
		color: #333;
		text-align: Center;
		line-height: 60px;
		letter-spacing: 1px;
	}
	
	.section-header:after {
		content: "";
		display: block;
		position: absolute;
		left: 50%;
		bottom: 0;
		width: 70px;
		height: 2px;
		background: #ff7f00;
		transform: translate(-50%, 0);
		transform: translate3d(-50%, 0, 0);
	}
	
	.panel-heading{
		padding: 15px 0px 0px 5px;
	}
</style>
<script type="text/javascript">
</script>
<title>Insert title here</title>
</head>
<body>
<%
	String mno = "";
	mno = request.getParameter("mno");
	System.out.println("mno >>> : " + mno);

%>
<div>
<!-- side bar  -->
    <span class="openmenu" onclick='openNav()'><i class="fa fa-angle-double-left fa-5" aria-hidden="true"></i> 메뉴 Open</span>
	<div id="myinfosidenav" class="sidenav" >
		<ul class="nav flex-column">
		  <li class="nav-item">
            <a href="#" class="closebtn" onclick='closeNav()'><i class="bi bi-x-square"></i></a>
          </li>	
          <li class="nav-item">
            <a class="nav-link" href="/kosmoJns/myinfo?mno=<%= mno %>">
              <i class="bi bi-house-door-fill"></i>
              Main
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/kosmoJns/myinfo/updateMyPW">
              <i class="bi bi-arrow-repeat"></i>
              비밀번호 수정
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/kosmoJns/myinfo/myRecipeListPage?mno=<%= mno %>">
              <i class="bi bi-back"></i>
              내가 쓴 레시피 조회
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/kosmoJns/myinfo/mySubList?mno=<%= mno %>">
              <i class="bi bi-heart-fill"></i>
              내가 구독한 셰프 조회
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/kosmoJns/myinfo/myQnAList?mno=<%= mno %>">
              <i class="bi bi-question-circle"></i>
              내 Q&A
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/kosmoJns/myinfo/myFavRecipeList?mno=<%= mno %>">
              <i class="bi bi-cursor"></i>
              내 추천(레시피)
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/kosmoJns/myinfo/myFavReciepBoardList?mno=<%=mno%>">
              <i class="bi bi-cursor-fill"></i>
              내 추천(유저)
            </a>
          </li>
        </ul>		
	</div>
</div>		
</body>
</html>