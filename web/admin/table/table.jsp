<%-- 
    Document   : table
    Created on : Jul 24, 2020, 7:36:53 AM
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
        <title>Table</title>
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
                        <p class="panel-head">Table Analysis</p>
                        <div class="search-content">
                            <input oninput="searchButton(this)" type="search" name="s_b" placeholder="Search..." />
                        </div>
                        <main>
                            <!-- for code separate file-->
                            <div class="btn-content">
                                <ul>

                                    <!--for admin-->
                                    <li><a href="../admin_account/view.jsp"><span class="fa fa-edit"></span> &nbsp;Admin</a></li>


                                    <!--for designer-->
                                    <li><a href="../designer/view.jsp"><span class="fa fa-edit"></span> &nbsp;Designer</a></li>
                                    <li><a href="../designer/work.jsp"><span class="fa fa-edit"></span> &nbsp;Work</a></li>


                                    <!--for image-->
                                    <li><a onclick="sessionStorage.setItem('active_tab_id', 'intro_image')" href="../image/view.jsp"><span class="fa fa-edit"></span> &nbsp;Image</a></li>
                                    <li><a onclick="sessionStorage.setItem('active_tab_id', 'tab_stock')" href="../image/view.jsp"><span class="fa fa-edit"></span> &nbsp;Stock</a></li>
                                    <li><a onclick="sessionStorage.setItem('active_tab_id', 'tab_pricing')" href="../image/view.jsp"><span class="fa fa-edit"></span> &nbsp;Pricing</a></li>
                                    <li><a onclick="sessionStorage.setItem('active_tab_id', 'tab_meta')" href="../image/view.jsp"><span class="fa fa-edit"></span> &nbsp;Meta</a></li>
                                    <li><a onclick="sessionStorage.setItem('active_tab_id', 'tab_stock_end_table_image')" href="../image/view.jsp"><span class="fa fa-edit"></span> &nbsp;Stock End</a></li>
                                    <li><a href="../category/category.jsp"><span class="fa fa-edit"></span> &nbsp;Category</a></li>


                                    <!--for user-->
                                    <li><a href="../user/all.jsp"><span class="fa fa-edit"></span> &nbsp;User</a></li>
                                    <li><a href="../user/simple.jsp"><span class="fa fa-edit"></span> &nbsp;Simple</a></li>
                                    <li><a href="../user/company.jsp"><span class="fa fa-edit"></span> &nbsp;Company</a></li>
                                    <li><a href="../user/active.jsp"><span class="fa fa-edit"></span> &nbsp;Active</a></li>
                                    <li><a href="../user/message.jsp"><span class="fa fa-edit"></span> &nbsp;Message</a></li>
                                    <li><a href="../user/contact.jsp"><span class="fa fa-edit"></span> &nbsp;Contact</a></li>

                                    <!--for order-->
                                    <li><a href="../order/total_order.jsp"><span class="fa fa-edit"></span> &nbsp;Order Item</a></li>
                                    <li><a href="../order/purchase.jsp"><span class="fa fa-edit"></span> &nbsp;Purchase</a></li>
                                    <li><a href="../order/payment.jsp"><span class="fa fa-edit"></span> &nbsp;Payment</a></li>
                                    <li><a href="../order/invoice.jsp"><span class="fa fa-edit"></span> &nbsp;Invoice</a></li>
                                    <li><a href="../order/credit_card.jsp"><span class="fa fa-edit"></span> &nbsp;Credit card</a></li>
                                    <li><a href="../order/card_verify_trim.jsp"><span class="fa fa-edit"></span>&nbsp;Verify Trim</a></li>
                                    <li><a href="../order/billing_addr.jsp"><span class="fa fa-edit"></span> &nbsp;Billing addr</a></li>
                                    <li><a href="../order/shopping_cart.jsp"><span class="fa fa-edit"></span>&nbsp;ShoppingCart</a></li>
                                    <li><a href="../order/wishlist.jsp"><span class="fa fa-edit"></span>&nbsp;Wishlist</a></li>
                                    <li><a href="../order/notice.jsp"><span class="fa fa-edit"></span>&nbsp;Notice</a></li>


                                    <!--for Chart-->
                                    <li><a href="../chart/pie_chart.jsp"><span class="fa fa-edit"></span> &nbsp;Pie Chart</a></li>
                                    <li><a href="../chart/area.jsp"><span class="fa fa-edit"></span> &nbsp;Area Chart</a></li>
                                    <li><a href="../chart/line_chart.jsp"><span class="fa fa-edit"></span> &nbsp;Line Chart</a></li>
                                    <li><a href="../chart/visited_users.jsp"><span class="fa fa-edit"></span> &nbsp;Visited Users</a></li>
                                    <li><a href="../chart/user_count.jsp"><span class="fa fa-edit"></span>&nbsp;Today Visitors</a></li>


                                </ul>
                            </div>
                        </main>
                    </div>
                </div>

            </div>
        </section>


        <script src="../../asset/js/admin/common.js" type="text/javascript"></script>
        <!--for footer-->
        <%@include file="../dashboard/footer.jsp" %>

    </body>
</html>
