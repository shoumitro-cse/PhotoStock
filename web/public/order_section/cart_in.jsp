<%@page import="com.account.ShoppingCart"%>
<%
    String cart_image_id = request.getParameter("cart_image_id");
    String cart_user_id = session.getAttribute("user_id").toString();

    if (cart_image_id != null && cart_user_id != null) {
        int image_id = Integer.parseInt(cart_image_id);
        int user_id = Integer.parseInt(cart_user_id);

        ShoppingCart shoppingCart = new ShoppingCart();
        int shopping_id = shoppingCart.getShoppingId(user_id);
        if (shopping_id != 0) {
            shoppingCart.setShoppingCart(shopping_id, image_id, user_id);
        }

    }

//    System.out.println("cart_in ...........");
//    System.out.println(cart_image_id);
//    System.out.println(cart_user_id);
//    System.out.println("cart_in ...........");
%>