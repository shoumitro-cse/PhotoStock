<%-- 
    Document   : view
    Created on : Jul 22, 2020, 11:36:41 AM
    Author     : shoumitro
--%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.admin.Designer"%>
<%@page import="java.util.List"%>
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
        <title>Designer View</title>
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
                        <p class="panel-head">Designer View</p>
                        <main>
                            <!-- for code separate file-->
                            <div class="table-container">
                                
                                <div class="tab-content">
                                    <ul>
                                        <!--<li><a id="tab-active-link" onclick="tabShow(this, 'inroduction')" class="tab-active" href="">Introduction</a></li>--> 
                                        <li><a class="all_time_tab_active" id="introduct_tab_id" onclick="tabShow(this, 'designer_inroduction', 'introduct_tab_id')" href="">Introduction</a></li> 
                                        <li><a id="social_tab_id" onclick="tabShow(this, 'designer_social', 'social_tab_id')"  class="" href="">Social Media</a></li> 
                                        <li><a id="fullTable_tab_id" onclick="tabShow(this, 'designer_fullTable', 'fullTable_tab_id')"  class="" href="">Full Table</a></li> 
                                        <li><a id="create_tab_id" onclick="tabShow(this, 'designer_create', 'create_tab_id')"  class="" href="">Create</a></li> 
                                    </ul>
                                </div>
                                
                                <!--<div id="inroduction" class="table-content show">-->
                                <div id="designer_inroduction" class="table-content">
                                    <p style="color: red; font-size: 150%;"> Database are not connected.</p>
                                </div>
                                
                                <!--designer social media-->
                                <div id="designer_social" class="table-content">
                                    <p style="color: red; font-size: 150%;"> Database are not connected.</p>
                                </div>
                                
                                <!--designer fullTable-->
                                <div id="designer_fullTable" class="table-content">
                                    <p style="color: red; font-size: 150%;"> Database are not connected.</p>
                                </div>
                                
                                <!--designer insert-->
                                <div id="designer_create" class="table-content"> 
                                    <p style="color: red; font-size: 150%;"> Database are not connected.</p>
                                </div>
                                
                            </div>
                        </main>
                    </div>
                </div>

            </div>
        </section>

        <script src="../../asset/js/admin/common.js" type="text/javascript"></script>
        <script src="../../asset/js/admin/designer_form.js" type="text/javascript"></script>
        <!--for footer-->
        <%@include file="../dashboard/footer.jsp" %>

    </body>
</html>
