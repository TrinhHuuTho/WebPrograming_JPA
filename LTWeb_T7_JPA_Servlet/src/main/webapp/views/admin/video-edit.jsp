<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<h2>Edit Video</h2>

<form action="${pageContext.request.contextPath}/admin/video/update" method="POST" enctype="multipart/form-data">
    <input type="hidden" id="videoId" name="videoId" value="${video.videoId}">

    <label for="title">Video Title:</label><br>
    <input type="text" id="title" name="title" value="${video.title}" required><br>

    <label for="views">View Count:</label><br>
    <input type="number" id="views" name="views" value="${video.views}" required><br>

    <label for="description">Description:</label><br>
    <textarea id="description" name="description" required>${video.description}</textarea><br>

    <label for="categoryId">Category:</label><br>
    <select id="categoryId" name="categoryId" required>
        <c:forEach items="${listCategories}" var="category">
            <option value="${category.categoryid}" <c:if test="${video.category.categoryid == category.categoryid}">selected</c:if>>${category.categoryname}</option>
        </c:forEach>
    </select><br>

    <label for="poster">Current Poster:</label><br>
    <img id="posterImage" src="${pageContext.request.contextPath}/image?fname=${video.poster}" height="100" width="150"><br>

    <label for="poster">Upload New Poster:</label><br>
    <input type="file" id="poster" name="poster" accept="image/*" onchange="previewPoster(this)"><br>

    <label for="active">Status:</label><br>
    <input type="radio" id="active" name="active" value="1" <c:if test="${video.active == 1}">checked</c:if>> Hoạt động
    <input type="radio" id="inactive" name="active" value="0" <c:if test="${video.active == 0}">checked</c:if>> Khóa<br>

    <input type="submit" value="Update">
</form>
<script>
    function previewPoster(fileInput) {
        if (fileInput.files && fileInput.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
                document.getElementById('posterImage').src = e.target.result;
            }
            reader.readAsDataURL(fileInput.files[0]);
        }
    }
</script>