<%-- 
    Document   : user
    Created on : Jul 22, 2020, 10:41:52 AM
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
        <title>User</title>
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
        <%@include file="../dashboard/navbar.jsp" %>

        <section>
            <div class="body-content">

                <!--for side menu-->
                <%@include  file="../dashboard/side_menu.jsp" %>

                <!--for main content-->
                <div class="body-main-container">
                    <div class="body-main-content">
                        <p class="panel-head">User</p>
                        <main>
                            <!-- for code separate file-->
                            <div class="btn-content">
                                <ul>
                                    <li><a href="all.jsp"><span class="fa fa-edit"></span> &nbsp;View</a></li>
                                    <li><a href="simple.jsp"><span class="fa fa-edit"></span> &nbsp;Simple</a></li>
                                    <li><a href="company.jsp"><span class="fa fa-edit"></span> &nbsp;Company</a></li>
                                    <li><a href="active.jsp"><span class="fa fa-edit"></span> &nbsp;Active</a></li>
                                    <li><a href="message.jsp"><span class="fa fa-edit"></span> &nbsp;Message</a></li>
                                    <li><a href="contact.jsp"><span class="fa fa-edit"></span> &nbsp;Contact</a></li>

                                </ul>
                            </div>
                        </main>
                    </div>
                </div>

            </div>
        </section>

        <!--for footer-->
        <%@include file="../dashboard/footer.jsp" %>

    </body>
</html>
