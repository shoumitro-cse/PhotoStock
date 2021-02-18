
<%@page import="com.admin.AdminAccount"%>
<%
    String page_name = request.getParameter("page");
    String admin_id = request.getParameter("admin_id");
    String fullname = request.getParameter("fullname");
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    if (fullname != null && fullname != "" && email != null && email != "" && password != null && password != "") {
        AdminAccount.insertAdmin(fullname, email, password);
    }
    
    if (page_name != null && page_name != "") {
        response.sendRedirect(page_name);
    }


%>