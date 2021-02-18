
<%@page import="java.util.List"%>
<%@page import="com.admin.AdminAccount"%>
<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    if (email != null && email != "" && password != null && password != "") {
        List list = AdminAccount.checkAdminAccount(email.toString().trim(), password.toString().trim());

        if (list.size() > 0) {
            boolean bool = (boolean) list.get(0);
            int admin_id = (int) list.get(1);
            if (bool && admin_id != 0) {
                out.write("True");
                session.setAttribute("admin_login", bool);
                session.setAttribute("admin_id", admin_id);
                response.sendRedirect("../dashboard/index.jsp");
            } else {
                out.write("password are not match");
            }
        }

    } 

%>