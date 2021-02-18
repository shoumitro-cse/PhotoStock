<%-- 
    Document   : admin
    Created on : Jul 24, 2020, 7:54:38 AM
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
        <title>Admin</title>
    </head>
    <body>

        <!--for navigation-->
        <%@include file="../dashboard/navbar.jsp" %>

        <section>
            <div class="body-content">

                <!--for side menu-->
                <%@include  file="../dashboard/side_menu.jsp" %>

                <!--for main content-->
                <div class="body-main-container">
                    <div class="body-main-content">
                        <p class="panel-head">Admin</p>
                        <main>
                            <!-- for code separate file-->
                            <div class="btn-content">
                                <ul>
                                    <li><a href="add_acc.jsp"><span class="fa fa-edit"></span> &nbsp;New</a></li>
                                    <li><a href="view.jsp"><span class="fa fa-edit"></span> &nbsp;View</a></li>
                                    <li><a href="account.jsp"><span class="fa fa-edit"></span> &nbsp;My Account</a></li>

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
