<%-- 
    Document   : contact
    Created on : Aug 6, 2020, 5:40:10 PM
    Author     : shoumitro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="../asset/images/web_icon/ps_small.png"/>
        <link rel="stylesheet" href="../asset/css/font-awesome.css" />
        <link rel="stylesheet" href="../asset/css/ionicons.css" />
        <link rel="stylesheet" href="../asset/css/common.css" />
        <link rel="stylesheet" href="../asset/css/model.css"/>
        <link rel="stylesheet" href="../asset/css/my_section.css" />
        <link rel="stylesheet" href="../asset/css/contact.css" />

        <title>Contact</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <%@include file="model.jsp" %>

        <%@include file="shopping_cart_menu.jsp" %>
        <%@include file="account_section/acc_side_menu.jsp" %>

        <section>
            <div class="contact-container">
                <div class="contact-heading">
                    <h1>Contact PhotoStock</h1>
                    <p>We’re interested in your feedback to help improve PhotoStock.</p>
                    <div class="line-seperator"></div>
                </div>
                <div class="contact-body">
                    <div class="contact-form-container">
                        <form id="contact_form_id" action="user_account/contact_insert.jsp" method="get">

                            <p class="contact-title">Information</p>

                            <label for="fullname"><span class="fa fa-user"></span> Your Name </label>
                            <input type="text" id="" name="fullname"  placeholder="Fullname..."/>

                            <label for="email"><span class="fa fa-envelope"></span> Your Email Address</label>
                            <input type="email" id="" name="email"  placeholder="Email..."/>

                            <label for="msg"><span class="fa fa-envelope-open"></span> Your Enquiry Message </label>
                            <textarea type="text" id="" name="msg" rows="10" placeholder="What can we help you with?"></textarea>


                            <%
                                
                               if (session.getAttribute("login") != null) {
                                    if (Boolean.parseBoolean(session.getAttribute("login").toString())) {
                            %>
                            <p class="submit-content">
                                <input onclick="checkValidContactForm()" class="contact-submit" type="submit" value="Send Message" />
                            </p>
                            <% } else { %>
                            <p class="submit-content">
                                <input onclick="loginForm()" class="contact-submit" type="submit" value="Send Message" />
                            </p>
                            <% }
                            } else {%>
                            <p class="submit-content">
                                <input onclick="loginForm()" class="contact-submit" type="submit" value="Send Message" />
                            </p>
                            <% }%>


                        </form>
                    </div>
                </div>
                <div class="contact-footer">
                    <!--Footer-->
                </div>

            </div>
        </section>



        <!--for footer-->
        <%@include file="footer.jsp" %>
        <script src="../asset/js/common.js" type="text/javascript"></script>
        <script src="../asset/js/model.js" type="text/javascript" ></script>

        <script type="text/javascript">

            function checkValidContactForm() {

                event.preventDefault();

                let contact_form_id = document.getElementById("contact_form_id");

                let fullname = contact_form_id["fullname"];
                let email = contact_form_id["email"];
                let msg = contact_form_id["msg"];

                if (fullname.value.toString().trim() !== "" && email.value.toString().trim() !== "" && msg.value.toString().trim() !== "") {
                    contact_form_id.submit();
                } else {
                    
                    if(fullname.value.toString().trim() === "") {
                        fullname.style.borderColor = "red";
                    }
                    if(email.value.toString().trim() === "") {
                        email.style.borderColor = "red";
                    }
                    if(msg.value.toString().trim() === "") {
                        msg.style.borderColor = "red";
                    }
                    
                    fullname.oninput = function () {
                        fullname.style.borderColor = "#d3d3d3";
                    };
                    email.oninput = function () {
                        email.style.borderColor = "#d3d3d3";
                    };
                    msg.oninput = function () {
                        msg.style.borderColor = "#d3d3d3";
                    };

                }

            }


            try {
                if (document.getElementById("body-search-box")) {
                    autocomplete(document.getElementById("body-search-box"), autoCompleteKeywordList, rs);
                }
            } catch (e) {
                console.log("cosole.log mesg => " + e);
            }

        </script>
    </body>
</html>
