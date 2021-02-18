
<%@page import="com.admin.AdminAccount"%>
<%
    String page_name = request.getParameter("page");
    String admin_id_text = request.getParameter("admin_id");
    String fullname = request.getParameter("fullname");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String new_pw = request.getParameter("new_pw");
    String confirm_pw = request.getParameter("confirm_pw");

//    page_name = "account.jsp";
    int admin_id = 0;
    if (admin_id_text != null && admin_id_text != "0") {
        admin_id = Integer.parseInt(admin_id_text);
    }

    if (fullname != null) {
        AdminAccount.updateAdminName(admin_id, fullname);
        response.sendRedirect(page_name);
    }

    if (email != null) {

        boolean ck_email_bool = AdminAccount.checkAdminEmail(email);
        if (ck_email_bool) {
            AdminAccount.updateAdminEmail(admin_id, email);
            response.sendRedirect(page_name);
        } else {
            if (page_name.contentEquals("account.jsp")) {
                response.sendRedirect(page_name + "?err=1");
            } else {
                response.sendRedirect(page_name + "&err=1");
            }
        }

    }

    if (password != null && confirm_pw != null && new_pw != null) {
        if (new_pw.contentEquals(confirm_pw)) {
            AdminAccount.updateAdminPassword(admin_id, password, new_pw, confirm_pw);
            response.sendRedirect(page_name);
        }
    }

%>