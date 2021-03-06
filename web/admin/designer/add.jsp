<%-- 
    Document   : designer_form
    Created on : Jul 22, 2020, 8:28:44 AM
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
        <title>Designer Form</title>
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
                        <p class="form-panel-head">Designer Form</p>
                        <main>
                            <!-- for code separate file-->
                            <div id="insert_form_container" class="form-container">
                                <form action="insert.jsp" method="get" >
                                    <input type="hidden" name="add_form" value="add" />
                                    <%@include file="form_content.jsp" %>
                                    <p class="submit-content">
                                        <input onclick="formSubmit('insert_form_container')" id="image_submit_btn" type="submit" value="Continue to submit">
                                    </p>
                                </form>
                                <form id="picture_upload_form" action="picture_upload.jsp" method="post" enctype="multipart/form-data">

                                </form>
                            </div>
                        </main>
                    </div>
                </div>

            </div>
        </section>

        <!--add javascript-->
        <script src="../../asset/js/admin/designer_form.js" type="text/javascript"></script>

        <!--for footer-->
        <%@include file="../dashboard/footer.jsp" %>

    </body>
</html>
