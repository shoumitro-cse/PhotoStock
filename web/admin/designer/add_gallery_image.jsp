<%-- 
    Document   : add_gallery_image
    Created on : Jan 11, 2021, 9:54:45 PM
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
        <title>Image Form</title>
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
                        <p class="form-panel-head">Add New Image</p>
                        <main>
                            <!-- for code separate file-->
                            <div id="add_image_form_container" class="form-container">
                                <form id="add_form_id" action="" method="get">
                                    <%@include file="../image/form_content.jsp" %>
                                    <input type="hidden" id="add_form" name="add_form" value="add" />
                                    <p class="submit-content">
                                        <input onclick="addImageForm('add_image_form_container')" type="submit" value="Continue to submit">
                                    </p>
                                </form>
                                <!--<form id="image_picture_upload_form" action="../image/picture_upload.jsp" method="post" enctype="multipart/form-data">-->
                                <form id="image_picture_upload_form" action="../image/picture_upload.jsp">
                                    <!--<input type="file" value="gghgh.png" />-->
                                    <!--<input type="submit" value="submit"/>-->
                                </form>
                            </div>

                        </main>
                    </div>
                </div>

            </div>
        </section>

        <!--add javascript-->
        <script src="../../asset/js/admin/image_form.js" type="text/javascript"></script>

        <!--for footer-->
        <%@include file="../dashboard/footer.jsp" %>

    </body>
</html>
