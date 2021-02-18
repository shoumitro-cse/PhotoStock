<%-- 
    Document   : account
    Created on : Jul 31, 2020, 11:26:33 AM
    Author     : shoumitro
--%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.admin.AdminAccount"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="../../asset/images/web_icon/ps_small.png"/>
        <link rel="stylesheet" href="../../asset/css/font-awesome.css"/>
        <link rel="stylesheet" href="../../asset/css/ionicons.css"/>
        <link rel="stylesheet" href="../../asset/css/admin/common.css"/>
        <link rel="stylesheet" href="../../asset/css/admin/form.css"/>
        <title>My Account</title>
        <style>

        </style>
    </head>
    <body>

        <%
            String user_email = "";
            String user_name = "";
            String picture_url = "";
            String password = "";
            String last_login = "";
            String isActive = "";
            String page_name = "";

            boolean change_picture = true;

            int admin_id = 0;

            if (request.getParameter("admin_id") != null && request.getParameter("admin_id") != "") {
                admin_id = Integer.parseInt(request.getParameter("admin_id").toString());
                //page_name = "view.jsp";
                page_name = "account.jsp?admin_id=" + admin_id;
                //change_picture = false;
                change_picture = true;
                session.setAttribute("page", page_name);
            } else {
                if (session.getAttribute("admin_id") != null) {
                    String admin_id_text = session.getAttribute("admin_id").toString();
                    if (admin_id_text != null && admin_id_text != "") {
                        admin_id = Integer.parseInt(admin_id_text);
                    }
                }
                page_name = "account.jsp";
            }

            List list = AdminAccount.getAdminAccountById(admin_id);
            Iterator it = (Iterator) list.iterator();

            if (it.hasNext()) {
                Map map = (Map) it.next();
                user_email = map.get("email").toString();
                user_name = map.get("name").toString();
                picture_url = map.get("picture_url").toString();
                password = map.get("password").toString();
                last_login = map.get("last_login").toString();
                isActive = map.get("isActive").toString();
                admin_id = Integer.parseInt(map.get("admin_id").toString());
            }


        %>

        <!--for navigation-->
        <%@include file="../dashboard/navbar.jsp" %>

        <section>
            <div class="body-content">

                <!--for side menu-->
                <%@include  file="../dashboard/side_menu.jsp" %>

                <!--for main content-->
                <div class="body-main-container">
                    <div class="body-main-content">
                        <p class="form-panel-head" style="text-transform: uppercase">My Account</p>
                        <main>
                            <!-- for code separate file-->

                            <!--for Personal Information-->
                            <div id="personal_form_container" class="form-container">
                                <form action="update.jsp" method="get" >
                                    <div class="p_row">
                                        <div class="col-content m-20">
                                            <p id="tab_1"  onclick="formEdit('personal_form_container', 'tab_1', 'submit_content_1')" class="col-heading">Personal Information Change</p> 
                                            <div class="m-20"> 
                                                <input type="hidden" name="page" value="<% out.write(page_name); %>" />
                                                <input type="hidden" id="admin_id"  name="admin_id" value="<% out.write(admin_id + ""); %>" />
                                                <label for="fullname">Fullname </label>
                                                <input value="<% out.write(user_name); %>" disabled="true" type="text" id="fullname"  name="fullname" placeholder="Fullname..">
                                            </div>
                                        </div>
                                    </div>
                                    <div id="submit_content_1" class="form-submit-content">
                                        <input onclick="adminFormValidation('personal_form_container')" id="submit_btn" class="btn-active" type="submit" value="Save">
                                        <span class="text-success-msg">Updated successfully</span>
                                    </div>
                                </form>
                            </div>
                            <!--Status Information-->
                            <div class="form-container">
                                <div class="p_row">
                                    <div class="col-content m-20">
                                        <p  class="col-heading">Status Information(Not change able)</p> 
                                        <div class="m-20"> 
                                            <input type="hidden" name="page" value="<% out.write(page_name); %>" />
                                            <input type="hidden" id="admin_id"  name="admin_id" value="<% out.write(admin_id + ""); %>" />

                                            <label for="isActive">isActive </label>
                                            <input value="<% out.write(isActive); %>" disabled="true" type="text" id="isActive"  name="isActive" placeholder="isActive..">

                                            <label for="last_login">Last Login </label>
                                            <input value="<% out.write(last_login); %>" disabled="true" type="text" id="last_login"  name="last_login" placeholder="last_login...">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <br/>
                            <!--Email Address-->
                            <div id="email_form_container" class="form-container">
                                <form  action="update.jsp" method="get">
                                    <div class="p_row">
                                        <div class="col-content">
                                            <%  if (request.getParameter("err") != null && request.getParameter("err") != "") {
                                                    if (Integer.parseInt(request.getParameter("err")) == 1) {
                                            %>
                                            <span class="err"><% out.write("Email already exists."); %></span>
                                            <%   }
                                                } %>
                                            <div class="m-20"> 
                                                <p id="tab_2"  onclick="formEdit('email_form_container', 'tab_2', 'submit_content_2')" class="col-heading">Email Address Change</p>
                                                <input type="hidden" name="page" value="<% out.write(page_name); %>" />
                                                <input type="hidden" id="admin_id"  name="admin_id" value="<% out.write(admin_id + ""); %>" />
                                                <label for="email">Email </label>
                                                <input value="<% out.write(user_email); %>" disabled="true" type="email" id="email" name="email" placeholder="xxx@gmail.com">
                                            </div>
                                        </div>
                                    </div>
                                    <div id="submit_content_2" class="form-submit-content">
                                        <input onclick="adminFormValidation('email_form_container')" class="btn-active" type="submit" value="Save">
                                        <span class="text-success-msg">Updated successfully</span>
                                    </div>
                                </form>
                            </div>
                            <!--Password-->
                            <div id="password_form_container" class="form-container">
                                <form  action="update.jsp" method="get">
                                    <div class="p_row">
                                        <div class="col-content">
                                            <div class="m-20"> 
                                                <p id="tab_3"  onclick="formEdit('password_form_container', 'tab_3', 'submit_content_3')" class="col-heading">Password Change </p>
                                                <input type="hidden" name="page" value="<% out.write(page_name); %>" />
                                                <input type="hidden" id="admin_id"  name="admin_id" value="<% out.write(admin_id + ""); %>" />
                                                <label for="password">Current Password </label>
                                                <input value="<% out.write(password); %>" disabled="true" type="password" id="password" name="password" placeholder="Password..">
                                                <div class="pw-group pw-group-hide">
                                                    <div>
                                                        <label for="new_pw">New Password </label>
                                                        <input type="password" id="new_pw" name="new_pw" placeholder="New Password..">
                                                    </div>
                                                    <div>
                                                        <label for="confirm_pw">Confirm Password  </label>
                                                        <input type="password" id="confirm_pw" name="confirm_pw" placeholder="Confirm Password..">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="submit_content_3" class="form-submit-content">
                                        <input onclick="adminFormValidation('password_form_container')" class="btn-active" type="submit" value="Save">
                                        <span class="text-success-msg">Updated successfully</span>
                                    </div>
                                </form>
                            </div>
                            <!--Picture-->
                            <% if (change_picture) { %>
                            <div id="file_form_container" class="form-container">
                                <form  action="picture_upload.jsp" method="post" enctype="multipart/form-data">
                                    <div class="p_row">
                                        <div class="col-content">
                                            <p id="tab_4"  onclick="formEdit('file_form_container', 'tab_4', 'submit_content_4')" class="col-heading">Picture Change </p>
                                            <div class="profile-picture-content">
                                                <div class="p-img">
                                                    <img src="../../asset/<% out.write(picture_url); %>" alt="" />
                                                </div>
                                                <div class="p-img-change">
                                                    <input type="hidden" id="admin_id"  name="admin_id" value="<% out.write(admin_id + "");%>" />
                                                    <label for="picture_url">Picture </label>
                                                    <input disabled="true" type="file" id="picture_url"   name="picture_url" size="50" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="submit_content_4" class="form-submit-content">
                                        <input onclick="adminFormValidation('file_form_container')" class="btn-active" type="submit" value="Save">
                                        <span class="text-success-msg">Updated successfully</span>
                                    </div>
                                </form>
                            </div>
                            <% }%>
                        </main>
                    </div>
                </div>

            </div>
        </section>

        <!--add javascript-->
        <script src="../../asset/js/admin/admin_account.js" type="text/javascript"></script>

        <!--for footer-->
        <%@include file="../dashboard/footer.jsp" %>

    </body>
</html>
