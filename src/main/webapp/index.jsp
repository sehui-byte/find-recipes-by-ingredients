<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- jstl -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<!-- jquery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지 테스트</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<style>
/*google 웹폰트 */
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@500&display=swap')
	;

/*font 적용*/
div, h1, h2, h3, h4, h5, h6, p {
	font-family: 'Noto Serif KR', serif;
}

/*콘텐츠 가운데 정렬*/
#wrapper {
	max-width: 1020px;
	margin: 0 auto;
	margin-top: 50px;
}

#navbarSupportedContent{
	max-width: 1020px;
	margin: 0 auto;
}
.carousel, .carousel-item img {
  height: 350px;
  width: auto;
  /*overflow: hidden;*/
  object-fit: cover;
  object-position: 50% 15%;

}
</style>
</head>
<body>
	<!-- navbar -->
	<%@ include file="/WEB-INF/include/jsp/header.jsp"%>


	<!-- carousel -->
	<div id="carouselExampleDark" class="carousel carousel-dark slide"
		data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleDark"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleDark"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleDark"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active" data-bs-interval="10000">
				<img src="https://cdn.pixabay.com/photo/2017/11/08/22/18/spaghetti-2931846_1280.jpg" class="d-block w-100" alt="...">
				<div class="carousel-caption d-none d-md-block">
					<h5>First slide label</h5>
					<p>Some representative placeholder content for the first slide.</p>
				</div>
			</div>
			<div class="carousel-item" data-bs-interval="2000">
				<img src="https://cdn.pixabay.com/photo/2017/09/28/18/13/bread-2796393_1280.jpg" class="d-block w-100" alt="...">
				<div class="carousel-caption d-none d-md-block">
					<h5>Second slide label</h5>
					<p>Some representative placeholder content for the second
						slide.</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="https://cdn.pixabay.com/photo/2017/03/23/19/57/asparagus-2169305_1280.jpg" class="d-block w-100" alt="...">
				<div class="carousel-caption d-none d-md-block">
					<h5>Third slide label</h5>
					<p>Some representative placeholder content for the third slide.</p>
				</div>
			</div>
		</div>
<<<<<<< HEAD
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleDark" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleDark" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>

	<!-- content -->

	<div id="wrapper">
		<h3>공지사항 관련 URL</h3>
		<ul>
			<li><a href="noticeForm.do">공지사항 글쓰기</a></li>
			<li><a href="noticeSelectAllPage.do">공지사항 목록</a></li>
		</ul>

		<hr>

		<h3>QnA 관련 URL</h3>
		<ul>
			<li><a href="qnaForm.do">QnA 글쓰기</a></li>
			<li><a href="qnaSelectAllPage.do">QnA 목록</a></li>
		</ul>

		<hr>

		<h3>레시피 관련 URL</h3>
		<ul>
			<li><a href="recipelist.do">레시피 리스트</a></li>
			<li><a href="recipeboard.do">레시피 일반 게시판</a></li>
		</ul>

		<hr>

		<h3>회원 관련 URL</h3>
		<ul>
			<li><a href="memberForm.do">회원가입</a></li>
			<li><a href="memberSelectAll.do">회원목록</a></li>

		</ul>

		<hr>
		<h3>셰프 관련 URL</h3>

		<ul>
			<li><a href="chefboard/writeForm.do">chefboard writeForm</a></li>
			<li><a href="chefboard/writeFormFile.do">chefboard writeForm
					파일</a></li>
			<li><a href="chefboard/boardselectall.do">chefboard
					boardList</a></li>
			<li><a href="chefboard/boardselectallpage.do">chefboard 페이징</a></li>
		</ul>

		<hr>

		<h3>댓글 관련 URL</h3>
		<ul>
			<li><a href="reply/reply.do">댓글 테스트</a></li>
			<li><a href="reply/rbreply.do">레시피 댓글 테스트</a></li>
		</ul>

		<hr>

		<h3>구매 관련 URL</h3>
		<ul>
			<li><a href="searchPage.do">상품 검색 페이지(최근검색어,최근본상품,관심상품등록)</a></li>
			<li><a href="likeProduct.do">관심상품 목록 보기</a></li>
			<li><a href="socketTest2">웹소켓 테스트</a></li>
		</ul>

		<hr>

		<h3>권한 & 로그인 관련 URL</h3>
		<ul>
			<li><a href="/kosmoJns/main.do">일반 접속</a></li>
			<li><a href="/kosmoJns/admin/main.do">admin 접속</a></li>
		</ul>

		<hr>

		<h3>세프 관련 URL</h3>
		<ul>
			<li><a href="/kosmoJns/chef/test.do">테스트</a></li>
		</ul>

		<hr>

		<h3>세프 관련 URL</h3>
		<ul>
			<li><a href="/kosmoJns/chef/test.do">테스트</a></li>
		</ul>

		<hr>

		<h3>구독 관련 URL</h3>
		<ul>
			<li><a href="/kosmoJns/subscribe/test.do">테스트</a></li>
		</ul>

		<h3>플라스크 테스트</h3>
		<ul>
			<li><a href="sendNutrient.do?rcp_seq=1">플라스크 테스트 - 영양소</a></li>
			<li><a
				href="sendSubscribeInc?start_yyyymm=201102&end_yyyymm=202102">플라스크
					테스트 - 월별구독자증가추이(파라미터 : 201102 ~ 202102)</a></li>
			<li><a
				href="sendSignupInc?start_yyyymm=201102&end_yyyymm=202102">플라스크
					테스트 - 월별회원가입증가추이(파라미터 : 201102 ~ 202102)</a></li>
		</ul>
	</div>
	<!-- wrapper end -->
