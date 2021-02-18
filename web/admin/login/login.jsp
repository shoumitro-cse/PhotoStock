<%-- 
    Document   : admin_login
    Created on : Jul 30, 2020, 9:10:31 PM
    Author     : shoumitro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="../../asset/images/web_icon/ps_small.png"/>
        <link rel="stylesheet" href="../../asset/css/font-awesome.css"/>
        <link rel="stylesheet" href="../../asset/css/ionicons.css"/>
        <link rel="stylesheet" href="../../asset/css/admin/common.css"/>
        <link rel="stylesheet" href="../../asset/css/admin/admin_login.css"/>
        <title>Admin Login</title>
    </head>
    <body>
        <!--for navigation-->
        <%@include file="../dashboard/navbar.jsp" %>

        <section>
            <div class="body-content">
                <div class="form-container">
                    <div class="title">
                        <p>Login</p>
                    </div>
                    <form id="admin_login_form" action="admin_login.jsp" method="get">
                        <label for="email" ><span class="fa fa-envelope"></span> Email</label>
                        <input type="email" name="email" id="email" placeholder="Email" />
                        <label for="password" >Password</label>
                        <div class="password-container">
                            <span onclick="passwordShow()" id="password_show" class="fa fa-eye-slash"></span>
                            <input type="password" name="password" id="password" placeholder="Password" />
                        </div>

                        <div class="submit-content">
                            <input onclick="adminLoginValidation()" type="submit" value="Go"/>
                        </div>
                    </form>
                </div>
            </div>
        </section>

        <script src="../../asset/js/admin/common.js" type="text/javascript"></script>
        <%@include file="../dashboard/footer.jsp" %>

    </body>
</html>
