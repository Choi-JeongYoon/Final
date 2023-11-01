<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../include/header.jsp"%>
<style>
.btn {
	display: flex;
	justify-content: center;
}
</style>
<main>
	<h2>상품가격 등록</h2>
	<form action="priceNew" method="post" id="uploadForm"
		enctype="multipart/form-data">
		<input type="hidden" name="pnum" value="${pnum}">
		<table class="table table-sm table-bordered">
			<tr>
				<th>가격입력</th>
				<td><input type="text" size="120" maxlength="30" name="price"
					id="price" placeholder="가격입력"></td>
			</tr>
			<tr>
				<th>판매되는페이지 입력</th>
				<td><input type="text" size="120" maxlength="30" name="picompa"
					id="picompa" placeholder="판매페이지 입력"></td>
			</tr>
		</table>

		<div class="btn">
			<button type="submit" class="btn btn-success">가격등록</button>
			&nbsp;
			<button type="reset" class="btn btn-secondary">다시입력</button>
		</div>

	</form>
</main>
<%@ include file="../include/footer.jsp"%>