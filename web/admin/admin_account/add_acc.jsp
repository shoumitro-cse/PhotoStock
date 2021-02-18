<%-- 
    Document   : add_acc
    Created on : Jul 31, 2020, 2:16:37 PM
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
        <link rel="stylesheet" href="../../asset/css/admin/form.css"/>
        <title>Admin Add</title>
        <style>

        </style>
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
                        <p class="form-panel-head" style="text-transform: uppercase">Insert Admin account</p>
                        <main>
                            <!-- for code separate file-->
                            <div id="insert_form_container" class="form-container">
                                <form id="admin_insert_form" action="insert.jsp" method="get" >
                                    <input type="hidden" name="page" value="add_acc.jsp" />
                                    <%@include file="insert_form.jsp" %>
                                </form>
                            </div>
                        </main>
                    </div>
                </div>

            </div>
        </section>

        <!--add javascript-->
        <script src="../../asset/js/admin/admin_account.js" type="text/javascript"></script>

        <!--for footer-->
        <%@include file="../dashboard/footer.jsp" %>

    </body>
</html>
