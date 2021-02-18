<%-- 
    Document   : login
    Created on : Jul 5, 2020, 9:04:25 PM
    Author     : shoumitro
--%>

<%@page import="com.account.UserAccount" %>
<%@page import="org.json.simple.JSONObject" %>
<%
//    System.out.println("Login");
    try {
        //out.write(request.getRequestURI());
        session.setAttribute("login", false);

        //for login
        String login_email = request.getParameter("login_email");
        String login_password = request.getParameter("login_password");

        UserAccount uc = new UserAccount();

        //emali and password check for old account
        if (uc.accountCheck(login_email, login_password)) {
            session.setAttribute("login", true);
            // response.sendRedirect("../index.jsp");
            JSONObject obj = new JSONObject();
            obj.put("login_user_id", new Boolean(true));
            out.write(obj.toJSONString());

            int user_id = uc.getEnterUserId(login_email, login_password);
            int active_id;

//            System.out.println(user_id);
            
            if (user_id != 0) {

                // enter visited user
                boolean bool = UserAccount.dayChange();
                if (bool) {
                    // delete all visited_users_count table record
                    UserAccount.deleteVisitedUserRecord();
                    // enter new visited_users_chart record
                    UserAccount.enterNewChartRecord();
                    // enter new visit user
                    UserAccount.enterVisitedUser(user_id);
                    System.out.println("New Day");
                } else {
                    UserAccount.enterVisitedUser(user_id);
                    System.out.println("Same Day");
                }

                active_id = uc.userEnter(user_id);
                session.setAttribute("user_id", user_id);

                if (active_id != 0) {
                    session.setAttribute("active_id", active_id);
                }
                
                session.setAttribute("designer_id", null);
                session.setAttribute("employee_email", null);

            }

        } else {
            session.setAttribute("login", false);
            //out.write("Invalid User");
            JSONObject obj = new JSONObject();
            obj.put("login_user_id", new Boolean(false));
            out.write(obj.toJSONString());
        }
    } catch (Exception e) {
        System.out.println("SignIn error occur");
        out.write("SignIn error occur");
        //response.sendRedirect("../index.jsp");
    }
%>
