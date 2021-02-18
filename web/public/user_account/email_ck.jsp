<%@page import="com.account.UserAccount" %>
<%@page import="org.json.simple.JSONObject" %>
<%
    String email = request.getParameter("email");

    if (email != null) {
        UserAccount uc = new UserAccount();
        // email check for new account
        int email_check = uc.emailCheck(email);
        if (email_check == 1) {
//        error += "<br/> Email already exist.";
            JSONObject obj = new JSONObject();
            obj.put("email_exist_true", new Boolean(true));
            out.write(obj.toJSONString());
        }

    }
%>