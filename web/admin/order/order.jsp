<%-- 
    Document   : order
    Created on : Jul 29, 2020, 1:23:36 AM
    Author     : shoumitro
--%>

<%-- 
    Document   : user
    Created on : Jul 22, 2020, 10:41:52 AM
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
        <title>Order</title>
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
                        <p class="panel-head">Order</p>
                        <main>
                            <!-- for code separate file-->
                            <div class="btn-content">
                                <ul>
                                    
                                    <li><a href="total_order.jsp"><span class="fa fa-edit"></span> &nbsp;Order Item</a></li>
                                    <li><a href="purchase.jsp"><span class="fa fa-edit"></span> &nbsp;Purchase</a></li>
                                    <li><a href="payment.jsp"><span class="fa fa-edit"></span> &nbsp;Payment</a></li>
                                    <li><a href="invoice.jsp"><span class="fa fa-edit"></span> &nbsp;Invoice</a></li>
                                  
                                    <li><a href="credit_card.jsp"><span class="fa fa-edit"></span> &nbsp;Credit card</a></li>
                                    <li><a href="card_verify_trim.jsp"><span class="fa fa-edit"></span>&nbsp;Verify Trim</a></li>
                                    <li><a href="billing_addr.jsp"><span class="fa fa-edit"></span> &nbsp;Billing addr</a></li>
                                    
                                    <li><a href="shopping_cart.jsp"><span class="fa fa-edit"></span>&nbsp;ShoppingCart</a></li>
                                    <li><a href="wishlist.jsp"><span class="fa fa-edit"></span>&nbsp;Wishlist</a></li>
                                    
                                    <li><a href="notice.jsp"><span class="fa fa-edit"></span>&nbsp;Notice</a></li>
                                    
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
