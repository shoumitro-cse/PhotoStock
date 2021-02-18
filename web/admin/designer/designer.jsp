<%-- 
    Document   : designer
    Created on : Jul 21, 2020, 9:20:01 PM
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
        <title>Designer</title>
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
                        <p class="panel-head">Designer</p>
                        <main>
                            <!-- for code separate file-->
                            <div class="btn-content">
                                <ul>
                                    <li><a href="add.jsp"><span class="fa fa-edit"></span> &nbsp;New</a></li>
                                    <li><a href="view.jsp"><span class="fa fa-edit"></span> &nbsp;View</a></li>
                                    <li><a href="work.jsp"><span class="fa fa-edit"></span> &nbsp;Work</a></li>
<!--                                    <li><a href=""><span class="fa fa-edit"></span> &nbsp;Salary</a></li>
                                    <li><a href=""><span class="fa fa-edit"></span> &nbsp;Entry</a></li>
                                    <li><a href=""><span class="fa fa-edit"></span> &nbsp;Exit</a></li>
                                    <li><a href=""><span class="fa fa-edit"></span> &nbsp;Exhibition</a></li>-->

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
