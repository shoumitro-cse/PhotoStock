<%-- 
    Document   : image
    Created on : Jul 21, 2020, 5:19:49 PM
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
        <title>Image</title>
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
                        <p class="panel-head">Image</p>
                        <main>
                            <!-- for code separate file-->
                            <div class="btn-content">
                                <ul>
                                    <li><a href="add.jsp"><span class="fa fa-edit"></span> &nbsp;New</a></li>
                                    <li><a href="view.jsp"><span class="fa fa-edit"></span> &nbsp;View</a></li>
                                    <li><a onclick="sessionStorage.setItem('active_tab_id', 'intro_image')" href="view.jsp"><span class="fa fa-edit"></span> &nbsp;Intro</a></li>
                                    <li><a onclick="sessionStorage.setItem('active_tab_id', 'tab_stock')" href="view.jsp"><span class="fa fa-edit"></span> &nbsp;Stock</a></li>
                                    <li><a onclick="sessionStorage.setItem('active_tab_id', 'tab_pricing')" href="view.jsp"><span class="fa fa-edit"></span> &nbsp;Pricing</a></li>
                                    <li><a onclick="sessionStorage.setItem('active_tab_id', 'tab_meta')" href="view.jsp"><span class="fa fa-edit"></span> &nbsp;Meta</a></li>
                                    <li><a onclick="sessionStorage.setItem('active_tab_id', 'tab_stock_end_table_image')" href="view.jsp"><span class="fa fa-edit"></span> &nbsp;Stock End</a></li>
                                    
                                    <li><a href="../category/category.jsp"><span class="fa fa-edit"></span> &nbsp;Category</a></li>
                                    <li><a href="comment.jsp"><span class="fa fa-edit"></span> &nbsp;Comment</a></li>
                                   
                                    <li><a href="ratings_reviews.jsp"><span class="fa fa-edit"></span> &nbsp;Rating & Review</a></li>
                                    
                                    
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
