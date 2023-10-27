<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../include/header.jsp" %>
<div id="head">
	 <div id="navi_box">
	 	<ul>
			<li><a href="#">가전·TV</a>

				<ul class="sub">
					<li><a href="#">TV</a></li>
					<li><a href="#">냉장고</a></li>
					<li><a href="#">세탁기/건조기</a></li>
					<li><a href="#">계절가전</a></li>					
				</ul>
			</li>
			<li><a href="#">컴퓨터·노트북</a>
				<ul class="sub">
					<li><a href="#">컴퓨터</a></li>
					<li><a href="#">노트북</a></li>
					<li><a href="#">주요부품</a></li>
					<li><a href="#">저장장치</a></li>	
					<li><a href="#">게임기</a></li>		
				</ul>
			</li>

			<li><a href="#">태블릿·모바일</a>
				<ul class="sub">
					<li><a href="#">휴대폰/스마트폰</a></li>
					<li><a href="#">태블릿/전자책</a></li>
					<li><a href="#">스마트워치</a></li>
					<li><a href="#">이어폰/헤드폰</a></li>
				</ul>
			</li>

			<li><a href="#">패션·잡화·뷰티</a>
				<ul class="sub">
					<li><a href="#">가방/지갑</a></li>
					<li><a href="#">남성 의류</a></li>
					<li><a href="#">여성 의류</a></li>
					<li><a href="#">스킨케어/향수</a></li>
				</ul>
			</li>
		</ul>
	 </div><!-- 메뉴 navi_box-->
  </div><!-- head -->
<style>
#navibox{
	display:flex;
		justify-content: left;
		height:100;
}
	#pagediv,#searchdiv{
		display:flex;
		justify-content: center;
	}
	#top-button{
		display:flex;
		justify-content: right;
		padding:10px;
	}
</style>
<main>
	<div id="top-button">
		<c:if test="${sessionScope.role=='ADMIN'}">
			<a href="productNew"><button type="button" class="btn btn-primary">상품등록</button></a>
			
		</c:if>
	</div>
	      <!--  검색 -->
    <div id="searchdiv">	 	
		<form action="productList" method="post">
	        <select name="searchtype" id="searchtype">
	            <option value="pname" checked>상품명</option>
	            <option value="pcompa">제조회사명</option>
	            <option value="pcontent">내용으로검색하기</option>
	        </select>
	        <input type="text" size="20" name="searchword" id="searchword" >
	        <button onclick="return searchFun()">검 색</button> &nbsp;	        
	    </form>		

 	</div>		
 	
	<table class="table table-sm table-bordered">
		<tr>
			<th>order</th>
			<th>제품번호</th>
			<th>메인카테1</th>
			<th>서브카테</th>
			<th>상품명</th>
			<th>제조회사</th>
			<th>상품설명</th>
			<th>저장일자</th>
			
		</tr>
		<c:if test="${list==null}">
			<tr>
				<td colspan="6">검색된 상품이 없습니다.</td>
			</tr>
		</c:if>
		<c:forEach items="${list}" var="product" varStatus="sts">
			<tr>
				<td>${sts.count}</td>
				<td><a href="productView?pnum=${product.pnum}&pageNum=${pmaker.criteria.pageNum}&searchword=${pmaker.criteria.searchword}&searchtype=${pmaker.criteria.searchtype}">${product.pnum}</a></td>
				<td>${product.ptype1}</td>
				<td>${product.ptype2}</td>
				<td>${product.pname}</td>
				<td>${product.pcompa}</td>
				<td>${product.pcontent}</td>
				<td>${product.preg}</td>
			</tr>	
		</c:forEach>
	 </table>
	 <div id="pagediv">
		 <!-- 페이지 -->	 
	     <nav aria-label="Standard pagination example">
	          <ul class="pagination">
		         <c:if test="${pmaker.prev}">
		            <li class="page-item">
		              <a class="page-link" href="productList?pageNum=${pmaker.beginPage-1}&searchword=${pVo.searchword}&searchtype=${pVo.searchtype}" aria-label="Previous">
		                <span aria-hidden="true">&laquo;</span>
		              </a>
		            </li>   
	            </c:if>        
	           <c:forEach begin="${pmaker.beginPage}" end="${pmaker.endPage}" var="i">
			 		<c:choose>
			 			<c:when test="${i!=pmaker.criteria.pageNum}"><li class="page-item"><a class="page-link" href="productList?pageNum=${i}&searchword=${pmaker.criteria.searchword}&searchtype=${pmaker.criteria.searchtype}">${i}</a></li></c:when>
			 			<c:otherwise> <li class="page-item"><a class="page-link" style="font-weigth:bold;color:black">${i}</a></li></c:otherwise>	 		
			 		</c:choose>		 			 	
		 		</c:forEach> 
		 		<c:if test="${pmaker.next}">
		           <li class="page-item">
		              <a class="page-link" href="productList?pageNum=${pmaker.endPage+1}&searchword=${pmaker.criteria.searchword}&searchtype=${pmaker.criteria.searchtype}" aria-label="Next">
		                <span aria-hidden="true">&raquo;</span>
		              </a>
		            </li>
	            </c:if>
	          </ul>
	    </nav><!-- paging end -->
    </div>
  
 </main>
<script type="text/javascript">
	function searchFun() {
		//id searchword에 값을 가져온다
		let searchword=document.querySelector("#searchword");
		//값 trim 수행 빈것이면 alert 포커스 searchword return false
		if(searchword.value.trim()===""){
			//alert("검색어를 입력하세요.");
			searchword.value="";
			//searchword.focus();
			//return false;
		}
		//검색어가 있으면 return true
		return true;
	}
	
</script>
<%@ include file="../include/footer.jsp" %>