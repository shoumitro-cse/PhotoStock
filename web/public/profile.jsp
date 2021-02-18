<%-- 
    Document   : profile
    Created on : Jun 29, 2020, 8:07:21 AM
    Author     : shoumitro
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="../asset/images/web_icon/ps_small.png"/>
        <link rel="stylesheet" href="../asset/css/font-awesome.css" />
        <link rel="stylesheet" href="../asset/css/common.css" />
        <link rel="stylesheet" href="../asset/css/my_section.css" />
        <link rel="stylesheet" href="../asset/css/profile.css" />
        <title>Profile</title>
        <style>
        </style>
    </head>
    <body>
        <%
            if (session.getAttribute("login") != null) {
                if (!(Boolean.parseBoolean(session.getAttribute("login").toString()))) {
                    response.sendRedirect("index.jsp");
                }
            } else {
                response.sendRedirect("index.jsp");
            }
        %>

        <%@include file="header.jsp" %>
        <%@include file="shopping_cart_menu.jsp" %>

        <section>
            <div class="content-section">
                <!--for side account side menu-->
                <%@include file="account_section/acc_side_menu.jsp" %>
                <!-- Main Content -->
                <div class="column-9">
                    <main id="main-tab-content" class="main-content">
                        <%@include file="account_section/profile.jsp" %>
                        <%--<%@include file="account_section/wish_list.jsp" %>--%>

                    </main>
                </div>
            </div>
        </section>
        <!--for footer-->              
        <%@include file="footer.jsp" %>
        <script>
            var activeId = "profile";
        </script>
        <script src="../asset/js/common.js" type="text/javascript"></script>
        <script src="../asset/js/profile.js" type="text/javascript"></script>
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
