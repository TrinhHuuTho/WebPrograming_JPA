<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<h2>Video List</h2>

<a href="${pageContext.request.contextPath}/admin/video/add">Add Video</a>

<table border="1" width="100%">
    <thead>
        <tr>
            <th>Video ID</th>
            <th>Title</th>
            <th>Views</th>
            <th>Description</th>
            <th>Poster</th>
            <th>Status</th>
            <th>Category</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${listVideos}" var="video">
            <tr>
                <td>${video.videoId}</td>
                <td>${video.title}</td>
                <td>${video.views}</td>
                <td>${video.description}</td>
                <td>
                    <img src="${pageContext.request.contextPath}/image?fname=${video.poster}" height="100" width="150" />
                </td>
                <td>
                    <c:if test="${video.active == 1}">Hoạt động</c:if>
                    <c:if test="${video.active != 1}">Khóa</c:if>
                </td>
                <td>${video.category.categoryname}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/admin/video/edit?id=${video.videoId}">Sửa</a>
                    <a href="${pageContext.request.contextPath}/admin/video/delete?id=${video.videoId}" onclick="return confirm('Are you sure?');">Xóa</a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>