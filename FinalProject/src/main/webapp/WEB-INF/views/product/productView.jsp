<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp"%>

<style>
.btn_rud {
	display: flex;
	gap: 5px;
	justify-content: center;
}

th {
	width: 100px;
}

td {
	text-align: left;
}
</style>
<main>

	<div class="btn_rud">

		<button type="button"
			onclick="location.href='productList?pageNum=${cri.pageNum}&searchword=${cri.searchword}&searchtype=${cri.searchtype}'"
			class="btn btn-success">
			<img class="topproducimg3" alt="전체 목록"
				src="/resources/img/hamburger_menu_navbar_options_icon_196495.png">
		</button>

		<c:if test="${sessionScope.role=='ADMIN'}">
			<img class="topproducimg1" alt="가격 등록"
				src="/resources/img/special_price_discount_icon_134617.png">
			<a href="priceList?pnum=${product.pnum}"><button type="button"
					class="snip1535">가격 등록</button></a>
		</c:if>

		<c:if test="${sessionScope.role=='ADMIN'}">
			<img class="topproducimg1" alt="상품 수정"
				src="/resources/img/edit_clear_all_icon_180807.png">
			<button type="button" class="snip1535" id="btnEdit"
				onclick="productEdit()">상품 수정</button>

			<img class="topproducimg1" alt="상품 등록"
				src="/resources/img/bin_trash_rubbish_dustbin_remove_icon_196490.png">
			<button type="button" class="snip1535" id="btnDelete"
				onclick="productDelete()">상품 삭제</button>

			<img class="topproducimg1" alt="상품 저장"
				src="/resources/img/savetheapplication_guardar_2958.png">
			<button type="submit" class="snip1535" id="btnSave"
				onclick="productSave()">상품 저장</button>

			<img class="topproducimg1" alt="원래 대로"
				src="/resources/img/settings_options_configuration_setting_system_icon_196481.png">
			<button type="reset" class="snip1535" id="btnCancle"
				onclick="productCancle()">다시 입력</button>
		</c:if>
	</div>
	<br>

	<form action="productUpdate" method="post"
		enctype="multipart/form-data" id="uploadForm" name="uploadForm">
		<input type="hidden" value="${product.pnum}" name="pnum" id="pnum">
		<input type="hidden" value="${product.filename}" name="filename">
		<input type="hidden" value="${cri.pageNum}" name="pageNum"> <input
			type="hidden" value="${cri.searchtype}" name="searchtype"> <input
			type="hidden" value="${cri.searchword}" name="searchword">
		<table class="table table-sm table-bordered">

			<tr>
				<th>상품제목</th>
				<td class="disp">${product.pname}</td>
				<td class="edit" style="display: none;"><input type="text"
					size="120" maxlength="50" name="pname" id="pname"
					value="${product.pname}" placeholder="상품명입력" required></td>
			</tr>
			<tr>
				<th>제조회사명</th>
				<td class="disp">${product.pcompa}</td>
				<td class="edit" style="display: none;"><input type="text"
					size="120" maxlength="30" name="pcompa" id="pcompa"
					value="${product.pcompa}" placeholder="제조회사명입력"></td>
			</tr>

			<tr>
				<th>상품 이미지</th>
				<td class="disp"><c:if test="${product.pimg1!=null}">
						<img src="imgDown?filename=${product.pimg1}">
					</c:if> <c:if test="${product.pimg2!=null}">
						<img src="imgDown?filename=${product.pimg2}">
					</c:if></td>
				<td class="edit" style="display: none;">
					<div>
						<c:if test="${product.pimg1!=null}">
							 ${originFilename} <!-- 기존 파일명 : -->
						</c:if>
						<c:if test="${product.pimg2!=null}">
							${originFilename}	<!-- 기존 파일명 :  -->
						</c:if>
					</div> <br>

					<div class="form-group row">
						<c:if test="${sessionScope.role=='ADMIN'}">
							<label for="file" class="col-sm-2 col-form-label"></label>
							<!-- 파일첨부 -->
							<div class="col-sm-10">
								<input type="file" name="uploadFile" id="pimg1" accept="image/*"
									onchange="uploadFileCheck()" multiple> <small
									class="text-muted">(파일크기 : 10MB / 이미지 파일만 가능)</small> <small
									id="file" class="text-info"></small><br> <input
									type="file" name="uploadFile" id="pimg2" accept="image/*"
									onchange="uploadFileCheck()" multiple> <small
									class="text-muted">(파일크기 : 10MB / 이미지 파일만 가능)</small> <small
									id="file" class="text-info"></small><br>
							</div>
						</c:if>
					</div>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td class="disp">${repContent}</td>
				<td class="edit" style="display: none;"><input type="text"
					size="120" maxlength="2000" name="pcontent"
					value="${product.pcontent}" id="pcontent" placeholder="내용">

				</td>
			</tr>

		</table>
	</form>
	<table class="table table-sm table-bordered">
		<tr>
			<th>가격</th>
			<th>판매페이지</th>
		</tr>
		<c:forEach items="${list1}" var="price" varStatus="sts">

			<tr>
				<td>${price.price}</td>
				<td>${price.picompa}</td>
			</tr>

		</c:forEach>
	</table>

</main>
<script type="text/javascript">
	/*=============================================
	 * 상품수정버튼은 클릭했을때
	 *=============================================*/
	function productEdit() {
		$(".useitem").css("display", "none");
		$(".edit").css("display", "block");
		//버튼
		$("#btnEdit").css("display", "none");
		$("#btnDelete").css("display", "none");
		$("#btnSave").css("display", "block");
		$("#btnCancle").css("display", "block");

	}
	//상품 삭제
	function productDelete() {
		if (confirm("상품삭제를 수행 하시겠습니까?")) {
			location.href = "deleteProduct?pnum=${product.pnum}";
		}
	}
	//상품저장
	function productSave() {
		//document.querySelector("#uploadForm")// 폼태그의 요소가져오기 
		document.querySelector("#uploadForm").submit();
	}
	function productCancle() {
		$(".useitem").css("display", "block");
		$(".edit").css("display", "none");
		//버튼
		$("#btnEdit").css("display", "block");
		$("#btnDelete").css("display", "block");
		$("#btnSave").css("display", "none");
		$("#btnCancle").css("display", "none");
	}
</script>

<%@ include file="../include/footer.jsp"%>