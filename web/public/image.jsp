<%-- 
    Document   : image
    Created on : Jun 25, 2020, 7:48:03 AM
    Author     : shoumitro
--%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Hashtable"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="com.admin.Image" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="../asset/images/web_icon/ps_small.png"/>
        <title>Buy Adobe Image for Banner</title>
        <link rel="stylesheet" href="../asset/css/font-awesome.css" />
        <link rel="stylesheet" href="../asset/css/ionicons.css" />
        <link rel="stylesheet" href="../asset/css/common.css" />
        <link rel="stylesheet" href="../asset/css/image.css" />
        <link rel="stylesheet" href="../asset/css/model.css"/>
        <link rel="stylesheet" href="../asset/css/my_section.css"/>
    </head>
    <body>
        <%
//            if (session.getAttribute("login") != null) {
//                if (!(Boolean.parseBoolean(session.getAttribute("login").toString()))) {
//                    response.sendRedirect("index.jsp");
//                }
//            } else {
//                response.sendRedirect("index.jsp");
//            }
        %>
        <%
            int get_image_id = 0;
            String getId = request.getParameter("id");
            if (getId != null) {
                int id = Integer.parseInt(getId);
                get_image_id = id;

            }
            Image p = new Image();
            List list = (ArrayList) p.getImageItem(get_image_id);

            Map m = (Hashtable) list.get(0);
            ArrayList commentList = (ArrayList) list.get(1);


        %>

        <%@include file="header.jsp" %>
        <%@include file="model.jsp" %>
        <%@include file="preview.jsp" %>



        <%@include file="shopping_cart_menu.jsp" %>
        <%@include file="account_section/acc_side_menu.jsp" %>


        <section id="details-page">
            <!--for image card-->
            <%@include file="image_content/image_card.jsp" %>

            <!-- Specification & Summary and rating and comment-->
            <section class="details-book-section-summery" id="summary">

                <!--Image Specification & Summary-->
                <%@include file="image_content/image_specification.jsp" %>

                <!--for=> Related Images To This Item-->
                <%@include file="image_content/related_image.jsp" %>

                <!--for rating and comment-->
                <div class="details-ratings-review">
                    <div class="details-ratings-review-header">
                        <h1>Reviews and Ratings</h1>
                    </div>
                    <div class="details-ratings-review-content">
                        <!--for review and rating-->
                        <%@include file="image_content/review_rating.jsp" %>
                        <!--for comment-->
                        <%@include file="image_content/comment.jsp" %>
                    </div>
                </div>

                <%--<%@include file="related_image.jsp" %>--%>
            </section>
        </section>

        <!--for footer-->
        <%@include file="footer.jsp" %>
        <script src="../asset/js/common.js" type="text/javascript"></script>
        <script src="../asset/js/model.js" type="text/javascript" ></script>
        <script src="../asset/js/image.js" type="text/javascript"></script>
        <script type="text/javascript">
            try {
                if (document.getElementById("body-search-box")) {
                    autocomplete(document.getElementById("body-search-box"), autoCompleteKeywordList, rs);
                }
            } catch (e) {
                console.log("cosole.log mesg => " + e);
            }

        </script>
    </body>
</html>
