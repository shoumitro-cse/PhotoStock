
<%@page import="com.admin.Contact"%>
<%
    int contact_id = 0;
    String contact_id_text = request.getParameter("contact_id");

    try {
        contact_id = Integer.parseInt(contact_id_text.toString().trim());
    } catch (Exception e) {
        contact_id = 0;
    }
    
    if( contact_id != 0) {
        Contact.deleteMsg(contact_id);
        response.sendRedirect("message.jsp");
    }

%>