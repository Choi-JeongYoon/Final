<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../include/header.jsp"%>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<main>
	<h2>상품 등록</h2>
<form action="productNew" method="post" id="uploadForm"
		enctype="multipart/form-data">
		
	<c:if test="${sessionScope.role=='ADMIN'}">
		<div class="btn">
			<img class="topproducimg1" alt="상품 등록"
				src="/resources/img/istockphoto-1193039142-170x170-removebg-preview.png">
		<button type="submit" class="snip1535">	상품 등록</button>
			&nbsp; 
			<img class="topproducimg1" alt="원래 대로"
				src="/resources/img/settings_options_configuration_setting_system_icon_196481.png">
			<button type="reset" class="snip1535">다시 입력</button>
		</div>
	</c:if>
	
		<table class="table table-sm table-bordered">
			<tr>
				<td><label for="mCate">메인카테고리</label> <select name="ptype1"
					id="mCate" onchange="subCateChange()">
						<c:forEach items="${mCate}" var="m">
							<option value="${m.ptype1}">${m.ptype1}</option>
						</c:forEach>
				</select></td>
				<td><label for="sCate">서브카테고리</label> <select name="ptype2"
					id="sCate">
				</select>

					<div style="display: none">

						<c:forEach items="${sCate}" var="s">
							<div class="item${s.ptype1} ${s.ptype2}">${s.ptype2}:${s.ptype1}</div>
						</c:forEach>
					</div></td>
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
						<label for="file" class="col-sm-2 col-form-label"></label>
						<!-- 파일첨부 -->
						<div class="col-sm-10">
							<input type="file" name="uploadFile" id="pimg1" accept="image/*"
								onchange="uploadFileCheck()" multiple> <small
								class="text-muted">(파일크기 : 20MB / 이미지 파일만 가능)</small> <small
								id="file" class="text-info"></small><br> <input type="file"
								name="uploadFile" id="pimg2" accept="image/*"
								onchange="uploadFileCheck()" multiple> <small
								class="text-muted">(파일크기 : 20MB / 이미지 파일만 가능)</small> <small
								id="file" class="text-info"></small><br>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<th>상품내용</th>
				<td><textarea class="contentnew" name="pcontent" id="pcontent"
						cols="119" rows="10" maxlength="2000"></textarea></td>
			</tr>

		</table>

	</form>
</main>
<script type="text/javascript">


	$( document ).ready(function() {
	    console.log( "ready!" );
	    
	    subCateChange();
	});

	function subCateChange(){
		
		console.log($("#mCate").val());
		
		var selected = $("#mCate").val();// 선택한 값
		
		var opt = $(".item"+selected);
	
		
		var j;
		var html="";
		
		for(i of opt){
			j = $(i).html().split(":");
			
			
			html += '<option value="'+j[0]+'">'+j[0]+'</option>';
		}
		
		$("#sCate").html(html);
		
	}
</script>
<%@ include file="../include/footer.jsp"%>