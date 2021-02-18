<%-- 
    Document   : designer
    Created on : Jan 12, 2021, 4:34:37 PM
    Author     : shoumitro
--%>


<%@page import="com.admin.DesignerWork"%>
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

        <title>Employee</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <%@include file="model.jsp" %>

        <%--<%@include file="shopping_cart_menu.jsp" %>--%>
        <%@include file="account_section/acc_side_menu.jsp" %>
        

        <% 
           DesignerWork dw = new DesignerWork();

           String employee_id = "";
           String employee_email = "";
           String employee_name = "";
           
          if (session.getAttribute("designer_id") != null && session.getAttribute("employee_email") != null) {
             employee_id = session.getAttribute("designer_id").toString();
             employee_email = session.getAttribute("employee_email").toString();
             employee_name = dw.getDesginerName(Integer.parseInt(employee_id));
          }
          
        %>
        
        

        <!--<button onclick="document.getElementById('id02').style.display = 'block'" style="width:auto;">Login</button>-->

      <% if (session.getAttribute("designer_id") == null) {%>
        <div id="id02" style="display: block" class="modal">
            <form id="regForm" class="modal-content" action="user_account/employee_ck.jsp" method="post" >
                <div class="img-content">
                    <span onclick="window.location='index.jsp'" class="close fa fa-close" title="Close Modal"></span>
                    <span class="fa fa-user-circle-o"></span>
                </div>
               <div class="form-body-content">
               <div id="login-form" class="login">
                    <span class="md-log-label" style="">Employee Info</span>
                    
                    <p id="login_invalid_user" <% if(request.getParameter("err") == null) {%> style="display: none"<% } %> class="invalid_user">Invalid Employee. Please try again.</p>
                    
                    <p> 
                        <input type="text" placeholder="Employee Id..."  name="employee_id">
                    </p>
                    <p style="margin-top: 7px;">
                        <input type="email" placeholder="Email Address..." name="employee_email">
                    </p>
                  </div>
                    <div class="form-body-page">
                        <input value="Entry"type="submit" id="short-signin"  />
                    </div>

               </div>
            </form>
        </div>
        <% } else {%>


        <section>
            <div style="margin: 4rem 7rem 3rem 7rem;" class="contact-container">
                <div class="contact-heading">
                    <h1>Designer Work Store</h1>
                    <p>Please store your work in photo stock.</p>
                    <div class="line-seperator"></div>
                </div>
                <div class="contact-body">
                    <div class="contact-form-container">
                        <form id="contact_form_id" action="insert_work.jsp" method="post" enctype="multipart/form-data">

                            <p class="contact-title">Work Information</p>
                            
                            <input value="<%out.write(employee_id);%>" type="hidden" name="employee_id" />

                            <label for="fullname"><span class="fa fa-user"></span> Employee Name </label>
                            <input value="<%out.write(employee_name);%>" disabled="true" style="background-color: #f6f6f6" type="text" id="" name="fullname"  placeholder="Employee Name..."/>

                            <label for="email"><span class="fa fa-envelope"></span> Email Address</label>
                            <input value="<%out.write(employee_email);%>" disabled="true" style="background-color: #f6f6f6" type="email" id="" name="email"  placeholder="Email"/>

                            <label for="img_name"><span class="fa fa-image"></span> Image Name </label>
                            <input type="text" id="" name="img_name"  placeholder="Image Name..."/>
                            
                            <label for="copy"><span class="fa fa-image"></span> Number of Copy </label>
                            <input type="number" min="1" id="" name="copy"  placeholder="Number of Copy..."/>
                            
                            <label for="img_url"><span class="fa fa-image"></span> Image</label>
                            <input type="file" id="img_url" name="img_url"/>
                           
                            
                            <!--<input oninput="document.getElementById('img').src=this.value;console.log(this)" style="display: none" type="file" id="img_url" name="img_url"/>-->
                            <!--<img id="img" src="" alt="" />-->
                            <!--<input type="submit" value="Submit"/>-->


                            <p class="submit-content">
                                <input onclick="insertWork()" class="contact-submit" type="submit" value="Send" />
                            </p>


                        </form>
                    </div>
                </div>
                <div class="contact-footer">
                    <!--Footer-->
                </div>

            </div>
        </section>
        <% } %>



            <div style="margin-bottom: 200px;"></div>      
        <!--for footer-->
        <%@include file="footer.jsp" %>
        <script src="../asset/js/common.js" type="text/javascript"></script>
        <script src="../asset/js/model.js" type="text/javascript" ></script>

        <script type="text/javascript">

            function checkValidContactForm() {

                event.preventDefault();

                let contact_form_id = document.getElementById("contact_form_id");

                let employee_id = contact_form_id["employee_id"];
                let email = contact_form_id["email"];
                let img_name = contact_form_id["img_name"];
                let copy = contact_form_id["copy"];

                if (copy.value.toString().trim() !== "" && employee_id.value.toString().trim() !== "" && email.value.toString().trim() !== "" && img_name.value.toString().trim() !== "") {
                    let url = "insert_work.jsp?employee_id="+employee_id.value+"&img_name="+img_name.value+"&copy="+copy.value;

                    let xhttp = new XMLHttpRequest();
                    xhttp.onreadystatechange = function () {
                        if (this.readyState === 4 && this.status === 200) {
                          contact_form_id.submit();
                        }
                    };
                    xhttp.open("GET", url, true);
                    xhttp.send();
            
                } else {
                    
                    if(employee_id.value.toString().trim() === "") {
                        employee_id.style.borderColor = "red";
                    }
                    
                    if(email.value.toString().trim() === "") {
                        email.style.borderColor = "red";
                    }
                    
                    if(img_name.value.toString().trim() === "") {
                        img_name.style.borderColor = "red";
                    }
                    
                    if(copy.value.toString().trim() === "") {
                        copy.style.borderColor = "red";
                    }
                    
                    img_name.oninput = function () {
                        img_name.style.borderColor = "#d3d3d3";
                    };
                    
                    email.oninput = function () {
                        email.style.borderColor = "#d3d3d3";
                    };
                    
                    copy.oninput = function () {
                        copy.style.borderColor = "#d3d3d3";
                    };
  

                }

            }
            
            function insertWork() {
                checkValidContactForm();
                
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
