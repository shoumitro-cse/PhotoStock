
<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.account.WishList"%>
<%
    int user_id = 0;
    if (session.getAttribute("user_id") != null) {
        String cart_user_id = session.getAttribute("user_id").toString();
        if (cart_user_id != null) {
            user_id = Integer.parseInt(cart_user_id);
        }
    }

    WishList wishlist = new WishList();
    List wishlistProduuct = wishlist.getWishlistCartImage(user_id);
    List li = (List) wishlistProduuct.get(0);
    List li2 = (List) wishlistProduuct.get(1);

    // System.out.println(li2.get(0));
    Iterator it = li.iterator();
%>

<section class="wishlist">
    <div class="wishlist-heading">
        <h4>My Wishlist</h4>
        <p>You have <% out.write(li2.get(0).toString()); %> image(s) in your wishlist. </p>
    </div>
    <%
        while (it.hasNext()) {
            Map map = (Map) it.next();
    %>
    <div class="wishlist-content">
        <div class="image-content">
            <a href="image.jsp?id=<% out.write(map.get("image_id").toString()); %>" class="text-dark">
                <figure class="heading-img">
                    <img src="../asset/<% out.write(map.get("largeImage").toString()); %>" width="150px" alt="">
                </figure>
            </a>
            <div class="image-meta-content">
                <p class="title"><% out.write(map.get("header").toString()); %></p>
                <p class="atrist"><% out.write(map.get("desginer_name").toString()); %></p>
                <div class="price">
                    <p>$<% out.write(map.get("alternatePrice").toString()); %> <strike class="original-price">$<% out.write(map.get("unitPrice").toString()); %></strike></p>
                </div>
                <div class="ratings">
                    <span>      
                        <%
                            if (map.get("ratings") != null) {
                                out.write(map.get("ratings").toString());
                            } else {
                                out.write("0");
                            }
                        %>
                        Ratings |  
                        <%
                            if (map.get("reviews") != null) {
                                out.write(map.get("reviews").toString());
                            } else {
                                out.write("0");
                            }
                        %>

                        Reviews</span>
                </div>
                <button onclick="moveToCart(<% out.write(map.get("image_id").toString()); %>)" class="cart-btn">
                    <img  src="../asset/images/web_icon/cart-btn.svg" alt="cart-icon">
                    <span>Add to Cart</span>
                </button>
            </div>

            <div class="action">
                <!--<span onclick="alertMessage(this, 167329)" class="fa fa-trash"></span>-->
                <img onclick="deleteCartItem(<% out.write(map.get("image_id").toString()); %>)" src="../asset/images/web_icon/ios-trash.svg" alt=""/>
            </div>
        </div>
    </div>
    <%}%>
    <div class="load-more">
        <button class="load-more-btn" type="button"  class="d-none">Load More</button>
    </div>

</section>
