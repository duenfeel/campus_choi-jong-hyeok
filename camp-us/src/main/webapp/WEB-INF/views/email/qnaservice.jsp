<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl core 쓸때 태그에 c 로 표시. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp"%>
<!-- jstl fmt 쓸때 위와 같음. fmt : formatter 형식 맞춰서 표시 -->

<!-- my page 전체 수정 예정 기존 home.jsp 에 드롭박스로 추가 예정-->

<!DOCTYPE html>
<html lang="en">
<head>
<title>QnA</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

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
<script src="/resources/js/jquery-3.3.1.min.js"></script>
<script src="/resources/js/jquery-ui.js"></script>
<script src="/resources/js/popper.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script src="/resources/js/owl.carousel.min.js"></script>
<script src="/resources/js/jquery.magnific-popup.min.js"></script>

<style>
.checkbox {
	width: 20px; /*Desired width*/
	height: 20px; /*Desired height*/
	cursor: pointer;
}
</style>
<div class="container">
	<div class="row justify-content-center ">
		<div class="col-lg-12 site-section-heading text-center pt-4">
			<h2>QnA</h2>
			<div class="form-group row">
				<label class="control-label col-3"><span
					style="font: italic bold 0.7em/1em Verdana, Geneva, Arial, sans-serif;">문의
						유형:</span></label>
				<div class="col-5">
					<select class="form-control" id="qnatype" name="qnatype">
						<option value="">문의유형 선택</option>
						<option value="">교환</option>
						<option value="">환불</option>
						<option value="">취소(출하 전 취소)</option>
						<option value="">배송</option>
						<option value="">A/S</option>
						<option value="">주문/결제</option>
						<option value="">회원 관련</option>
						<option value="">기타 문의</option>
						<option value="">신고</option>
						<option value="">기능/작동 오류</option>
						<option value="">이벤트</option>
						<option value="">스냅문의</option>
					</select>
				</div>
			</div>

			<div class="form-group row">
				<label class="control-label col-3"> <span
					style="font: italic bold 0.7em/1em Verdana, Geneva, Arial, sans-serif;">주문번호
						: </span></label>
				<div class="col-3">
					<input type="text" class="form-control" id="itemcode"
						name="itemcode" value="">
				</div>
				<div class="col-1">
					<a type="submit" class="btn btn-warning" value="조회">조회</a>
				</div>
			</div>

			<div class="form-group row">
				<label class="control-label col-3"> <span
					style="font: italic bold 0.7em/1em Verdana, Geneva, Arial, sans-serif;">작성자
						: </span></label>
				<div class="col-5">
					<input type="text" class="form-control" id="userid" name="userid"
						value="${userid }">
				</div>
			</div>

			<div class="form-group row">
				<label class="control-label col-3"> <span
					style="font: italic bold 0.7em/1em Verdana, Geneva, Arial, sans-serif;">휴대전화
						: </span></label>
				<div class="col-5">
					<input type="text" class="form-control" id="contact" name="contact"
						value="${member.contact }">
				</div>
			</div>

			<div class="form-group row">
				<label class="control-label col-3"> <span
					style="font: italic bold 0.7em/1em Verdana, Geneva, Arial, sans-serif;">이메일
						: </span></label>
				<div class="col-5">
					<input type="text" class="form-control" id="email" name="email"
						value="${member.email }">
				</div>
			</div>

			<div class="form-group row">
				<label class="control-label col-3"> <span
					style="font: italic bold 0.7em/1em Verdana, Geneva, Arial, sans-serif;">제목
						: </span></label>
				<div class="col-5">
					<input type="text" class="form-control" id="title" name="title"
						placeholder="제목을 입력해주세요.">
				</div>
			</div>


			<div class="form-group row">
				<label class="control-label col-3"> <span
					style="font: italic bold 0.7em/1em Verdana, Geneva, Arial, sans-serif;">내용
						: </span></label>
				<div class="col-5">
					<textarea type="text" placeholder="내용을 입력해주세요."
						class="form-control" id="contents" name="contents"
						value="내용을 입력해주세요"></textarea>
				</div>
			</div>

			<div class="form-group row">
				<label class="control-label col-3"> <span
					style="font: italic bold 0.7em/1em Verdana, Geneva, Arial, sans-serif;">사진:
				</span></label>
				<div class="col-5">
					<button type="button" class="btn btn-warning">파일 선택</button>
				</div>
			</div>
			
			<button type="button" vlaue="취소" class="btn">취소</button> 
			<button type="button" vlaue="취소" class="btn btn-warning">작성하기</button> 


			<br>
		</div>
	</div>
</div>








</head>
</html>

<%@ include file="../includes/footer.jsp"%>