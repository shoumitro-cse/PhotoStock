
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.List"%>
<%@page import="com.account.WishList"%>
<%
    String wishlist = request.getParameter("wishlist");
    String cart_image_id = request.getParameter("cart_image_id");
    String cart_user_id = session.getAttribute("user_id").toString();

    int image_id = 0, user_id = 0;
    if (cart_image_id != null ) {
        image_id = Integer.parseInt(cart_image_id);
    }
    if (cart_user_id != null) {
        user_id = Integer.parseInt(cart_user_id);
    }

    WishList wishList = new WishList();
    if (wishlist.contentEquals("insert")) {
        wishList.insert(image_id, user_id);

    }
    if (wishlist.contentEquals("exit")) {
        wishList.exit(image_id, user_id);

    }
    if (wishlist.contentEquals("active")) {
        List list = wishList.getWishlistImage(user_id);

        JSONObject obj = new JSONObject();
        obj.put("imageListId", list);
        out.write(obj.toJSONString());

    }
    if (wishlist.contentEquals("moveTocart")) {
        System.out.println("moveTocart");
    }
%>