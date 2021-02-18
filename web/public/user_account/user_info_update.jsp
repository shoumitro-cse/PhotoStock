
<%@page import="com.account.UserAccount"%>
<%@page import="com.account.UserAccountEdit"%>
<%

    try {
        int user_id = 0;
        if (session.getAttribute("user_id") != null) {
            String cart_user_id = session.getAttribute("user_id").toString();
            if (cart_user_id != null) {
                user_id = Integer.parseInt(cart_user_id);
            }
        }
        UserAccountEdit userAccountEdit = new UserAccountEdit();

        String first_name = request.getParameter("first_name");
        String surname = request.getParameter("surname");
        String dob = request.getParameter("dob");
        String gender = request.getParameter("gender");

        if (first_name != null && surname != null && dob != null && gender != null) {
            out.write(first_name + " " + surname + " " + dob + " " + gender);
            userAccountEdit.updateSimpleUserPersonalInfo(user_id, first_name, surname, dob, gender);
            response.sendRedirect("../profile.jsp");
        }

        String country = request.getParameter("country");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String permanent_addr = request.getParameter("permanent_addr");
        String current_addr = request.getParameter("current_addr");
        String zip = request.getParameter("zip");
        if (country != null && city != null && state != null && permanent_addr != null && current_addr != null && zip != null) {
            userAccountEdit.updateSimpleUserContactInfo(user_id, country, city, state, permanent_addr, current_addr, zip);
            response.sendRedirect("../profile.jsp");
        }

        // company user
        String company_name = request.getParameter("company_name");
        String company_country = request.getParameter("company_country");
        String company_city = request.getParameter("company_city");
        String company_addr = request.getParameter("company_address");

        String company_type = request.getParameter("company_type");
        String business_license_no = request.getParameter("business_license_no");
        String business_decr = request.getParameter("business_descr");
        String website_url = request.getParameter("website_url");

        if (first_name != null && surname != null && company_name != null && company_country != null && company_city != null && company_addr != null && company_type != null && business_license_no != null && business_decr != null && website_url != null) {
            userAccountEdit.updateCompanyUserPersonalAndContactInfo(user_id, first_name, surname, company_name, company_country, company_city, company_addr, company_type, business_license_no, business_decr, website_url);
            response.sendRedirect("../profile.jsp");
        }

        // company person 
        int person_id = 0;
        if (request.getParameter("person_id") != null) {
            person_id = Integer.parseInt(request.getParameter("person_id").toString());
        }

        String person_name = request.getParameter("person_name");
        String person_designation = request.getParameter("person_designation");
        String person_email = request.getParameter("person_email");
        String person_mobile = request.getParameter("person_mobile");
        if (person_id != 0 && person_name != null && person_designation != null && person_email != null && person_mobile != null) {
            userAccountEdit.updateCompanyUserContactPersonInfo(person_id, person_name, person_designation, person_email, person_mobile);

            response.sendRedirect("../profile.jsp");
        }

//        String picture_url = request.getParameter("picture_url");
//        if (picture_url != null) {
//            userAccountEdit.userPictureChange(user_id, picture_url);
//            out.write("Successful");
//        }
        String email = request.getParameter("email");
        if (email != null) {
            UserAccount uc = new UserAccount();
            int email_check = uc.emailCheck(email);
            if (email_check != 1) {
                userAccountEdit.userEmailChange(user_id, email);
                response.sendRedirect("../profile.jsp");
            }
        }

        String current_pw = request.getParameter("current_pw");
        String password = request.getParameter("password");
        String re_type_password = request.getParameter("re_type_password");
        if (current_pw != null && password != null && re_type_password != null) {
            if (password.contentEquals(re_type_password)) {
                if (password.length() >= 7) {
                    userAccountEdit.userPasswordChange(user_id, re_type_password, password, current_pw);
                    response.sendRedirect("../profile.jsp");
                }
            }
        }

    } catch (Exception e) {
        out.write(e.getMessage());
    }


%>