=======
		<!-- /.container -->
	</section>
	<!-- /#home -->

	<section id="about">
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<div class="section-header">About</div>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2">

					<h3>공지사항 관련 URL</h3>
					<ul>
						<li><a href="noticeForm.do">공지사항 글쓰기</a></li>
						<li><a href="noticeSelectAllPage.do">공지사항 목록</a></li>
					</ul>

					<hr>

					<h3>QnA 관련 URL</h3>
					<ul>
						<li><a href="qnaForm.do">QnA 글쓰기</a></li>
						<li><a href="qnaSelectAllPage.do">QnA 목록</a></li>
					</ul>

					<hr>

					<h3>레시피 관련 URL</h3>
					<ul>
						<li><a href="recipelist.do">레시피 리스트</a></li>
						<li><a href="recipeboard.do">레시피 일반 게시판</a></li>
					</ul>

					<hr>

					<h3>회원 관련 URL</h3>
					<ul>
						<li><a href="memberForm.do">회원가입</a></li>
						<li><a href="memberSelectAllPage.do">회원목록</a></li>

					</ul>

					<hr>




					<h3>셰프 관련 URL</h3>

					<ul>
						<li><a href="chefboard/writeForm.do">chefboard writeForm</a></li>
						<li><a href="chefboard/writeFormFile.do">chefboard
								writeForm 파일</a></li>
						<li><a href="chefboard/boardselectall.do">chefboard
								boardList</a></li>
						<li><a href="chefboard/boardselectallpage.do">chefboard
								페이징</a></li>
					</ul>

					<hr>

					<h3>댓글 관련 URL</h3>
					<ul>
						<li><a href="reply/reply.do">댓글 테스트</a></li>
						<li><a href="reply/rbreply.do">레시피 댓글 테스트</a></li>
					</ul>

					<hr>

					<h3>구매 관련 URL</h3>
					<ul>
						<li><a href="searchPage.do">상품 검색 페이지(최근검색어,최근본상품,관심상품등록)</a></li>
						<li><a href="likeProduct.do">관심상품 목록 보기</a></li>
						<li><a href="socketTest2">웹소켓 테스트</a></li>
					</ul>

					<hr>

					<h3>권한 & 로그인 관련 URL</h3>
					<ul>
						<li><a href="/kosmoJns/main.do">일반 접속</a></li>
						<li><a href="/kosmoJns/admin/main.do">admin 접속</a></li>
					</ul>

					<hr>

					<h3>세프 관련 URL</h3>
					<ul>
						<li><a href="/kosmoJns/chef/test.do">테스트</a></li>
					</ul>

					<hr>

					<h3>세프 관련 URL</h3>
					<ul>
						<li><a href="/kosmoJns/chef/test.do">테스트</a></li>
					</ul>

					<hr>

					<h3>구독 관련 URL</h3>
					<ul>
						<li><a href="/kosmoJns/subscribe/test.do">테스트</a></li>
					</ul>

					<h3>플라스크 테스트</h3>
					<ul>
						<li><a href="sendNutrient.do?rcp_seq=1">플라스크 테스트 - 영양소</a></li>
						<li><a
							href="sendSubscribeInc?start_yyyymm=201102&end_yyyymm=202102">플라스크
								테스트 - 월별구독자증가추이(파라미터 : 201102 ~ 202102)</a></li>
						<li><a
							href="sendSignupInc?start_yyyymm=201102&end_yyyymm=202102">플라스크
								테스트 - 월별회원가입증가추이(파라미터 : 201102 ~ 202102)</a></li>
					</ul>

					<hr>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container -->
	</section>
	<!-- /#about -->

	<section id="demo">
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<div class="section-header">Demo</div>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="video-roll--container col-xs-12">
					<ul class="video-roll">
						<li><a href="https://youtu.be/kLiMpaMKal8" target="_blank"></a></li>
						<li><a href="https://youtu.be/aVFYHGtf6So" target="_blank"></a></li>
						<li><a href="https://youtu.be/OKxASY7ABfs" target="_blank"></a></li>
					</ul>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-xs-12 text-center">
					<a class="tutorials-link"
						href="https://www.youtube.com/channel/UCydykDsTWRIVnxKHW3SHPQA"
						role="button">Watch Videos</a>
					<h4>Check out my YouTube tutorials</h4>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container -->
	</section>

	<section id="features">
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<div class="section-header">Features</div>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->

			<div class="row">
				<div class="feature-container col-xs-12">
					<div class="row">
						<div
							class="feature col-xs-8 col-xs-offset-2 col-sm-4 col-sm-offset-0 text-center">
							<svg class="lnr lnr-magic-wand">
								<use xlink:href="#lnr-magic-wand"></use></svg>
							<h4>Animated Scroll</h4>
							<p>Smooth, animated scroll between navigation links</p>
						</div>
						<!-- /.feature -->

						<div
							class="feature col-xs-10 col-xs-offset-1 col-sm-4 col-sm-offset-0 text-center">
							<svg class="lnr lnr-map-marker">
								<use xlink:href="#lnr-map-marker"></use></svg>
							<h4>Page Location</h4>
							<p>Track page locations when scrolling</p>
						</div>
						<!-- /.feature -->

						<div
							class="feature col-xs-10 col-xs-offset-1 col-sm-4 col-sm-offset-0 text-center">
							<svg class="lnr lnr-bullhorn">
								<use xlink:href="#lnr-bullhorn"></use></svg>
							<h4>Focus Events</h4>
							<p>Draw user attention to navigated sections</p>
						</div>
						<!-- /.feature -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.feature-container -->

			</div>
			<!-- /.row -->
		</div>
		<!-- /.container -->

		<div class="container-fluid">
			<div class="banner row">
				<div class="banner-child bc-left col-sm-6">
					<div class="section-sub-header">Animated Scroll</div>

					<div class="animated-scroll">
						<div class="scroll-header">
							<div class="scroll-nav sn-1"></div>
							<div class="scroll-nav sn-2"></div>
							<div class="scroll-nav sn-3"></div>
							<svg class="cursor" xmlns="http://www.w3.org/2000/svg"
								xmlns:xlink="http://www.w3.org/1999/xlink"
								enable-background="new 0 0 24 24" id="Layer_1" version="1.0"
								viewBox="0 0 24 24" xml:space="preserve">
								<path d="M7,2l12,11.2l-5.8,0.5l3.3,7.3l-2.2,1l-3.2-7.4L7,18.5V2" /></svg>
						</div>
						<!-- /.scroll-header -->

						<div class="scroll-body">
							<div class="scroll-child sc-1"></div>
							<div class="scroll-child sc-2"></div>
							<div class="scroll-child sc-3"></div>
							<div class="scroll-child sc-back-to-top"></div>
						</div>
						<!-- /.scroll-body -->
					</div>
					<!-- /.animated scroll -->
				</div>
				<!-- /.banner-child -->

				<div class="banner-child bc-right col-sm-6">
					<div class="section-sub-header">Focus Events | UX</div>

					<div class="focus-events">
						<div class="scroll-header">
							<div class="scroll-nav sn-1"></div>
							<div class="scroll-nav sn-2"></div>
							<svg class="cursor" xmlns="http://www.w3.org/2000/svg"
								xmlns:xlink="http://www.w3.org/1999/xlink"
								enable-background="new 0 0 24 24" id="Layer_1" version="1.0"
								viewBox="0 0 24 24" xml:space="preserve">
								<path d="M7,2l12,11.2l-5.8,0.5l3.3,7.3l-2.2,1l-3.2-7.4L7,18.5V2" /></svg>
						</div>
						<!-- /.scroll-header -->

						<div class="scroll-body">
							<div class="scroll-child sc-1">
								<div class="header"></div>
								<div class="sub-header"></div>
								<div class="body"></div>
								<div class="body"></div>
								<div class="body"></div>
							</div>
							<div class="scroll-child sc-2">
								<div class="header"></div>
								<div class="sub-header"></div>
								<div class="body"></div>
								<div class="body"></div>
								<div class="body"></div>
							</div>
						</div>
						<!-- /.scroll-body -->
					</div>
					<!-- /.animated scroll -->
				</div>
				<!-- /.banner-child -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container-fluid -->
	</section>
	<!-- /#features -->

	<section id="howto">
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<div class="section-header">How To</div>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->

			<div class="row">
				<div class="col-xs-12">
					<div class="section-sub-header">Offest a Fixed Navbar</div>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->

			<div class="row">
				<div class="col-xs-12">
					<figure class="highlight">
						<pre>
							<code class="language-html" data-lang="html">
								<span class="nt">&lt;body</span> <span class="na">data-spy=</span><span
									class="s">"scroll"</span> <span class="na">data-target=</span><span
									class="s">"#navbar-example"</span> <span class="na">data-offset=</span><span
									class="s">"70"</span><span class="nt">&gt;</span>
  ...
