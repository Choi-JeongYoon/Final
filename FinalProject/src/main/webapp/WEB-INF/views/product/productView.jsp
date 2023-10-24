<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<h2>상품 상세</h2>
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
				<th>내용</th>
				<td class="disp">${product.pcontent}</td>
				<td class="edit" style="display: none;"><input type="text"
					size="120" maxlength="30" name="pcontent"
					value="${product.pcontent}" id="pcontent" placeholder="내용">
				</td>
			</tr>
			<tr>
				<th>상품 이미지</th>
				<td class="disp"><c:if test="${product.pimg1!=null}">
						<img src="imgDown?pimg1=${product.pimg1}" alt=""
							height="300px">
					</c:if></td>
				<td class="edit" style="display: none;">
					<div>
						<c:if test="${product.pimg1!=null}">
							기존 파일명 : ${psaving}
						</c:if>
					</div>
					<br>
					<div class="form-group row">
						<label for="file" class="col-sm-2 col-form-label">파일첨부</label>
						<div class="col-sm-10">
							<input type="file" name="uploadFile" id="uploadFile"
								accept="image/*" onchange="uploadFileCheck()"> <small
								class="text-muted">(파일크기 : 2MB / 이미지 파일만 가능)</small> <small
								id="file" class="text-info"></small>
						</div>
					</div>
				</td>
			</tr>


		</table>
		<div class="btn_rud">
			<button type="button" id="btnList"
				onclick="location.href='productList?pageNum=${cri.pageNum}&searchword=${cri.searchword}&searchtype=${cri.searchtype}'"
				class="btn btn-success">상품목록</button>
			<c:if test="${sessionScope.role=='ADMIN'}">
				<button type="button" id="btnEdit" onclick="productEdit()"
					class="btn btn-warning">상품수정</button>
				<button type="button" id="btnDelete" onclick="productDelete()"
					class="btn btn-danger">상품삭제</button>
				<button type="submit" id="btnSave" onclick="productSave()"
					class="btn btn-primary" style="display: none;">상품저장</button>
				<button type="reset" id="btnCancle" onclick="productCancle()"
					class="btn btn-info" style="display: none;">수정취소</button>
			</c:if>
		</div>
	</form>
	<br> <br> <input type="hidden" name="page" id="page"
		value="0">
	<table id="tbl_star">

	</table>
	<button type="button" id="btn_next" style="display: none"
		onclick="getStar()">더보기</button>
</main>
<script type="text/javascript">
/*=============================================
* ready fun 호출

$(document).ready(function(){
	$("#page").val(0);
	getStar();
});


/*=============================================
*	댓글 가져오기 수행 ajax : doAjax(url, param, callback)
*	- 보내는 데이터 : bno, page
*	- 받아오는 데이터 : json(더보기 버튼 활성화 여부,출력할 데이터(배열))	

function getStar(){
		let url="getStar";
		let param={"pno":$("#pno").val(),
				   "page":$("#page").val()*1+1
				   };
		//증가한 페이지를 적용
		$("#page").val($("#page").val()*1+1);
		console.log(param);
		doAjax(url, param, getStarAfter);
}
/*=============================================
*	댓글 가져오기 수행 후 해야 할 일
*	- 받아오는 데이터 : json를 table 태그 내에 출력	
*=============================================*/
*/*=============================================

function getStarAfter(data){
	console.log("getStarAfter");	
	if(data=="err"){
 		// 표시할 자료 없음
 	}else{
	 		console.log(data);	 
	 		//data 배열에 있는 값을 tbl_star 에 html 태그로 조립해서 출력 
	 		let starList=data.arr;
	 		console.log(starList);
	 		let html="";
	 		for(let vo of starList){//js foreach
	 			html+='<tr>';
	 			html+='<td>';
	 			html+='<input id="score" name="score" value='+vo.score+' class="rating rating-loading" data-size="sm" readonly="readonly">';
	 			html+='</td>';
	 			html+='<td>'+vo.id+' 님 : '+vo.cmt+'</td>';
	 			html+='</tr>';	 			
	 		}//for
	 		$("#tbl_star").append(html);
	 		//let next=data.next;//true, false
	 		//console.log(next);
	 		if(data.next){//더보기 버튼을 보여주기
	 			$("#btn_next").css("display","block");
	 		}else $("#btn_next").css("display","none");
	 		// loding 중인 별점을 보여주는 작업
	 		newStar();
 	}
}



	//$(".disp") : 제이쿼리
/*=============================================
* 상품수정버튼은 클릭했을때
*=============================================*/	
	function productEdit(){
		$(".useitem").css("display","none");
		$(".edit").css("display","block");
		//버튼
		$("#btnEdit").css("display","none");
		$("#btnDelete").css("display","none");
		$("#btnSave").css("display","block");
		$("#btnCancle").css("display","block");
					
	}
	//상품 삭제
	function productDelete(){
		if(confirm("상품삭제를 수행 하시겠습니까?")){
			location.href="deleteProduct?pnum=${product.pnum}";
		}
	}
	//상품저장
	function productSave(){
		//document.querySelector("#uploadForm")// 폼태그의 요소가져오기 
		document.querySelector("#uploadForm").submit();
	}
	function productCancle(){
		$(".useitem").css("display","block");
		$(".edit").css("display","none");
		//버튼
		$("#btnEdit").css("display","block");
		$("#btnDelete").css("display","block");
		$("#btnSave").css("display","none");
		$("#btnCancle").css("display","none");
	}
</script>
<%@ include file="../include/footer.jsp"%>