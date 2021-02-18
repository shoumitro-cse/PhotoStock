
<%@page import="com.account.ShoppingCart"%>
<%
    int user_id = 0;
    if (session.getAttribute("user_id") != null) {
        String cart_user_id = session.getAttribute("user_id").toString();
        if (cart_user_id != null) {
            user_id = Integer.parseInt(cart_user_id);
        }
    }

    ShoppingCart.updateShoppingCartRecord(user_id);
    response.sendRedirect("../cart.jsp");

%>