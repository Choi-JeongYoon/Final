<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<style>
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
			<a href="priceNew?pnum=${pnum}"><button type="button" class="btn btn-primary">가격등록</button></a>
		</c:if>
			<a href="productView?pnum=${pnum}"><button type="button" class="btn btn-primary">상품으로이동</button></a>
	</div>

 	</div>		
 	
	<table class="table table-sm table-bordered">
		<tr>
			<th>가격번호</th>
			<th>가격</th>
			<th>판매회사</th>
		</tr>
		<c:forEach items="${list1}" var="price" varStatus="sts">
			<tr>
			<td><a href="priceView?pinum=${price.pnum}&pageNum=${pmaker.criteria.pageNum}&searchword=${pmaker.criteria.searchword}&searchtype=${pmaker.criteria.searchtype}">${price.pinum}</a></td>
				<td>${price.price}</td>
				<td>${price.picompa}</td>
			</tr>	
		</c:forEach>
	 </table>

<%@ include file="../include/footer.jsp" %>