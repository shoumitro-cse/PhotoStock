<%-- 
    Document   : contact
    Created on : Aug 7, 2020, 7:04:24 AM
    Author     : shoumitro
--%>

<%@page import="com.admin.Contact"%>
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
        <title>Contact</title>
    </head>
    <body> 
        
        <%    
            
             // message active = 0
            if (Contact.msgNotActive()) {
                //response.setHeader("Refresh", "0");
                //response.sendRedirect("message.jsp");
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
                        <!--<p class="panel-head">User Message</p>-->
                        <main>
                            <!-- for code separate file-->

                            <%
                                List list = Contact.getAllContactInfo(false);
                            %>
                            <div class="notifications">
                                <h6 style="font-size: initial" class="notifications-header m-minus">
                                    <span class="fa fa-envelope"></span>
                                    &nbsp;Message Center (<% out.write(list.size()+""); %>)
                                </h6>
                                <div class="notifications-content">
                                    <%
                                        Iterator it = (Iterator) list.iterator();
                                        while (it.hasNext()) {
                                            Map map = (Map) it.next();
                                    %>

                                    <div style="cursor: auto" class="notifications-item">
                                        <span onclick="deleteMsg(<% out.write(map.get("contact_id").toString()); %>)" class="notifications-close fa fa-close"></span>
                                        <img class="notifications-item-img" width="40px" height="40px" src="../../asset/<% out.write(map.get("picture_url").toString()); %>">
                                        <div class="notifications-item-content">
                                            <div class="notifications-item-content-text">Message From <span class="msg-email"> <% out.write(map.get("email").toString()); %> </span> </div>
                                            <div style="max-width: inherit; white-space: inherit" class="notifications-item-content-details "><% out.write(map.get("msg").toString()); %></div>
                                            <span style="float: right" class="msg-date"><% out.write(map.get("msg_datetime").toString()); %></span>
                                        </div>
                                    </div>
                                    <%  }%>
                                </div>
                            </div>

                        </main>
                    </div>
                </div>

            </div>
        </section>

        <script>

//            window.location = "message.jsp";
            setTimeout(function () {
//                location = '';
            }, 1);

            function deleteMsg(contact_id) {
                window.location = "msg_delete.jsp?contact_id=" + contact_id;
            }
        </script>

        <!--for footer-->
        <%@include file="../dashboard/footer.jsp" %>

    </body>
</html>
