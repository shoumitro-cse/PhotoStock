<%@page import="com.account.UserAccount" %>
<%
    try {
        session.setAttribute("login", false);
        //response.sendRedirect("../index.jsp");

        UserAccount uc = new UserAccount();

        String user_id = session.getAttribute("user_id").toString();
        String active_id = session.getAttribute("active_id").toString();

        if (user_id != null && active_id != null) {
            uc.exitUser(Integer.parseInt(user_id), Integer.parseInt(active_id));
            uc.userStayAmountOfTime(Integer.parseInt(user_id), Integer.parseInt(active_id));
            
            session.setAttribute("user_id",null);
            session.setAttribute("active_id",null);
        }
    } catch (Exception e) {
      out.write("logOut error occur.");
    }

%>