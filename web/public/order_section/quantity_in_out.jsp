<%@page import="com.account.ShoppingCart"%>
<%
    int image_id = 0, user_id = 0, q_value = 0;
    String quantity_type = request.getParameter("quantity_type");
    String quantity_image_id = request.getParameter("quantity_image_id");
    String quantity_value = request.getParameter("quantity_value");
    
    
    String cart_user_id = session.getAttribute("user_id").toString();

    if (quantity_image_id != null && cart_user_id != null) {
        image_id = Integer.parseInt(quantity_image_id);
        user_id = Integer.parseInt(cart_user_id);
        q_value = Integer.parseInt(quantity_value);
    }

    ShoppingCart shoppingCart = new ShoppingCart();
    if (quantity_type.contentEquals("q_plus")) {
//        }

//        if (true) {
        if (ShoppingCart.validQuantity(image_id, q_value)) {
            shoppingCart.setQuantityPlusMinus(image_id, user_id, q_value);
            shoppingCart.quantityIncrDecr(image_id, user_id, true);
        }

    }
    if (quantity_type.contentEquals("q_minus")) {
        shoppingCart.quantityIncrDecr(image_id, user_id, false);
        shoppingCart.setQuantityPlusMinus(image_id, user_id, q_value);
    }
//    if (quantity_type.contentEquals("q_input")) {
//        shoppingCart.setQuantityPlusMinus(image_id, user_id, q_value); 
//    }
%>