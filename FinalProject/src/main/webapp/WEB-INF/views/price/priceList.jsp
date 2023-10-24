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
	<h2>가격 목록</h2>
	<div id="top-button">
		<c:if test="${sessionScope.role=='ADMIN'}">
			<a href="priceNew"><button type="button" class="btn btn-primary">가격등록</button></a>
		</c:if>
	</div>
	<table class="table table-sm table-bordered">
		<tr>
			<th>가격번호</th>
			<th>물품번호</th>
			<th>제조회사</th>
			<th>가격</th>
			<th>판매페이지</th>
			<th>저장일자</th>
		</tr>
		<c:forEach items="${list}" var="price" varStatus="sts">
			<tr>
				<td>${sts.count}</td>
				<td><a href="priceView?pinum=${price.pinum}&pageNum=${pmaker.criteria.pageNum}&searchword=${pmaker.criteria.searchword}&searchtype=${pmaker.criteria.searchtype}">${price.pinum}</a></td>
				<td><a href="priceView?pnum=${price.pnum}&pageNum=${pmaker.criteria.pageNum}&searchword=${pmaker.criteria.searchword}&searchtype=${pmaker.criteria.searchtype}">${price.pnum}</a></td>
				<td>${price.picompa}</td>
				<td>${price.price}</td>
				<td>${price.pipage}</td>
				<td>${price.regdate}</td>
			</tr>	
		</c:forEach>
	 </table>

<%@ include file="../include/footer.jsp" %>