<span class="nt">&lt;/body&gt;</span>
							</code>
						</pre>
					</figure>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->

			<div class="row">
				<div class="col-xs-12">
					<figure class="highlight">
						<pre>
							<code class="language-js" data-lang="js">
								<span class="nx">$</span><span class="p">(</span><span
									class="s1">'body'</span><span class="p">).</span><span
									class="nx">scrollspy</span><span class="p">({</span>
  <span class="na">offset</span><span class="p">:</span> <span
									class="s1">offsetHeight</span> <span class="c1">/*A numeric representing pixel count*/</span>
<span class="p">})</span>
							</code>
						</pre>
					</figure>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->

			<div class="row">
				<div class="col-xs-12">
					<div class="section-sub-header">Ensure last #target scrolls
						to top</div>
					<p>A common problem I see with scrollspy implementations is
						when the last navigation target doesn't navigation to the top of
						the screen. This causes issues for scrollspy as well as confusing
						the user if the target they clicked is half way down the page.</p>
					<p>The problem is simple, the document isn't long enough to
						allow it to scroll to the top.</p>

					<p>A simple solution is to dynamically add padding-bottom to
						the body via JQuery, which increases the height to the pixel
						perfect minimum. We need to do this both at render/page load and
						if the window is resized. The below code is a simplified and
						calculates the height of all sibling elements (after the target)
						to calculate</p>


				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->

			<div class="row">
				<div class="col-xs-12">
					<figure class="highlight">
						<pre>
							<code class="language-js" data-lang="js">
