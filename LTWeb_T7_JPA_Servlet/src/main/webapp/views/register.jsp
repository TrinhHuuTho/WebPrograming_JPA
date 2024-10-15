<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <!-- Bootstrap CSS -->
    <link href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <!-- BEGIN CONTENT -->
    <div class="container">
        <div class="col-md-8 col-md-offset-2">
            <h1>Register</h1>
            <p>Please fill in this form to create an account.</p>
            <hr>
            <form method="post" action="${pageContext.request.contextPath}/register" class="form-horizontal" role="form">
                
                <!-- Username Field -->
                <div class="form-group">
                    <label for="username" class="col-lg-4 control-label">Username <span class="require">*</span></label>
                    <div class="col-lg-8">
                        <input type="text" class="form-control" id="username" name="username" placeholder="Enter Username" required>
                    </div>
                </div>

                <!-- Email Field -->
                <div class="form-group">
                    <label for="email" class="col-lg-4 control-label">Email <span class="require">*</span></label>
                    <div class="col-lg-8">
                        <input type="email" class="form-control" id="email" name="email" placeholder="Enter Email" required>
                    </div>
                </div>

                <!-- Password Field -->
                <div class="form-group">
                    <label for="password" class="col-lg-4 control-label">Password <span class="require">*</span></label>
                    <div class="col-lg-8">
                        <input type="password" class="form-control" id="password" name="password" placeholder="Enter Password" required>
                    </div>
                </div>

                <!-- Fullname Field -->
                <div class="form-group">
                    <label for="fullname" class="col-lg-4 control-label">Fullname <span class="require">*</span></label>
                    <div class="col-lg-8">
                        <input type="text" class="form-control" id="fullname" name="fullname" placeholder="Enter Fullname" required>
                    </div>
                </div>

                <!-- Submit Button -->
                <div class="form-group">
                    <div class="col-lg-offset-4 col-lg-8">
                        <button type="submit" class="btn btn-primary">Register</button>
                    </div>
                </div>
            </form>
            
            <!-- Sign In Link -->
            <div class="container signin">
                <p>
                    Already have an account? 
                    <a href="${pageContext.request.contextPath}/views/login.jsp">Sign in</a>.
                </p>
            </div>
        </div>
    </div>
    <!-- END CONTENT -->

    <!-- Bootstrap JS -->
    <script src="${pageContext.request.contextPath}/assets/global/plugins/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
