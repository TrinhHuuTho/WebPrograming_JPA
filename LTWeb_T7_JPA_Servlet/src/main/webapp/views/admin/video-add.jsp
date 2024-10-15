<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<h2>Add New Video</h2>

<form action="${pageContext.request.contextPath}/admin/video/insert" method="POST" enctype="multipart/form-data">
    <label for="videoId">Video ID:</label><br>
    <input type="text" id="videoId" name="videoId" required><br>

    <label for="title">Video Title:</label><br>
    <input type="text" id="title" name="title" required><br>

    <label for="views">View Count:</label><br>
    <input type="number" id="views" name="views" value="0" required><br>

    <label for="description">Description:</label><br>
    <textarea id="description" name="description" required></textarea><br>

    <label for="categoryId">Category:</label><br>
    <select id="categoryId" name="categoryId" required>
        <c:forEach items="${listCategories}" var="category">
            <option value="${category.categoryid}">${category.categoryname}</option>
        </c:forEach>
    </select><br>

    <label for="poster">Upload Poster:</label><br>
    <input type="file" id="poster" name="poster" accept="image/*"><br>

    <label for="active">Status:</label><br>
    <input type="radio" id="active" name="active" value="1" checked> Active
    <input type="radio" id="inactive" name="active" value="0"> Inactive<br>

    <input type="submit" value="Submit">
</form>