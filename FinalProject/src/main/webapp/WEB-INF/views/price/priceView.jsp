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
	<form action="priceUpdate" method="post"
		enctype="multipart/form-data" id="uploadForm" name="uploadForm">
		<input type="hidden" value="${price.pinum}" name="pinum" id="pinum">

		<table class="table table-sm table-bordered">

			<tr>
				<th>판매페이지입력</th>
				<td class="disp">${price.picompa}</td>
				<td class="edit" style="display: none;"><input type="text"
					size="120" maxlength="30" name="picompa" id="picompa"
					value="${price.picompa}" placeholder="판매페이지입력"></td>
			</tr>
			<tr>
				<th>가격입력</th>
				<td class="disp">${price.price}</td>
				<td class="edit" style="display: none;"><input type="text"
					size="150" maxlength="30" name="price"
					value="${price.price}" id="price" placeholder="가격">
				</td>
			</tr>
		</table>
		<div class="btn_rud">
			<button type="button" id="btnList"
				onclick="location.href='priceList?pageNum=${cri.pageNum}&searchword=${cri.searchword}&searchtype=${cri.searchtype}'"
				class="btn btn-success">가격목록</button>
			<c:if test="${sessionScope.role=='ADMIN'}">
				<button type="button" id="btnEdit" onclick="priceEdit()"
					class="btn btn-warning">가격수정</button>
				<button type="button" id="btnDelete" onclick="priceDelete()"
					class="btn btn-danger">가격삭제</button>
				<button type="submit" id="btnSave" onclick="priceSave()"
					class="btn btn-primary" style="display: none;">가격저장</button>
				<button type="reset" id="btnCancle" onclick="priceCancle()"
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
	function priceEdit(){
		$(".useitem").css("display","none");
		$(".edit").css("display","block");
		//버튼
		$("#btnEdit").css("display","none");
		$("#btnDelete").css("display","none");
		$("#btnSave").css("display","block");
		$("#btnCancle").css("display","block");
					
	}
	//상품 삭제
	function priceDelete(){
		if(confirm("가격삭제를 수행 하시겠습니까?")){
			location.href="deletePrice?pinum=${price.pinum}";
		}
	}
	//상품저장
	function priceSave(){
		//document.querySelector("#uploadForm")// 폼태그의 요소가져오기 
		document.querySelector("#uploadForm").submit();
	}
	function priceCancle(){
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