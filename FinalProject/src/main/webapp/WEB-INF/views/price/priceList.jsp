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
		      <!--  검색 -->
    <div id="searchdiv">	 	
		<form action="productList" method="post">
	        <select name="searchtype" id="searchtype">
	            <option value="pname" checked>가격번호</option>
	            <option value="pcompa">가격</option>
	            <option value="pcontent">판매회사</option>
	        </select>
	        <input type="text" size="20" name="searchword" id="searchword" >
	        <button onclick="return searchFun()">검 색</button> &nbsp;	        
	    </form>		

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