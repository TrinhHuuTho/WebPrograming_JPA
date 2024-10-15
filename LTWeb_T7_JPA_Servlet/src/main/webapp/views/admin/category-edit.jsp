<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>


<form action="${pageContext.request.contextPath }/admin/category/update" method="POST"
		enctype="multipart/form-data">
	<input type="text"  id="categoryid" name="categoryid" value="${cate.categoryid}" hidden="hidden"><br> 
	<label for="categoryname">Category Name:</label><br> 
	<input type="text"  id="categoryname" name="categoryname" value="${cate.categoryname}"><br> 
	<label for="images">Images:</label><br> 
		<c:if test="${cate.images != null && cate.images.startsWith('https')}">
			<!-- Đường dẫn ảnh từ URL bên ngoài -->
			<img id="imagess" height="150" width="200" src="${cate.images}" />
		</c:if>
			
			<!-- Nếu không phải đường dẫn https -->
		<c:if test="${cate.images != null && !cate.images.startsWith('https')}">
			<!-- Sử dụng c:url để tạo đường dẫn cho ảnh cục bộ -->
			<c:url value="/image?fname=${cate.images}" var="imgUrl"></c:url>
			<img id="imagess" height="150" width="200" src="${imgUrl}" />
		</c:if>
	<input type="file" onchange="chooseFile(this)" id="images" name="images" value="${cate.images}"><br>
	<label for="status">Status:</label><br> 
	<input type="text" id="status" name="status" value="${cate.status}"><br>
	<br> <input type="submit" value="Submit">
</form>