
<%@page import="com.admin.Contact"%>
<%

    int user_id = 0;
    if (session.getAttribute("user_id") != null) {
        String cart_user_id = session.getAttribute("user_id").toString();
        if (cart_user_id != null) {
            user_id = Integer.parseInt(cart_user_id);
        }
    }

    String fullname = request.getParameter("fullname");
    String email = request.getParameter("email");
    String msg = request.getParameter("msg");

    if (fullname != null && email != null && msg != null) {
        Contact.insertContactMessage(fullname, email, msg, user_id);
        response.sendRedirect("../contact.jsp");

    }


%>