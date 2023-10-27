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
	<h2>상품 등록</h2>
	<form action="productNew" method="post" id="uploadForm"
		enctype="multipart/form-data">
		<table class="table table-sm table-bordered">
		 <label>ptype1</label>
 <select class="category1">
  <option value="">전체</option>
 </select>
 
 <label>ptype2</label>
 <select class="category2">
  <option value="">전체</option>
 </select>
 <tr>
				<th>상품명</th>
				<td><input type="text" size="120" maxlength="50" name="ptype1"
					id="ptype1" placeholder="카테고리1" required></td>
			</tr>
			<tr>
				<th>상품명</th>
				<td><input type="text" size="120" maxlength="50" name="pname"
					id="pname" placeholder="상품명입력" required></td>
			</tr>
			<tr>
				<th>제조회사</th>
				<td><input type="text" size="120" maxlength="30" name="pcompa"
					id="pcompa" placeholder="제조회사명입력"></td>
			</tr>
			<tr>
				<th>상품 이미지</th>
				<td>
					<div class="form-group row">
						<label for="file" class="col-sm-2 col-form-label"></label>  <!-- 파일첨부 -->
						<div class="col-sm-10">
							<input type="file" name="uploadFile" id="pimg1" accept="image/*"
								onchange="uploadFileCheck()" multiple> <small class="text-muted">(파일크기
								: 20MB / 이미지 파일만 가능)</small> <small id="file" class="text-info"></small><br>
							<input type="file" name="uploadFile" id="pimg2" accept="image/*"
							onchange="uploadFileCheck()" multiple> <small class="text-muted">(파일크기
							: 20MB / 이미지 파일만 가능)</small> <small id="file" class="text-info"></small><br>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<th>상품내용</th>
				<td><textarea name="pcontent" id="pcontent" cols="119"
						rows="10" maxlength="2000"></textarea></td>
			</tr>
			
		</table>
		<c:if test="${sessionScope.role=='ADMIN'}">
			<div class="btn">
				<button type="submit" class="btn btn-success">상품등록</button>
				&nbsp;
				<button type="reset" class="btn btn-secondary">다시입력</button>
			</div>
		</c:if>
	</form>
</main>
<%@ include file="../include/footer.jsp"%>