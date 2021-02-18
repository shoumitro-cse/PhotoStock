<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.account.UserAccountEdit"%>
<%
    int user_id = 0;
    if (session.getAttribute("user_id") != null) {
        String cart_user_id = session.getAttribute("user_id").toString();
        if (cart_user_id != null) {
            user_id = Integer.parseInt(cart_user_id);
        }
    }
    UserAccountEdit userAccountEdit = new UserAccountEdit();
    List userInfoList = userAccountEdit.getUserInfo(user_id);
    if (userInfoList.size() > 0) {
        Map map = (Map) userInfoList.get(0);
        if (map.get("user_id") != null) {
%>
<section class="profile">
    <!--for personal info-->

    <%
        if (map.get("user_id") != null && map.get("simple_user_id") != null && map.get("user_type").toString().trim().equalsIgnoreCase("simple")) {
            
    %>
    <div class="profile-heading">
        <span class="text">Personal Information</span>
        <span id="p_info_edit" class="edit" >Change <em>Information</em></span>
    </div>
    <form id="p_form_info" class="edit-form" action="user_account/user_info_update.jsp" method="get" >
        <div id="user_fullname" class="form-group">
            <div class="group-row">
                <label class="form-label">Full Name</label>
                <input id="user_fullname_input" type="text"  class="form-control" value="<% out.write(map.get("full_name").toString()); %>">
            </div>
        </div>
        <div id="user_fullname_group" class="pw-group">
            <div class="form-group m-5rem">
                <div class="group-row">
                    <label for="first_name" class="form-label">First Name</label>
                    <input type="text" name="first_name" class="form-control" value="<% out.write(map.get("first_name").toString()); %>" placeholder="First Name" />
                </div>
            </div>
            <div class="form-group">
                <div class="group-row">
                    <label for="surname" class="form-label">Surname </label>
                    <input type="text" name="surname" class="form-control" value="<% out.write(map.get("surname").toString()); %>" placeholder="Surname" />
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="group-row">
                <label for="dob" class="form-label">Your Date of Birth</label>
                <input id="date_field" type="text" name="dob" class="form-control" value="<%if (!map.get("dob").toString().trim().equalsIgnoreCase("null")) {
                        out.write(map.get("dob").toString());
                    } %>">

            </div>
        </div>
        <%
            String gender = map.get("gender").toString().trim();
//             out.write(gender.equalsIgnoreCase("null")+"");
            if (gender.equalsIgnoreCase("null") || gender.equalsIgnoreCase("")) {
        %>      
        <div class="form-group">
            <div class="gender-label">
                <label for="gender" >Gender</label>
            </div>
            <div class="radio-control">
                <label class="custom-radio-container">
                    <input class="custom-radio-control" value="Male" type="radio" name="gender">
                    <span class="checkmark"></span>
                </label>
                <label>Male</label>
            </div>
            <div class="radio-control">
                <label class="custom-radio-container">
                    <input class="custom-radio-control" value="Female" type="radio"  name="gender">
                    <span class="checkmark"></span>
                </label>
                <label> Female</label>
            </div>
        </div>
        <%}%>  
        <%
            if (gender.equalsIgnoreCase("male")) {
        %>      
        <div class="form-group">
            <div class="gender-label">
                <label for="gender" >Gender</label>
            </div>
            <div class="radio-control">
                <label class="custom-radio-container">
                    <input class="custom-radio-control" value="Male" type="radio" checked="checked" name="gender">
                    <span class="checkmark"></span>
                </label>
                <label>Male</label>
            </div>
            <div class="radio-control">
                <label class="custom-radio-container">
                    <input class="custom-radio-control" value="Female" type="radio"  name="gender">
                    <span class="checkmark"></span>
                </label>
                <label> Female</label>
            </div>
        </div>
        <%}%>  
        <%
            if (gender.equalsIgnoreCase("female")) {
        %>      
        <div class="form-group">
            <div class="gender-label">
                <label for="gender" >Gender</label>
            </div>
            <div class="radio-control">
                <label class="custom-radio-container">
                    <input class="custom-radio-control" value="Male" type="radio"  name="gender">
                    <span class="checkmark"></span>
                </label>
                <label>Male</label>
            </div>
            <div class="radio-control">
                <label class="custom-radio-container">
                    <input class="custom-radio-control" value="Female" type="radio" checked="checked"  name="gender">
                    <span class="checkmark"></span>
                </label>
                <label> Female</label>
            </div>
        </div>
        <% } %>  
        <input id="p_info_submit_btn" type="submit" class="btn-active"   value="Save">
        <span class="text-success" id="userInfoChangeMsg">Updated successfully</span>
    </form>
    <% } else { %>
    <!--for personal info-->
    <div class="profile-heading">
        <span class="text">Personal & Company Information</span>
        <span id="p_info_edit" class="edit" >Change <em>Information</em></span>
    </div>
    <form id="p_form_info" class="edit-form" action="user_account/user_info_update.jsp" method="get" >
        <div id="user_fullname" class="form-group">
            <div class="group-row">
                <label class="form-label">Full Name</label>
                <input id="user_fullname_input" type="text"  class="form-control" value="<% out.write(map.get("full_name").toString()); %>">
            </div>
        </div>
        <div id="user_fullname_group" class="pw-group">
            <div class="form-group m-5rem">
                <div class="group-row">
                    <label for="first_name" class="form-label">First Name</label>
                    <input type="text" name="first_name" class="form-control" value="<% out.write(map.get("first_name").toString()); %>" placeholder="First Name" />
                </div>
            </div>
            <div class="form-group">
                <div class="group-row">
                    <label for="surname" class="form-label">Surname </label>
                    <input type="text" name="surname" class="form-control" value="<% out.write(map.get("surname").toString()); %>" placeholder="Surname" />
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="group-row">
                <label for="company_name" class="form-label">Company Name</label>
                <input type="text" name="company_name" class="form-control" value="<% out.write(map.get("company_name").toString()); %>">
            </div>
        </div>
        <div class="form-group">
            <div class="group-row">
                <label for="company_country" class="form-label">Country</label>
                <input type="text" name="company_country" class="form-control" value="<% out.write(map.get("company_country").toString()); %>">
            </div>
        </div>
        <div class="form-group">
            <div class="group-row">
                <label for="company_city" class="form-label">City</label>
                <input type="text" name="company_city" class="form-control" value="<% out.write(map.get("company_city").toString()); %>">
            </div>
        </div>
        <div class="form-group">
            <div class="group-row">
                <label for="company_address" class="form-label">Company address</label>
                <input type="text" name="company_address" class="form-control" value="<% out.write(map.get("company_address").toString()); %>">
            </div>
        </div>
        <div class="form-group">
            <div class="group-row">
                <label for="company_type" class="form-label">Company Type</label>
                <input type="text" name="company_type" class="form-control" value="<% out.write(map.get("company_type").toString()); %>">
            </div>
        </div>
        <div class="form-group">
            <div class="group-row">
                <label for="business_license_no" class="form-label">Business license no : </label>
                <input type="text" name="business_license_no" class="form-control" value="<% out.write(map.get("business_license_no").toString()); %>">
            </div>
        </div>
        <div class="form-group">
            <div class="group-row">
                <label for="business_descr" class="form-label">Business description</label>
                <input type="text" name="business_descr" class="form-control" value="<% out.write(map.get("business_descr").toString()); %>">
            </div>
        </div>
        <div class="form-group">
            <div class="group-row">
                <label for="website_url" class="form-label">Website url</label>
                <input type="text" name="website_url" class="form-control" value="<% out.write(map.get("website_url").toString()); %>">
            </div>
        </div>

        <input id="p_info_submit_btn" type="submit" class="btn-active"  value="Save">
        <span class="text-success" id="userInfoChangeMsg">Updated successfully</span>
    </form>
    <% }%>


        <%
        if (map.get("user_id") != null && map.get("simple_user_id") != null && map.get("user_type").toString().trim().equalsIgnoreCase("simple")) {
//            System.out.println("user_id : " + map.get("user_id"));
//            System.out.println("simple_user_id : " + map.get("simple_user_id"));
    %>
    <!--for contact info-->
    <div class="profile-heading profile-top-border">
        <span class="text">User Contact Information</span>
        <span id="c_info_edit" class="edit">Change Contact <em>Information</em></span>
    </div>
    <form id="c_form_info" class="edit-form" action="user_account/user_info_update.jsp" method="get" >
        <div class="form-group">
            <div class="group-row">
                <label for="country" class="form-label">Country</label>
                <input type="text" name="country" class="form-control" value=" <%if (!map.get("country").toString().trim().equalsIgnoreCase("null")) {out.write(map.get("country").toString()); } %>">
            </div>
        </div>
           
           
        <div class="form-group">
            <div class="group-row">
                <label for="city" class="form-label">City</label>
                <input type="text" name="city" class="form-control" value=" <%if (!map.get("city").toString().trim().equalsIgnoreCase("null")) {out.write(map.get("city").toString()); } %>">
            </div>
        </div>
        <div class="form-group">
            <div class="group-row">
                <label for="state" class="form-label">State</label>
                <input type="text" name="state" class="form-control" value="<%if (!map.get("state").toString().trim().equalsIgnoreCase("null")) {out.write(map.get("state").toString()); } %>">
            </div>
        </div>
        <div class="form-group">
            <div class="group-row">
                <label for="permanent_addr" class="form-label">Permanent address</label>
                <input type="text" name="permanent_addr" class="form-control" value="<%if (!map.get("permanent_addr").toString().trim().equalsIgnoreCase("null")) {out.write(map.get("permanent_addr").toString()); } %>">

            </div>
        </div>
        <div class="form-group">
            <div class="group-row">
                <label for="current_addr" class="form-label">Current address</label>
                <input type="text" name="current_addr" class="form-control" value="<%if (!map.get("current_addr").toString().trim().equalsIgnoreCase("null")) {out.write(map.get("current_addr").toString()); } %>">

            </div>
        </div>
        <div class="form-group">
            <div class="group-row">
                <label for="zip" class="form-label">Zip Code</label>
                <input type="text" name="zip" class="form-control" value="<%if (!map.get("zip").toString().trim().equalsIgnoreCase("null")) {out.write(map.get("zip").toString()); } %>">

            </div>
        </div>
        <input id="c_info_submit_btn" type="submit"  class="btn-active"  value="Save">
        <span class="text-success" id="c_userInfoChangeMsg">Updated successfully</span>
    </form>
    <% } else { %>
    <!--for contact info-->
    <div class="profile-heading profile-top-border">
        <span class="text">Company Contact Person Information</span>
        <span id="c_info_edit" class="edit">Change Contact <em>Information</em></span>
    </div>
    <form id="c_form_info" class="edit-form" action="user_account/user_info_update.jsp" method="get" >
        <div class="form-group">
            <div class="group-row">
                <label for="person_name" class="form-label">Person Name</label>
                <input type="hidden" name="person_id" class="form-control" value="<% out.write(map.get("person_id").toString()); %>">
                <input type="text" name="person_name" class="form-control" value="<% out.write(map.get("person_name").toString()); %>">
            </div>
        </div>
        <div class="form-group">
            <div class="group-row">
                <label for="person_email" class="form-label">Person Email</label>
                <input type="text" name="person_email" class="form-control" value="<% out.write(map.get("person_email").toString()); %>">
            </div>
        </div>
        <div class="form-group">
            <div class="group-row">
                <label for="person_designation" class="form-label">Person Designation</label>
                <input type="text" name="person_designation" class="form-control" value="<% out.write(map.get("person_designation").toString()); %>">
            </div>
        </div>
        <div class="form-group">
            <div class="group-row">
                <label for="person_mobile" class="form-label">Person Mobile</label>
                <input type="text" name="person_mobile" class="form-control" value="<% out.write(map.get("person_mobile").toString()); %>">

            </div>
        </div>
        <input id="c_info_submit_btn" type="submit"  class="btn-active"  value="Save">
        <span class="text-success" id="c_userInfoChangeMsg">Updated successfully</span>
    </form>
    <% } %>

    <!--for profile picture-->
    <div class="profile-heading profile-top-border pd-top">
        <span class="text">Profile picture</span>
        <span id="picture_edit" class="edit">Change <em>profile</em> picture</span>
        <p><small>(PNG/JPG/JPEG/BMP, Max. 3MB)</small></p>
    </div>
    <form method="post" action="user_account/picture_upload.jsp" enctype="multipart/form-data"  id="change-profile-image">
        <div class="form-group">
            <p class="form-label">Your profile photo</p>
            <img class="rounded-circle-image" id="uploadImage" src="../asset/<% out.write(map.get("picture_url").toString()); %>" alt="profile_image">
            <input type="file" size="50"  name="picture_url" id="profile_photo" onchange="previewImage()">
        </div>
        <input id="picture_edit_submit_btn" type="submit"  class="btn-active"  value="Save">
        <span id="picture_ChangeMsg" class="text-success" id="userInfoChangeMsg">Updated successfully</span>
    </form>


    <!--for email-->
    <div class="profile-heading profile-top-border ">
        <span class="text">Email Address</span>
        <span id="email_edit" class="edit">Change email <em>address</em></span>
    </div>
    <form id="email_form" class="edit-form" action="user_account/user_info_update.jsp" method="get" >
        <div class="form-group">
            <div class="group-row">
                <label for="email" class="form-label">Your Current Email</label>
                <input id="email_input" type="email" name="email" class="form-control" value="<% out.write(map.get("email").toString()); %>" placeholder="Enter your new email address" />
            </div>
        </div>
        <input id="email_submit_btn" type="submit"  class="btn-active"  value="Send OTP">
        <span class="text-success" id="e_ChangeMsg">Updated successfully</span>
    </form>

    <!--for password-->
    <div class="profile-heading profile-top-border ">
        <span class="text">Password</span>
        <span id="pw_edit" class="edit" >Change Password</span>
    </div>
    <form id="pw_edit_form" class="edit-form" action="user_account/user_info_update.jsp" method="get" >
        <div id="current_pw" class="form-group">
            <div class="group-row">
                <label for="current_pw" class="form-label">Your Current Password</label>
                <input type="password" name="current_pw" class="form-control" value="<% out.write(map.get("password").toString()); %>" placeholder="Enter your old email address" />
            </div>
        </div>
        <div id="new_pw" class="pw-group">
            <div class="form-group m-5rem">
                <div class="group-row">
                    <label for="password" class="form-label">New Password</label>
                    <input id="new_pw_input" type="password" name="password" class="form-control" value="" placeholder="New Password" />
                </div>
            </div>
            <div class="form-group">
                <div class="group-row">
                    <label for="re_type_password" class="form-label">Confirm Password </label>
                    <input id="confirm_pw_input" type="password" name="re_type_password" class="form-control" value="" placeholder="Confirm Password" />
                </div>
            </div>
        </div>
        <input id="pw_submit_btn" type="submit" class="btn-active"  value="Save">
        <span class="text-success" id="PwChangeMsg">Updated successfully</span>
    </form>

</section>

<% }
    }
%>