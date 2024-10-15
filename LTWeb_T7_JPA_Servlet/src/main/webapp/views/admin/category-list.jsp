<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<a href="${pageContext.request.contextPath }/admin/category/add">
	Add Category</a>
<table border="1" width="100%">
	<tr>
		<th>STT</th>
		<th>images</th>
		<th>CategoryID</th>
		<th>CategoryName</th>
		<th>Status</th>
		<th>Action</th>
	</tr>

	<c:forEach items="${listcate}" var="cate" varStatus="STT">
		<tr>
			<td>${STT.index+1}</td>
			<td><c:if
					test="${cate.images != null && cate.images.startsWith('https')}">
					<!-- Đường dẫn ảnh từ URL bên ngoài -->
					<img height="150" width="200" src="${cate.images}" />
				</c:if> <!-- Nếu không phải đường dẫn https --> <c:if
					test="${cate.images != null && !cate.images.startsWith('https')}">
					<!-- Sử dụng c:url để tạo đường dẫn cho ảnh cục bộ -->
					<c:url value="/image?fname=${cate.images}" var="imgUrl"></c:url>
					<img height="150" width="200" src="${imgUrl}" />
				</c:if></td>
			<td>${cate.categoryid }</td>
			<td>${cate.categoryname }</td>
			<td><c:if test="${cate.status ==1 }">
					<span>Hoạt động</span>
				</c:if> <c:if test="${cate.status !=1 }">
					<span>Khóa</span>
				</c:if></td>
			<td><a
				href="<c:url value='/admin/category/edit?id=${cate.categoryid }'/>">Sửa</a>
				| <a href="<c:url value='/admin/category/delete?id=${cate.categoryid }'/>">Xóa</a>
			</td>
		</tr>
	</c:forEach>
</table>