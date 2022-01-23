<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl core 쓸때 태그에 c 로 표시. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
</head>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Mukta:300,400,700">
<link rel="stylesheet" href="/resources/fonts/icomoon/style.css">

<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/magnific-popup.css">
<link rel="stylesheet" href="/resources/css/jquery-ui.css">
<link rel="stylesheet" href="/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="/resources/css/owl.theme.default.min.css">


<link rel="stylesheet" href="/resources/css/aos.css">

<link rel="stylesheet" href="/resources/css/style.css">
<body>


	<input type="hidden" id="cnt" name="cnt" value="1000">
	<!-- 화면에는 보이지는 않음(내부에만 보이는것) 데이터베이스를 가져와서 총 건수를 알아올때 -->

	<div class="site-wrap">
		<header class="site-navbar" role="banner">
			<div class="site-navbar-top">
				<div class="container">
					<div class="row align-items-center">

						<div
							class="col-6 col-md-4 order-2 order-md-1 site-search-icon text-left">
							<form action="/common/search" class="site-block-top-search">

								<input type="text" class="form-control border-0"
									placeholder="Search"> <span class="icon icon-search2"></span>
								<div id="pager"></div>
								<!-- 서치 페이징 부분 -->
							</form>
						</div>

						<div
							class="col-12 mb-3 mb-md-0 col-md-4 order-1 order-md-2 text-center">
							<div class="site-logo">
								<a href="/" class="js-logo-clone">CAMP-US</a>
							</div>
						</div>

						<div class="col-6 col-md-4 order-3 order-md-3 text-right">
							<div class="site-top-icons">
								<ul>
									<li class="nav-item dropdown no-arrow"><a
										class="nav-link dropdown-toggle" href="#" id="userDropdown"
										role="button" data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false"> <!-- 정상로그인. --> <sec:authorize
												access="isAuthenticated()">
												<span class="mr-2 d-none d-lg-inline text-gray-600 small">
													<sec:authentication property="principal.username" />
												</span>
											</sec:authorize> <sec:authorize access="isAnonymous()">
												<!-- 익명 -->
												<i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>

											</sec:authorize> <span class="icon icon-person"></span>

									</a> <!-- Dropdown - User Information -->
										<div
											class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
											aria-labelledby="userDropdown">
											<c:if test="${userid eq  '' }">
												<a class="dropdown-item"><i
													class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>로그인을
													해주세요.</a>
												<a class="dropdown-item" href="/member/login"> <i
													class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400">
												</i> Login
												</a>
											</c:if>

											<c:if test="${userid != '' }">
												<a class="dropdown-item" href="/member/profile"> <i
													class="fas fa-user fa-sm fa-fw mr-2 text-gray-400">
														Edit Profile </i>
												</a>
												<a class="dropdown-item" href="#"> <i
													class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"> My
														Shopping</i>
												</a>
												<a class="dropdown-item" href="#"> <i
													class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"> My
														Community </i>
												</a>
												
												<a class="dropdown-item" href="/admin/member/list"> <i
												     class="fas fa-user fa-sm fa-fw mr-2 text-gray-400">
												     AdminPage
												     </i></a>


												<form id="frmlogout" role="form" method="post"
													action="/logout">
													- <a class="dropdown-item" href="member/logout" id="logout"
														name="logout" data-toggle="modal"> <i
														class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400">로그아웃</i>

														<input type="hidden" name="${_csrf.parameterName }"
														value="${_csrf.token}" />
													</a>
												</form>
											</c:if>



										</div></li>
										
										<li><nav class="site-navigation text-right text-md-center" role="navigation">
										<div class="container">
										<ul class="site-menu js-clone-nav d-none d-md-block">
										<li class="has-children active">
										<span class="icon-comment" title="커뮤니티"></span></a>
										<ul class="dropdown">
										<li><a href="/email/qnaservice" title="QnA">QnA</a></li>
										<li><a href="/email/communityservice" title="게시판">게시판</a></li>
										<li><a href="/email/faqservice" title="FaQ">FaQ</a></li>
										<li><a href="/email/customerservice" title="고객의 소리">고객의 소리</a></li>
										</ul>
										</li> 
										</ul>
										</div>
										</nav></li>

									<!-- <li><a href="/email/qnaservice" id="qna"><span
											class="icon-comment" title="QnA"></span></a></li> -->

									<li><a href="/user/wishlist"><span
											class="icon icon-heart-o" title="찜목록"></span></a></li>

									<li><a href="/user/cart"><span
											class="icon icon-shopping_cart" title="장바구니"></span></a></li>
									<li><a href="/resources/cart.html" class="site-cart" >
											<!-- 
                      <span class="icon icon-shopping_cart"></span>
                      <span class="count">2</span> -->
									</a></li>
								</ul>
							</div>
						</div>

					</div>
				</div>
			</div>


			<nav class="site-navigation text-right text-md-center"
				role="navigation">
				<div class="container">
					<ul class="site-menu js-clone-nav d-none d-md-block">
						<li class="categoryBtn"><a href="camping">CAMPING</a> <!-- <ul class="dropdown">
								<li><a href="#">Menu One</a></li>
								<li><a href="#">Menu Two</a></li>
								<li><a href="#">Menu Three</a></li>
								<li class="has-children"><a href="#">Sub Menu</a>
									<ul class="dropdown">
										<li><a href="#">Menu One</a></li>
										<li><a href="#">Menu Two</a></li>
										<li><a href="#">Menu Three</a></li>
									</ul></li>
							</ul> --></li>
						<li class="categoryBtn"><a href="backpacking">BACKPACKING</a>
							<!-- <ul class="dropdown">
								<li><a href="#">Menu One</a></li>
								<li><a href="#">Menu Two</a></li>
								<li><a href="#">Menu Three</a></li>
							</ul> --></li>
						<li class="categoryBtn"><a href="picnic">PICNIC</a></li>
						<li><a href="/shop/newList">NEW</a></li>
						<li><a href="/community/list">COMMUNITY</a></li>
						<li><a href="/common/contact">Contact</a></li>
					</ul>
				</div>

				<form id="actionForm" action="/shop/itemList" method="get">
					<input type="hidden" name="pageNum"
						value="${pageMaker.cri.pageNum}"> <input type="hidden"
						name="amount" value="${pageMaker.cri.amount}"> <input
						type="hidden" name="category" value="${pageMaker.cri.category}">
				</form>

			</nav>
		</header>

		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<script type="text/javascript">
		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";
			$(document).ready(
					function() {
						/* //.icon-search2")
						$(document).on("click", ".icon-search2", function() {
							alert("00")
							window.location.href = "search.jsp"
						}) //  getPager() */

						var actionForm = $("#actionForm");

						//카테고리 버튼 클릭 이벤트
						$(".categoryBtn a").on(
								"click",
								function(e) {
									e.preventDefault();
									console.log("clicked");
									actionForm.find("input[name='category']")
											.val($(this).attr("href"));
									actionForm.find("input[name='pageNum']")
											.val(1);
									actionForm.find("input[name='amount']")
											.val(12);
									actionForm.append($(this).attr("active"));
									actionForm.submit();
								});

						//로그아웃 스크립트
						$(document).on("click", "#logout", function(e) {
							e.preventDefault();
							var ret = confirm("정말로 로그아웃 하시겠습니까?");
							// 확인 버튼 클릭시 
							if (ret) {
								$("#frmlogout").submit();
							}
							//

							//alert("로그아웃을 하시겠습니까?")
						});
						/* comment 로그인을 하지 않았을 경우 로그인 페이지로 넘어가기 */
						/* $(document).on("click","#qna", function(e) {
							e.preventDefault();
							alert("로그인을 해주세요")
							window.location.href ="/email/qnaservice"
						}); */
						/* comment 로그인을 하지 않았을 경우 로그인 페이지로 넘어가기 */
					}); //document ready function end
		</script>