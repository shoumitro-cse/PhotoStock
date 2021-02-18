<%@page import="java.util.List"%>
<%@page import="com.account.ShoppingCart"%>
<%@page import="org.json.simple.JSONObject" %>
<%
    int user_id = 0;
    String cart_user_id = session.getAttribute("user_id").toString();
    if (cart_user_id != null) {
        user_id = Integer.parseInt(cart_user_id);
    }
    ShoppingCart shoppingCart = new ShoppingCart();
    List cartImageList = shoppingCart.getCartImage(user_id);
    
//    for (int i = 0; i < cartImageList.size(); i++) {
//        System.out.println(cartImageList.get(i));
//    }

    JSONObject obj = new JSONObject();
    obj.put("imageListId", cartImageList);
    out.write(obj.toJSONString());
%>