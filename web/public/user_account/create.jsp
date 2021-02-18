<%-- 
    Document   : create
    Created on : Jul 5, 2020, 9:02:28 AM
    Author     : shoumitro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account create</title>
    </head>
    <body>
        <%@page import="com.account.UserAccount" %>
        <%
            try {
                String error = "";
                String ac = "";
                int err = 0;

                // common all user
                String first_name = request.getParameter("first_name");
                String surname = request.getParameter("surname");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String re_type_password = request.getParameter("re_type_password");

                if (password != null && re_type_password != null) {
                    if (password.contentEquals(re_type_password)) {
                        if (password.length() < 7) {
                            error += "<br/>password length less than six";
                            err = 1;
                        }
                    } else {
                        error += "<br/>password invalid";
                        err = 1;
                    }
                } else {
                    error += "<br/>password null";
                    err = 1;
                }

                String user_type = request.getParameter("user_type");
                if (user_type != null) {
                    if (user_type.equalsIgnoreCase("on")) {
                        user_type = "company";
                    } else {
                        user_type = "simple";
                    }
                } else {
                    user_type = "simple";
                    //error = "user type null";
                }

                // company user
                String company_name = request.getParameter("company_name");
                String company_country = request.getParameter("company_country");
                String company_city = request.getParameter("company_city");
                String company_addr = request.getParameter("company_addr");

                String company_type = request.getParameter("company_type");
                String business_license_no = request.getParameter("business_license_no");
                String business_decr = request.getParameter("business_decr");
                String website_url = request.getParameter("website_url");

                // company person 
                String person_name = request.getParameter("person_name");
                String person_designation = request.getParameter("person_designation");
                String person_email = request.getParameter("person_email");
                String person_mobile = request.getParameter("person_mobile");

                UserAccount uc = new UserAccount();
                // email check for new account
                int email_check = uc.emailCheck(email);
                if (email_check == 1) {
                    error += "<br/> Email already exist.";
                    err = 1;
                }
                //out.write(error);
                if (err == 0) {
                    String u = uc.account(first_name, surname, email, password, re_type_password, user_type, company_name, company_country, company_city, company_addr, company_type, business_license_no, business_decr, website_url, person_name, person_designation, person_email, person_mobile);
                    out.write(u);
                    response.sendRedirect("../index.jsp");
                } else {
                    out.write(error);
                }
            } catch (Exception e) {
                System.out.println("SignUp error occur.");
                out.write("SignUp error occur.");
                //response.sendRedirect("../index.jsp");
            }
        %>
    </body>
</html>
