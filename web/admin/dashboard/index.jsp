<%-- 
    Document   : index
    Created on : Jul 21, 2020, 11:00:12 AM
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
        <title>Dashboard</title>
    </head>
    <body>
        <%            
//            if (session.getAttribute("admin_login") != null) {
//                if (!(Boolean.parseBoolean(session.getAttribute("admin_login").toString()))) {
//                    response.sendRedirect("../login/login.jsp");
//                }
//            } else {
//                response.sendRedirect("../login/login.jsp");
//            }

        %>

        <!--for navigation-->
        <%@include file="navbar.jsp" %>

        <section>
            <div class="body-content">

                <!--for side menu-->
                <%@include  file="side_menu.jsp" %>

                <!--for main content-->
                <div class="body-main-container">
                    <div class="body-main-content">
                        <p class="panel-head">Dashboard</p>
                        <main>
                            <!-- for code separate file-->
                            <%@include  file="dashboard.jsp"  %>
                        </main>
                    </div>
                </div>

            </div>
        </section>

        <!--for footer-->
        <%@include file="footer.jsp" %>
        <script src="../../asset/js/admin/common.js" type="text/javascript"></script>

    </body>
</html>