<span class="kd">var</span> <span class="vg">height</span> <span
									class="o">=</span> <span class="nx">$</span><span class="p">(</span><span
									class="s1">'#targetId'</span><span class="p">).</span><span
									class="nx">innerHeight</span><span class="p">(</span><span
									class="p">)</span>
<span class="kd">var</span> <span class="vg">windowHeight</span> <span
									class="o">=</span> <span class="nx">$</span><span class="p">(</span><span
									class="s1">window</span><span class="p">).</span><span
									class="nx">height</span><span class="p">(</span><span class="p">)</span>
<span class="kd">var</span> <span class="vg">navHeight</span> <span
									class="o">=</span> <span class="nx">$</span><span class="p">(</span><span
									class="s1">'nav.navbar'</span><span class="p">).</span><span
									class="nx">innerHeight</span><span class="p">(</span><span
									class="p">)</span>
<span class="kd">var</span> <span class="vg">siblingHeight</span> <span
									class="o">=</span> <span class="nx">$</span><span class="p">(</span><span
									class="s1">'#targetId'</span><span class="p">).</span><span
									class="nx">nextAll</span><span class="p">(</span><span
									class="p">).</span><span class="nx">innherHeight</span><span
									class="p">(</span><span class="p">)</span>

<span class="nx">if</span><span class="p">(</span><span class="nx">height </span><span
									class="nx">&lt;</span><span class="nx"> windowHeight</span><span
									class="p">)</span><span class="p">(</span><span class="p">{</span>
  <span class="nx">$</span><span class="p">(</span><span class="s1">'body'</span><span
									class="p">).</span><span class="nx">css</span><span class="p">(</span><span
									class="na">"padding-bottom"</span><span class="p">,</span> <span
									class="nx">windowHeight</span><span class="p">-</span><span
									class="nx">navHeight</span><span class="p">-</span><span
									class="nx">height</span><span class="p">-</span><span
									class="nx">siblingHeight</span> <span class="p">+</span> <span
									class="p">"</span><span class="s1">px</span><span class="p">"</span><span
									class="p">)</span>
<span class="p">}</span>	
</code>
						</pre>
					</figure>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container -->
	</section>
	<footer>
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<h4>This is a footer</h4>
				</div>
			</div>
		</div>
	</footer>
	<a href="#home" role="button" class="scrollTop"> <svg
			class="lnr lnr-chevron-up">
			<use xlink:href="#lnr-chevron-up"></use></svg>
	</a>
>>>>>>> f765178814c6f02212bf1a94eb28e73afeaf1355

</body>
</html>