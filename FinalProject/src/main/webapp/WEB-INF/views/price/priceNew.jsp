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
		<table class="table table-sm table-bordered">
			<tr>
				<th>제조회사</th>
				<td><input type="text" size="120" maxlength="30" name="picompa"
					id="pcompa" placeholder="제조회사명입력"></td>
			</tr>
			<tr>
				<th>상품가격</th>
				<td><input type="text" size="120" maxlength="30" name="price"
					id="price" placeholder="상품가격 입력"></td>
			</tr>
			<tr>
				<th>상품 판매 페이지</th>
				<td><input type="text" size="120" maxlength="30" name="pipage"
					id="pipage" placeholder="상품판매 페이지 입력"></td>
			</tr>
		</table>
		<c:if test="${sessionScope.role=='ADMIN'}">
			<div class="btn">
				<button type="submit" class="btn btn-success">가격등록</button>
				&nbsp;
				<button type="reset" class="btn btn-secondary">다시입력</button>
			</div>
		</c:if>
	</form>
</main>
<%@ include file="../include/footer.jsp"%>