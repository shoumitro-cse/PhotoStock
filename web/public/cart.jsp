<%-- 
    Document   : cart
    Created on : Jun 24, 2020, 11:04:31 AM
    Author     : shoumitro
--%>

<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.account.ShoppingCart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="../asset/images/web_icon/ps_small.png"/>
        <title>My Cart | PhotoStock</title>
        <link rel="stylesheet" href="../asset/css/font-awesome.css" />
        <link rel="stylesheet" href="../asset/css/common.css" />
        <link rel="stylesheet" href="../asset/css/cart.css" />
        <link rel="stylesheet" href="../asset/css/my_section.css" />
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
            ShoppingCart shoppingCart = new ShoppingCart();
            List list;
            int user_id = 0;
            if (session.getAttribute("user_id") != null) {
                String cart_user_id = session.getAttribute("user_id").toString();
                if (cart_user_id != null) {
                    user_id = Integer.parseInt(cart_user_id);
                }
            }
            list = shoppingCart.getShoppingCartList(user_id);
        %>
        <%@include file="header.jsp" %>
        <%@include file="shopping_cart_menu.jsp" %>
        <%@include file="account_section/acc_side_menu.jsp" %>

        <!--for cart-->
        <div id="cart-page">
            <div class="container">
                <!-- End Transparent Message -->
                <div class="row-gp row-gp-block">

                    <div class="col-8-gp">
                        <%
                            List shoppingList = (List) list.get(0);
                            Iterator iteratorShoppingList = shoppingList.iterator();
                            while (iteratorShoppingList.hasNext()) {
                                Map map = (Map) iteratorShoppingList.next();
                        %>
                        <section class="checkout-header mr-20">
                            <h1 class="align-self-center" id="numberofimage">My Cart <span class="small-text">(<% out.write(map.get("item_count").toString()); %> Item)</span></h1>
                            <h1 class="text-right" id="payabletotaltext">
                                Total:
                                <span id="payabletotal"><% out.write("$" + map.get("totalPrice").toString()); %></span>
                                <p class="total-saving text-right w-100">
                                    You are saving total <span id="saveTotal"><% out.write("$" + map.get("totalSaveMony").toString()); %></span>
                                </p>
                            </h1>
                        </section>
                        <% } %>

                        <%
                            int empty_stock = 0;
                            
                            List itemList = (List) list.get(1);
                            Iterator iteratorItemList = itemList.iterator();
                            if (iteratorItemList.hasNext()) {
                                while (iteratorItemList.hasNext()) {
                                    Map map = (Map) iteratorItemList.next();
                                    int current_stock = (int) map.get("current_stock");

                        %>

                        <!--for cart item-->
                        <section id="cart-content" class="mr-20">
                            <!-- Single Cart Item -->
                            <div class="cart-item ">
                            <% if (current_stock != 0) { %> 
                                    <div class="row-gp no-gutters">
                                <% } else { %>
                                    <div style="opacity: .4" class="row-gp no-gutters">
                                    <% } %>
                                        <!-- Image Cover Section -->
                                        <div class="image-cover">
                                            <a target="_blank" href="">
                                                <img class="img-fluid" src="../asset/<% out.write(map.get("largeImage").toString()); %>" alt="">

                                            </a>
                                        </div>
                                        <!-- Image Info Section -->
                                        <div class="image-info-container">
                                            <div class="image-meta-content">
                                                <div class="image-meta-content-head">
                                                    <a target="" href="image.jsp?id=<% out.write(map.get("image_id").toString()); %>"><% out.write(map.get("header").toString()); %></a>
                                                    <p><% out.write(map.get("desginer_name").toString()); %></p>
                                                </div>
                                                <div class="image-meta-content-action">
                                                    <p>
                                                        <a href="">
                                                            <!--<span class="delete-icon fa fa-trash-o "></span>--> 
                                                            <img  onclick="deleteCartImage(<% out.write(map.get("image_id").toString()); %>)" src="../asset/images/web_icon/ios-trash.svg" width="25px" />
                                                        </a> 
                                                    </p>
                                                    <p> 
                                                        <a onclick="moveToWishList(<% out.write(map.get("image_id").toString()); %>)" href="">
                                                            <span class="wish-icon fa fa-heart"></span> Wishlist
                                                        </a> 
                                                    </p>
                                                </div>
                                            </div>
                                            <div class="quantity">
                                                <button onclick="quantityPlus(this, <% out.write(map.get("image_id").toString()); %>, <% out.write(map.get("current_stock").toString()); %>)" > <span class="fa fa-plus"></span> </button>
                                                <input readonly="true" oninput="quantityInput(this, <% out.write(map.get("image_id").toString()); %>)" type="text" value="<% out.write(map.get("quantity").toString()); %>" >
                                                <button onclick="quantityMinus(this, <% out.write(map.get("image_id").toString()); %>, <% out.write(map.get("current_stock").toString()); %>)" > <span class="fa fa-minus"></span> </button>

                                            </div>
                                            <div class="price">
                                                <p class="original-price"><strike><% out.write("$" + map.get("unitPrice").toString()); %></strike></p>
                                                <p><% out.write("$" + map.get("alternatePrice").toString()); %></p>
                                            </div>
                                        </div>
                                    </div>

                                    <%
                                        if (current_stock != 0) {
                                            
                                    %> 
                                    <div class="stock" >
                                        <span id="current_stock"><% out.write(map.get("current_stock").toString()); %></span><span> out of <% out.write(map.get("total_stock").toString()); %> items.</span>                                    

                                    </div>

                                    <%  } else {  empty_stock++;%>   

                                    <div style="color: red" class="stock" > Out of Stock.</div>

                                    <%  }  %>        
                                </div>
                                <!-- End Cart Item -->
                        </section>
                        <% } %>

                        <!--for footer checkout-->
                        <div class="checkout-footer mr-20">
                            <div class="row-gp">
                                <div class="c2">
                                    <% if(empty_stock == 0) { %>
                                    <a href="shopping_billing.jsp" class="btn shipping-btn"><span>Go to Shipping Page</span> </a>
                                    <% } else { %>
                                    <!--<a style="opacity: .7" onclick="" href="javascript:void(0)" class="btn shipping-btn"><span>Update Shipping Cart</span> </a>-->
                                    <a style="opacity: .7" onclick="" href="order_section/update_shopping_cart.jsp" class="btn shipping-btn"><span>Update Shipping Cart</span> </a>
                                    <% } %>
                                </div>
                            </div>
                        </div>
                        <% } else { %>

                        <div class="empty-cart" style="" >
                            <div class="empty-cart-content">
                                <img src="../asset/images/web_icon/icon_empty_cart.webp" />
                                <h1>Your Cart is Empty!</h1>
                                <p>Looks like you haven't made order yet.</p>
                                <div class="c2">
                                    <a onclick="" href="gallery.jsp" class="btn shipping-btn"><span>Continue to Shipping</span> </a>
                                </div>
                            </div>
                        </div>
                        <% } %>
                    </div>
                    <%
                        List shoppingCheckOutList = shoppingCart.getShoppingCartCount(user_id);
                        if (shoppingCheckOutList.size() >= 3) {

                            // System.out.println("*************************");
                            int item_count = (int) shoppingCheckOutList.get(0);
                            double totalPrice = (double) shoppingCheckOutList.get(1);
                            double totalSaveMony = (double) shoppingCheckOutList.get(2);
                    %>
                    <!--for payment-->
                    <div class="col-4-gp">
                        <div class="fixed-checkout">
                            <section class="check-sidebar">
                                <div class="checkout-sidebar-header">
                                    <h1>Checkout Summary</h1>
                                </div>
                                <div class="country">
                                    <select name="clientCountry" class="custom-select" >
                                        <option value="1" selected="">Bangladesh</option>
                                        <option value="2" selected="">India</option>
                                        <option value="3" selected="">USA</option>
                                        <option value="4" selected="">Nepal</option>
                                        <option value="4" selected="">Pakistan</option>
                                        <option value="4" selected="">China</option>
                                        <option value="4" selected="">Belgium</option>
                                    </select>
                                </div>
                                <div class="checkout-sidebar-content">
                                    <div class="payment-breakdown">
                                        <table class="table">
                                            <tbody>

                                                <tr>
                                                    <td>Regular price</td>
                                                    <td class="text-right" id="subtotal">$<% out.write(totalSaveMony + totalPrice + ""); %></td>
                                                </tr>
                                                <tr style="" id="discounttr2">
                                                    <td id="discounttext2">Discount</td>
                                                    <td class="text-right" id="discount2">$<% out.write(totalSaveMony + ""); %></td>
                                                </tr>
                                                <tr>
                                                    <td>Discount price</td>
                                                    <td class="text-right" id="total">$<% out.write(totalPrice + ""); %></td>
                                                </tr>
                                                <tr style="" id="wrappertr2">
                                                    <td id="wrappertext2">Gift Wrap</td>
                                                    <td class="text-right" id="wrapper2">$0</td>
                                                </tr>
                                                <tr>
                                                    <td>Delivery charge</td>
                                                    <td class="text-right" id="shipping">$0</td>
                                                </tr>
                                                <tr style="" id="payable">
                                                    <td class="payable-text">Payable Total</td>
                                                    <td class="payable-price" id="payable2">$<% out.write(totalPrice + ""); %></td>
                                                </tr>

                                            </tbody>
                                        </table>
                                    </div>

                                </div> <!--End checkout-sidebar__content -->
                            </section>
                        </div>
                        <!--End checkout-sidebar -->
                    </div>
                    <%}%>                     

                </div>
            </div>
        </div>

        <!--for footer-->
        <%@include file="footer.jsp" %>
        <script src="../asset/js/common.js" type="text/javascript"></script>
        <script src="../asset/js/cart.js" type="text/javascript"></script>
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
