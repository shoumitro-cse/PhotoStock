<%@page import="java.util.Map"%>
<%@page import="com.account.UserAccountEdit"%>
<%@page import="com.account.Notice"%>
<%@page import="com.account.WishList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.account.ShoppingCart"%>
<%
    ShoppingCart cartCount = new ShoppingCart();
    int floatingUser = 0;

    if (session.getAttribute("user_id") != null) {
        String cart_user_id2 = session.getAttribute("user_id").toString();
        if (cart_user_id2 != null) {
            floatingUser = Integer.parseInt(cart_user_id2);
        }
    }

    List countList = new ArrayList();
    try {
        countList = cartCount.getShoppingCartCount(floatingUser);
    } catch (Exception e) {
        System.out.println("Floating button error");
    }

    WishList wishcount = new WishList();
    List wishcountList = wishcount.getWishlistImage(floatingUser);

//    Notice noticeCount = new Notice();
//    List noticeCountList = noticeCount.getAllNotification(floatingUser);
//        System.out.println(noticeCountList.size());
//   Notice.getActiveNotice(floatingUser);


%>

<aside>
    <section class="floating-button ">
        <div class="btn-cart ">
            <% if (floatingUser == 0) {%>
            <a onclick="loginForm()" href="">
                <%  } else {%>
                <a href="notice.jsp">
                    <%  } %>
                    <div style="padding: 0;height: 40px;" class="count-wrapper">
                        <img style="max-width: 50px;height: 45px;" src="../asset/images/web_icon/bell.svg" alt="cart_icon" class="img-fluid">
                        <div class="count one-digit cart-quantity" style="visibility: inherit; opacity: 1;top: -14%;">
                            <%  out.write(Notice.getActiveNotice(floatingUser) + ""); %>
                        </div>
                    </div>
                    <p class="js--cart-amount amount">Notice</p>
                </a>
        </div> 
        <br/>
        <div class="btn-cart ">
            <% if (floatingUser == 0) {%>
            <a onclick="loginForm()" href="">
                <%  } else {%>
                <a href="cart.jsp">
                    <%  } %>
                    <div class="count-wrapper">
                        <img src="../asset/images/web_icon/floating_button_cart.webp" alt="cart_icon" class="img-fluid">
                        <div id="cart_quantity" class="count one-digit cart-quantity" style="visibility: inherit; opacity: 1;">
                            <%
                                if (countList.size() > 0) {
                                    out.write(countList.get(0).toString());
                                } else {
                                    out.write("0");

                                }
                            %>
                        </div>
                    </div>
                    <p class="js--cart-amount amount"><%
                        if (countList.size() > 1) {
                            out.write("$" + countList.get(1).toString());
                        } else {
                            out.write("$0");
                        }
                        %>
                    </p>
                </a>
        </div> 
        <br/>
        <div class="btn-wishlist">
            <% if (floatingUser == 0) {%>
            <a onclick="loginForm()" href="">
                <%  } else {%>
                <a href="wishlist.jsp">
                    <%  } %>
                    <div class="count-wrapper">
                        <img src="../asset/images/web_icon/floating_button_wishlist.webp" alt="wishlist_icon" class="img-fluid">
                        <div id="wishlist_count" class="count one-digit">
                            <%  out.write(wishcountList.size() + "");%>
                        </div>
                    </div>
                    <p class="text">Wishlist</p>
                </a>
        </div>
    </section>
</aside>
