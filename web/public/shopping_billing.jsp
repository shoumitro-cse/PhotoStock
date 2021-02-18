<%-- 
    Document   : shopping_billing
    Created on : Jun 28, 2020, 9:40:16 AM
    Author     : shoumitro
--%>

<%@page import="java.util.Iterator"%>
<%@page import="com.account.BillingAddress"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="../asset/images/web_icon/ps_small.png"/>
        <title>Shopping Billing</title>
        <link rel="stylesheet" href="../asset/css/font-awesome.css" />
        <link rel="stylesheet" href="../asset/css/ionicons.css" />
        <link rel="stylesheet" href="../asset/css/common.css" />
        <link rel="stylesheet" href="../asset/css/cart.css" />
        <link rel="stylesheet" href="../asset/css/shopping_billing.css" />
        <link rel="stylesheet" href="../asset/css/my_section.css" />
        <link rel="stylesheet" href="../asset/css/payment.css" />
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
            ShoppingCart shoppingCart = new ShoppingCart();
        %>


        <!--for header-->
        <%@include file="header.jsp" %>
        <%@include file="shopping_cart_menu.jsp" %>
        <%@include file="account_section/acc_side_menu.jsp" %>

        <section class="shopping-bill">

            <div class="sp-row">
                <div class="sp-col-70">
                    <div class="sp-container">
                        <form id="shopping_billing_form" action="billing/billing_info_insert.jsp" method="post" >
                            <div class="sp-row">
                                <%
                                    BillingAddress billingAddress = new BillingAddress();
                                    List bill_list = billingAddress.getBillingAddress(user_id);
                                    Iterator it = bill_list.iterator();
                                    if (it.hasNext()) {
                                        Map billingMap = (Map) it.next();
                                %>

                                <div class="sp-col-50">
                                    <h3>Billing Address</h3>
                                    <label for="fullname"><i class="fa fa-user"></i> Full Name</label>
                                    <input type="text" id="fullname" name="fullname" value="<% out.write(billingMap.get("full_name").toString()); %>" placeholder="John M. Doe">
                                    <label for="email"><i class="fa fa-envelope"></i> Email</label>
                                    <input type="email" id="email" name="email" value="<% out.write(billingMap.get("email").toString()); %>" placeholder="john@example.com">
                                    <label for="adr"><i class="fa fa-address-card-o"></i> Address</label>
                                    <input type="text" id="adr" value="<% out.write(billingMap.get("address").toString()); %>" name="address" placeholder="542 W. 15th Street">
                                    <label for="city"><i class="fa fa-institution"></i> City</label>
                                    <input type="text" id="city" value="<% out.write(billingMap.get("city").toString()); %>" name="city" placeholder="New York">

                                    <div class="sp-row">
                                        <div class="sp-col-50">
                                            <label for="state">State</label>
                                            <input type="text" id="state" name="state" value="<% out.write(billingMap.get("state").toString()); %>" placeholder="NY">
                                        </div>
                                        <div class="sp-col-50">
                                            <label for="zip">Zip</label>
                                            <input type="text" id="zip" name="zip" value="<% out.write(billingMap.get("zip").toString()); %>" placeholder="10001">
                                        </div>
                                    </div>
                                </div>
                                <% } else {%>

                                <div class="sp-col-50">
                                    <h3>Billing Address</h3>
                                    <label for="fullname"><i class="fa fa-user"></i> Full Name</label>
                                    <input type="text" id="fullname" name="fullname" placeholder="John M. Doe">
                                    <label for="email"><i class="fa fa-envelope"></i> Email</label>
                                    <input type="email" id="email" name="email" placeholder="john@example.com">
                                    <label for="adr"><i class="fa fa-address-card-o"></i> Address</label>
                                    <input type="text" id="adr" name="address" placeholder="542 W. 15th Street">
                                    <label for="city"><i class="fa fa-institution"></i> City</label>
                                    <input type="text" id="city" name="city" placeholder="New York">

                                    <div class="sp-row">
                                        <div class="sp-col-50">
                                            <label for="state">State</label>
                                            <input type="text" id="state" name="state" placeholder="NY">
                                        </div>
                                        <div class="sp-col-50">
                                            <label for="zip">Zip</label>
                                            <input type="text" id="zip" name="zip" placeholder="10001">
                                        </div>
                                    </div>
                                </div>

                                <%  } %>


                                <%
                                    BillingAddress creditCardAddress = new BillingAddress();
                                    List creditInfo_list = creditCardAddress.getCreditCardAddress(user_id);
                                    Iterator creditInfo_listIt = creditInfo_list.iterator();
                                    if (creditInfo_listIt.hasNext()) {
                                        Map creditMap = (Map) creditInfo_listIt.next();
                                        System.out.println(creditMap.get("billing_addr_id"));
                                        System.out.println(creditMap.get("exp_month"));
                                %>
                                <div class="sp-col-50">
                                    <h3>Payment</h3>
                                    <label for="fname">Accepted Cards</label>
                                    <div class="icon-container">
                                        <i class="fa fa-cc-visa" style="color:navy;"></i>
                                        <i class="fa fa-cc-amex" style="color:blue;"></i>
                                        <i class="fa fa-cc-mastercard" style="color:red;"></i>
                                        <i class="fa fa-cc-discover" style="color:orange;"></i>
                                    </div>
                                    <label for="cname">Name on Card</label>
                                    <input type="text" id="cname" name="cardname" value="<% out.write(creditMap.get("card_name").toString()); %>" placeholder="John More Doe">
                                    <label for="ccnum">Credit card number</label>
                                    <input type="text" id="ccnum" name="cardnumber" value="<% out.write(creditMap.get("card_number").toString()); %>" placeholder="1111-2222-3333-4444">
                                    <label for="expmonth">Exp Month</label>
                                    <input type="text" id="expmonth" name="expmonth" value="<% out.write(creditMap.get("exp_month").toString()); %>" placeholder="September">
                                    <div class="sp-row">
                                        <div class="sp-col-50">
                                            <label for="expyear">Exp Year</label>
                                            <input type="text" id="expyear" name="expyear" value="<% out.write(creditMap.get("exp_year").toString()); %>" placeholder="2018">
                                        </div>
                                        <div class="sp-col-50">
                                            <label for="cvv">CVV</label>
                                            <input type="text" id="cvv" name="cvv" value="<% out.write(creditMap.get("cvv").toString()); %>" placeholder="352">
                                        </div>
                                    </div>
                                </div>
                                <% } else {%>
                                <div class="sp-col-50">
                                    <h3>Payment</h3>
                                    <label for="fname">Accepted Cards</label>
                                    <div class="icon-container">
                                        <i class="fa fa-cc-visa" style="color:navy;"></i>
                                        <i class="fa fa-cc-amex" style="color:blue;"></i>
                                        <i class="fa fa-cc-mastercard" style="color:red;"></i>
                                        <i class="fa fa-cc-discover" style="color:orange;"></i>
                                    </div>
                                    <label for="cname">Name on Card</label>
                                    <input type="text" id="cname" name="cardname" placeholder="John More Doe">
                                    <label for="ccnum">Credit card number</label>
                                    <input type="text" id="ccnum" name="cardnumber" placeholder="1111-2222-3333-4444">
                                    <label for="expmonth">Exp Month</label>
                                    <input type="text" id="expmonth" name="expmonth" placeholder="September">
                                    <div class="sp-row">
                                        <div class="sp-col-50">
                                            <label for="expyear">Exp Year</label>
                                            <input type="text" id="expyear" name="expyear" placeholder="2018">
                                        </div>
                                        <div class="sp-col-50">
                                            <label for="cvv">CVV</label>
                                            <input type="text" id="cvv" name="cvv" placeholder="352">
                                        </div>
                                    </div>
                                </div>
                                <% } %>

                            </div>
                            <label>
                                <!--<input type="checkbox" checked="checked" name="sameadr"> Shipping address same as billing-->
                                <input type="checkbox" checked="checked" name="sameadr">  Save card & Remember me
                            </label>
                            <input id="billing_submit_btn" type="submit" value="Continue to checkout" class="sp-btn">
                        </form>
                    </div>
                </div>
                <div class="sp-col-30">
                    <div class="sp-container fixed-container">
                        <div class="fixed-checkout">
                            <section class="check-sidebar check-sidebar-pd-0">
                                <div class="checkout-sidebar-header">
                                    <h1>Checkout Summary</h1>
                                </div>
                                <div class="checkout-sidebar-content">
                                    <div class="payment-breakdown">
                                        <h3>Payment Details</h3>
                                        <table class="table">
                                            <tbody>
                                                <%
                                                    double totalPrice = 0.0, totalSaveMony = 0.0;

                                                    List shoppingCheckOutList = shoppingCart.getShoppingCartCount(user_id);
                                                    if (shoppingCheckOutList.size() >= 3) {

//                                                        System.out.println("*************************");
                                                        int item_count = (int) shoppingCheckOutList.get(0);
                                                        totalPrice = (double) shoppingCheckOutList.get(1);
                                                        totalSaveMony = (double) shoppingCheckOutList.get(2);
                                                %>
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
                                                <% }%>
                                            </tbody>
                                        </table>
                                    </div>
                                </div> <!--End checkout-sidebar__content -->
                            </section>
                        </div>
                    </div>

                </div>
            </div>
        </section>
        <%@include file="billing/payment.jsp" %>

        <!--for footer-->
        <%@include file="footer.jsp" %>
        <script src="../asset/js/common.js" type="text/javascript"></script>
        <script src="../asset/js/shopping_billing.js" type="text/javascript"></script>
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
