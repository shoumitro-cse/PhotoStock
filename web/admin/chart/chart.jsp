<%-- 
    Document   : chart
    Created on : Jul 24, 2020, 8:07:12 AM
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
        <title>Chart Analysis</title>
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
                        <p class="panel-head">Chart Analysis</p>
                        <main>
                            <!-- for code separate file-->
                            <div class="btn-content">
                                <ul>
                                    <li><a href="pie_chart.jsp"><span class="fa fa-edit"></span> &nbsp;Pie Chart</a></li>
                                    <li><a href="area.jsp"><span class="fa fa-edit"></span> &nbsp;Area Chart</a></li>
                                    <li><a href="line_chart.jsp"><span class="fa fa-edit"></span> &nbsp;Line Chart</a></li>
                                    
                                    <li><a href="visited_users.jsp"><span class="fa fa-edit"></span> &nbsp;Visited Users</a></li>
                                    <!--<li><a href="user_count.jsp"><span class="fa fa-edit"></span>userCount(day)</a></li>-->
                                    <li><a href="user_count.jsp"><span class="fa fa-edit"></span>&nbsp;Today Visitors</a></li>
                                    

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
