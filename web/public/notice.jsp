<%-- 
    Document   : notice
    Created on : Jun 28, 2020, 2:39:34 PM
    Author     : shoumitro
--%>

<%@page import="com.admin.Image"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.account.Notice"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="../asset/images/web_icon/ps_small.png"/>
        <link rel="stylesheet" href="../asset/css/font-awesome.css" />
        <link rel="stylesheet" href="../asset/css/ionicons.css" />
        <link rel="stylesheet" href="../asset/css/common.css" />
        <link rel="stylesheet" href="../asset/css/notice.css" />
        <link rel="stylesheet" href="../asset/css/my_section.css" />
        <title>Notification</title>
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
        <%
            int user_id = 0;
            if (session.getAttribute("user_id") != null) {
                String cart_user_id = session.getAttribute("user_id").toString();
                if (cart_user_id != null) {
                    user_id = Integer.parseInt(cart_user_id);
                }
            }

            //notice read by user active = 0
            Notice.noticeNotActive(user_id);

            Notice notice = new Notice();
            List noticeList = notice.getAllNotification(user_id);
            Iterator itNotice = noticeList.iterator();

        %>
        <!--for header-->
        <%@include file="header.jsp" %>
        <%@include file="shopping_cart_menu.jsp" %>
        <%@include file="account_section/acc_side_menu.jsp" %>

        <div class="notification">
            <div class="nt-row">
                <div class="nt-col-4">
                    <div class="notice-side">
                        <h1 class="b-title">Best Seller Photographs</h1>

                        <%
                            List best_seller_list = Image.getBestSellerImage();

                            Iterator best_seller_list_it = (Iterator) best_seller_list.iterator();
                            while (best_seller_list_it.hasNext()) {
                                Map map = (Map) best_seller_list_it.next();


                        %>

                        <a href="image.jsp?id=<% out.write(map.get("image_id").toString()); %>">
                            <div class="sidebar-media">
                                <div class="sidebar-media-img">
                                    <img src="../asset/<% out.write(map.get("largeImage").toString()); %>" width="60px"/>
                                </div>
                                <div class="sidebar-media-body">
                                    <h1 class="img-title"><% out.write(map.get("header").toString()); %></h1>
                                    <p class="artist"><% out.write(map.get("desginer_name").toString()); %></p>
                                    <p style="display: flex;flex-wrap: nowrap;justify-content: space-between;" class="price">
                                        <span>$<% out.write(map.get("alternatePrice").toString()); %></span>
                                        <span style="color: gray;font-weight: bold" > <strike> $<% out.write(map.get("unitPrice").toString()); %></strike></span>
                                        <span class="price-text">(<% out.write(map.get("percentRate").toString()); %>% OFF)</span>
                                    </p>
                                </div>
                            </div>
                        </a>

                        <%  }  %>
                    </div>
                </div>

                <div class="nt-col-8">
                    <div class="notice-main-content">
                        <h1 class="notice-title">All Notifications (<% out.write(noticeList.size() + ""); %>)</h1>
                        <%
                            while (itNotice.hasNext()) {
                                Map map = (Map) itNotice.next();
                        %>
                        <div class="notice-media">
                            <span onclick="noticeDelete(<% out.write(map.get("notice_id").toString()); %>)" class=" close-btn fa fa-close" ></span>
                            <img src="../asset/images/web_icon/ps_small.png" />
                            <div class="notice-media-body">
                                <p class="notice-media-body-title">
                                    <strong class="new-dnone">New</strong> 
                                    <span class="text-muted">
                                        <% out.write(map.get("large_msg").toString()); %>..<br>( <% out.write(map.get("small_msg").toString()); %> )
                                    </span>
                                    <a href="order.jsp" class="link">Click Here</a>
                                </p>
                                <p class="notice-media-body-subtitle"><% out.write(map.get("notice_date").toString()); %></p>
                            </div>
                        </div>
                        <%}%>


                    </div>
                </div>
            </div>
        </div>

        <!--for footer-->
        <%@include file="footer.jsp" %>
        <script src="../asset/js/common.js" type="text/javascript"></script>
        <script src="../asset/js/notice.js" type="text/javascript"></script>
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
