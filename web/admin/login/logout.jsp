
<%@page import="com.admin.AdminAccount"%>
<%

    int admin_id = 0;
    if (session.getAttribute("admin_id") != null) {
        String admin_id_text = session.getAttribute("admin_id").toString();
        if (admin_id_text != null && admin_id_text != "") {
            admin_id = Integer.parseInt(admin_id_text);
        }
    }

    AdminAccount.setIsActive(false, admin_id);

    session.setAttribute("admin_login", "");
    session.setAttribute("admin_id", "");
    response.sendRedirect("../login/login.jsp");
%>