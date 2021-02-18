<%@page import="java.util.Iterator"%>
<%@page import="com.account.Order"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="../asset/images/web_icon/ps_small.png"/>
        <title>Purchase Image</title>
        <link rel="stylesheet" href="../asset/css/font-awesome.css"/>
        <link rel="stylesheet" href="../asset/css/common.css"/>
        <link rel="stylesheet" href="../asset/css/purchase.css"/>

    </head>
    <body>
        <%@include file="header.jsp" %>
        <!--for shopping menu-->
        <%@include file="shopping_cart_menu.jsp" %>
        <%@include file="account_section/acc_side_menu.jsp" %>
        <div class="purchase-content">
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
                int order_id = 0;
                if (request.getParameter("order_id") != null) {
                    order_id = Integer.parseInt(request.getParameter("order_id").toString());
                }

                int user_id = 0;
                if (session.getAttribute("user_id") != null) {
                    String cart_user_id = session.getAttribute("user_id").toString();
                    if (cart_user_id != null) {
                        user_id = Integer.parseInt(cart_user_id);
                    }
                }

                Order order = new Order();
                List list = order.getPurchaseImage(user_id, order_id);
                Iterator it = list.iterator();
                while (it.hasNext()) {
                    Map map = (Map) it.next();

//                    System.out.println(map.get("image_id"));
//                    System.out.println(map.get("header"));
//                    System.out.println("##############");
            %>
            <div class="purchase-item"> 
                <div class="item-content">
                    <div class="item-body" href="">
                        <img src="../asset/<%out.write(map.get("largeImage").toString());%>" alt=""/>
                        <h1 class="heading"><%out.write(map.get("header").toString());%></h1>
                        <p class="price-option">
                            <span class="discount-price"> <strong>$<%out.write(map.get("alternatePrice").toString());%></strong> </span>
                            <span class="regular-price"> <strike><strong>$<%out.write(map.get("unitPrice").toString());%></strong></strike></span>
                            <span class="percent">(<%out.write(map.get("percentRate").toString());%>%)</span>
                        </p>
                    </div>
                    <div class="link-content">
                        <a class="item-link" href="/photostock/image_download?image_id=<%out.write(map.get("image_id").toString());%>">Download zip file.</a>
                    </div>
                </div>
            </div>
            <% }%>

        </div>

        <div></div>

        <!--for footer-->
        <%@include file="footer.jsp" %>
        <script src="../asset/js/common.js" type="text/javascript"></script>
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
