

<!--<button onclick="document.getElementById('id01').style.display = 'block'" style="width:auto;">Login</button>-->

<div id="id01" class="modal">

    <form id="regForm" class="modal-content" action="user_account/create.jsp" method="get" >
        <div class="img-content">
            <span onclick="closeModel()" class="close fa fa-close" title="Close Modal"></span>
            <!--<img src="asset/images/img_avatar2.png" alt="Avatar" class="avatar">-->
            <span class="fa fa-user-circle-o"></span>
        </div>
        <div class="form-body-content">

            <!-- One "tab" for each step in the form: -->
            <div id="login-form" class="login">
                <span class="md-log-label" style="">User LogIn</span>
                
                <br/>
                <input onchange="window.location ='employee.jsp'" style="vertical-align: sub;" type="checkbox" /> 
                <span style="color: brown;font-size: 16px;margin-left: 2%;"> I am Employee.</span>
                <br/>
                
                <p id="login_invalid_user" style="display: none" class="invalid_user">Invalid User. Please try again.</p>
                <p style="margin-top: 7px;"><input type="email" placeholder="Email Address..." oninput="removeInvalidClass(this)" name="login_email"></p>
                <p> <input type=password placeholder="Password..." oninput="removeInvalidClass(this)" name="login_password"> </p>
            </div>
            <p id="singup_invalid_user" style="display: none" class="invalid_user">Invalid message</p>
            <div class="tab">
                <span class="md-reg-label">User Register</span>
                <p>
                    <input class="input-col-2" type="text" placeholder="First name..." oninput="removeInvalidClass(this)" name="first_name">
                    <input class="input-col-2" type="text" placeholder="Surname..." oninput="removeInvalidClass(this)" name="surname">
                </p>
                <p><input id="sign_up_email" type="email" placeholder="Business Email..." oninput="removeInvalidClass(this)" name="email"></p>
                <p>
                    <input id="sign_up_pw" class="input-col-2" type="password" placeholder="Password..." oninput="removeInvalidClass(this)" name="password">
                    <input id="sign_up_r_pw" class="input-col-2" type="password" placeholder="Retype password..." oninput="removeInvalidClass(this)" name="re_type_password">
                </p>
                <p>
                    <input type="checkbox" checked="false" name="user_type" id="check-box-control" onclick="shortSignup(this.checked)"  class="checkbox-btn" oninput="removeInvalidClass(this)" >
                    <span>Company account.</span>
                </p>
            </div>
            <div class="tab">
                <span>Company Information</span>
                <p><input type="text" placeholder="Company name.." oninput="removeInvalidClass(this)" name="company_name"></p>
                <p><input type="text" placeholder="Country..." oninput="removeInvalidClass(this)" name="company_country"></p>
                <p><input type="text" placeholder="City.." oninput="removeInvalidClass(this)" name="company_city"></p>
                <p><input type="text" placeholder="Company Address.." oninput="removeInvalidClass(this)" name="company_addr"></p>
            </div>
            <div class="tab">
                <span>Company Description</span>
                <p><input type="text" placeholder="Company Type ..." oninput="removeInvalidClass(this)" name="company_type"></p>
                <p><input type="text" placeholder="Business/ Trade License No..." oninput="removeInvalidClass(this)" name="business_license_no"></p>
                <p><input type="text" placeholder="Business Description..." oninput="removeInvalidClass(this)" name="business_decr"></p>
                <p><input type="url" placeholder="Website URL..." oninput="removeInvalidClass(this)" name="website_url"></p>
            </div>
            <div class="tab">
                <span>Contact Information</span>
                <p><input type="text" placeholder="Contact Person's Name..."  oninput="removeInvalidClass(this)" name="person_name"></p>
                <p><input type="text" placeholder="Contact Person's Designation..."  oninput="removeInvalidClass(this)" name="person_designation"></p>
                <p><input type="email" placeholder="Contact Person's Email..."  oninput="removeInvalidClass(this)" name="person_email"></p>
                <p><input type="tel" placeholder="Contact Person's Mobile..."  oninput="removeInvalidClass(this)" name="person_mobile"></p>
            </div>

            <div class="form-body-page">
                <input value="Previous" type="button" id="prevBtn" onclick="nextPrev(-1)"/>
                <input value="Next" type="button" id="nextBtn" onclick="nextPrev(1)"/>
                <input value="SignUp" type="submit" id="short-signup" onclick="submitValidation(event)" />
                <input value="SignIn" formaction="" type="submit" id="short-signin" onclick="submitValidateLoginForm(event)" />
            </div>

            <!-- Circles which indicates the steps of the form: -->
            <div id="circle-indicator" class="circle">
                <span class="step"></span>
                <span class="step"></span>
                <span class="step"></span>
                <span class="step"></span>
            </div>
        </div>

        <span onclick="signupForm()" id="singup_label" >SignUp</span>
        <div class="footer-content">
            <button type="button" onclick="closeModel()" class="cancelbtn">Cancel</button>
            <span id="forgot-pw">Forgot <a href="#">password?</a></span>
            <span onclick="loginForm()" id="signin_label" >SignIn</span>
        </div>
    </form>
</div>
<%--<%@page import="com.account.UserAccount" %>
<%
    //out.write(request.getRequestURI());

    //for login
    String login_email = request.getParameter("login_email");
    String login_password = request.getParameter("login_password");

    if (login_email != null && login_password != null) {
        UserAccount uc = new UserAccount();
        //emali and password check for old account
        if (uc.accountCheck(login_email, login_password)) {
            session.setAttribute("login", true);
            response.sendRedirect(request.getRequestURI());
        } else {
            session.setAttribute("login", false);
            response.sendRedirect("user_account/login.jsp");
        }
    }
%>--%>