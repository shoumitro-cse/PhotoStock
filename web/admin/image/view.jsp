<%-- 
    Document   : view
    Created on : Jul 23, 2020, 7:14:00 PM
    Author     : shoumitro
--%>

<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.admin.Image"%>
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
        <link rel="stylesheet" href="../../asset/css/admin/view.css"/>
        <link rel="stylesheet" href="../../asset/css/admin/form.css"/>
        <title>Image View</title>
    </head>
    <body>



        <!--for delete box-->
        <div id="delete_alert" class="delete-box">
            <%--<%@include file="delete_box.jsp" %>--%>
        </div>

        <!--for update box-->
        <div id="insert_update_box" class="update-box">
            <%--<%@include file="update_form.jsp" %>--%>
        </div>



        <!--for navigation-->
        <%@include file="../dashboard/navbar.jsp" %>

        <section>
            <div class="body-content">

                <!--for side menu-->
                <%@include  file="../dashboard/side_menu.jsp" %>

                <!--for main content-->
                <div class="body-main-container">
                    <div class="body-main-content">
                        <p class="panel-head">Image View</p>
                        <main>
                            <!-- for code separate file-->
                            <div class="table-container">

                                <!--for tab link-->
                                <div class="tab-content">
                                    <ul>
                                        <li><a class="all_time_tab_active" id="intro_image" onclick="tabShow(this, 'inroduction', 'intro_image')" href="">Introduction</a></li> 
                                        <li><a id="tab_stock" onclick="tabShow(this, 'stock', 'tab_stock')"  class="" href="">Stock Info</a></li> 
                                        <li><a id="tab_pricing" onclick="tabShow(this, 'pricing', 'tab_pricing')"  class="" href="">Pricing</a></li> 
                                        <li><a id="tab_meta" onclick="tabShow(this, 'meta', 'tab_meta')"  class="" href="">Meta Data</a></li> 
                                        <li><a id="tab_full_table_image" onclick="tabShow(this, 'fullTable', 'tab_full_table_image')"  class="" href="">Full Table</a></li> 
                                        <li><a id="tab_stock_end_table_image" onclick="tabShow(this, 'stock_end', 'tab_stock_end_table_image')"  class="" href="">stock_end</a></li> 
                                        <li><a id="create_tab" onclick="tabShow(this, 'create', 'create_tab')"  class="" href="">Create</a></li> 
                                    </ul>
                                </div>
                                <!--for inroduction table content-->
                                <div id="inroduction" class="table-content">
                                    <p style="color: red; font-size: 150%;"> Database are not connected.</p>
                                </div>

                                <!--for stock table content-->
                                <div id="stock" class="table-content">
                                    <p style="color: red; font-size: 150%;"> Database are not connected.</p>
                                </div>

                                <!--for pricing table content-->
                                <div id="pricing" class="table-content">
                                    <p style="color: red; font-size: 150%;"> Database are not connected.</p>
                                </div>

                                <!--for meta table content-->
                                <div id="meta" class="table-content">
                                    <p style="color: red; font-size: 150%;"> Database are not connected.</p>
                                </div>

                                <!--for fullTable table content-->
                                <div id="fullTable" class="table-content">
                                    <p style="color: red; font-size: 150%;"> Database are not connected.</p>
                                </div>
                                <!--for fullTable table content-->
                                <div id="stock_end" class="table-content">
                                    <p style="color: red; font-size: 150%;"> not Database are not connected.</p>
                                </div>


                                <!--insert image-->
                                <div id="create" class="table-content">
                                    <p style="color: red; font-size: 150%;"> Database are not connected.</p>
                                </div>


                            </div>
                        </main>
                    </div>
                </div>

            </div>
        </section>

        <script src="../../asset/js/admin/common.js" type="text/javascript"></script>
        <script src="../../asset/js/admin/image_form.js" type="text/javascript"></script>
        <!--for footer-->
        <%@include file="../dashboard/footer.jsp" %>

    </body>
</html>
