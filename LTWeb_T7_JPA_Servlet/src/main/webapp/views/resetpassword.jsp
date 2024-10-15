<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


    <div class="main">
      <div class="container">
        <ul class="breadcrumb">
            <li><a href="index.html">Home</a></li>
            <li><a href="">Store</a></li>
            <li class="active">Forgot Your Password?</li>
        </ul>
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
          <!-- BEGIN SIDEBAR -->
          <div class="sidebar col-md-3 col-sm-3">
            <ul class="list-group margin-bottom-25 sidebar-menu">
              <li class="list-group-item clearfix"><a href="#"><i class="fa fa-angle-right"></i>Login/Register</a></li>
              <li class="list-group-item clearfix"><a href="#"><i class="fa fa-angle-right"></i>Restore Password</a></li>
              <li class="list-group-item clearfix"><a href="#"><i class="fa fa-angle-right"></i>My account</a></li>
              <li class="list-group-item clearfix"><a href="#"><i class="fa fa-angle-right"></i>Address book</a></li>
              <li class="list-group-item clearfix"><a href="#"><i class="fa fa-angle-right"></i>Wish list</a></li>
              <li class="list-group-item clearfix"><a href="#"><i class="fa fa-angle-right"></i>Returns</a></li>
              <li class="list-group-item clearfix"><a href="#"><i class="fa fa-angle-right"></i>Newsletter</a></li>
            </ul>
          </div>
          <!-- END SIDEBAR -->

          <!-- BEGIN CONTENT -->
          <div class="col-md-9 col-sm-9">
            <h1>Forgot Your Password?</h1>
            <div class="content-form-page">
              <div class="row">
                <div class="col-md-7 col-sm-7">
                  <form  method="post" action="${pageContext.request.contextPath}/user/forgotpassword" class="form-horizontal form-without-legend" role="form">                    
                                        <!-- Email Field -->
                    <div class="form-group">
                        <label for="email" class="col-lg-4 control-label">Email</label>
                        <div class="col-lg-8">
                            <input type="email" class="form-control" id="email" name="email" required>
                        </div>
                    </div>

                    <!-- New Password Field -->
                    <div class="form-group">
                        <label for="newPassword" class="col-lg-4 control-label">New Password</label>
                        <div class="col-lg-8">
                            <input type="password" class="form-control" id="newPassword" name="newPassword" required>
                        </div>
                    </div>

                    <!-- Confirm Password Field -->
                    <div class="form-group">
                        <label for="confirmPassword" class="col-lg-4 control-label">Confirm Password</label>
                        <div class="col-lg-8">
                            <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
                        </div>
                    </div>

                    <!-- Submit Button -->
                    <div class="form-group">
                        <div class="col-lg-offset-4 col-lg-8">
                            <button type="submit" class="btn btn-primary">Reset Password</button>
                        </div>
                    </div>
                  </form>
                </div>
                <div class="col-md-4 col-sm-4 pull-right">
                  <div class="form-info">
                    <h2><em>Important</em> Information</h2>
                    <p>Enter the email address associated with your account. Click Reset Password to change the password via the email registered to your account.</p>

                    <button type="button" class="btn btn-default">More details</button>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- END CONTENT -->
        </div>
        <!-- END SIDEBAR & CONTENT -->
      </div>
    </div>
