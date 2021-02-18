<%-- 
    Document   : profile_card
    Created on : Jul 25, 2020, 7:36:57 AM
    Author     : shoumitro
--%>

<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.admin.Designer"%>
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
        <link rel="stylesheet" href="../../asset/css/admin/view.css"/>
        <title>Designer Profile Card</title>
    </head>
    <body>

        <!--for navigation-->
        <%@include file="../dashboard/navbar.jsp" %>

        <section>
            <div class="body-content">

                <!--for side menu-->
                <%@include  file="../dashboard/side_menu.jsp" %>

                <!--for main content-->
                <div class="body-main-container">
                    <div style="background-color: inherit; " class="body-main-content">
                        <!--<p class="panel-head green-panel">Designer Profile Card</p>-->
                        <main>

                            <%
                                int desginer_id = 0;
                                String desginer_id_text = request.getParameter("desginer_id");

                                if (desginer_id_text != null && desginer_id_text != "") {
                                    desginer_id = Integer.parseInt(desginer_id_text);
                                }

                                List list = Designer.getDesignerListById(desginer_id);
                                Iterator it = list.iterator();
                                while (it.hasNext()) {
                                    Map map = (Map) it.next();
                            %>



                            <!-- for code separate file-->
                            <div class="profile-card">
                                <div class="profile-content">
                                    <div class="profile-header">
                                        <p><span style="text-transform: capitalize">Mr. <% out.write(map.get("fullname").toString()); %></span><span>(profile card)</span></p>
                                    </div>
                                    <div class="heading-img-content">
                                        <img src="../../asset/<% out.write(map.get("picture_url").toString()); %>" alt="" />
                                    </div>
                                    <div class="profile-body-content">
                                        <h1>Mr. <% out.write(map.get("fullname").toString()); %><span class="name-title"> (<% out.write(map.get("type").toString()); %>)</span></h1>
                                        <p><span>Type :</span> <% out.write(map.get("type").toString()); %></p>
                                        <p><span style="text-decoration: underline">Message</span> : </p>
                                        <p style="text-transform: none"><% out.write(map.get("msg").toString()); %>. I can make many 3d game card that is use many creative work.</p>
                                    </div>
                                    <div class="contact-section">
                                        <address class="contact">
                                            <span class="contact-titel">Contact</span> <br/> <br/>
                                            <span>Phone : <% out.write(map.get("phone").toString()); %></span><br/>
                                            <span>Email : <% out.write(map.get("email").toString()); %></span><br/>
                                            <span>Facebook : <% out.write(map.get("facebook").toString()); %></span><br/>
                                            <span>LinkedIn : <% out.write(map.get("linkedin").toString()); %></span><br/>

                                        </address>
                                    </div>
                                    <div class="profile-footer">
                                        <p>Contact us : <% out.write(map.get("phone").toString()); %></p>
                                    </div>
                                </div>
                            </div>
                            <% }%>
                        </main>
                    </div>
                </div>

            </div>
        </section>

        <!--for footer-->
        <%@include file="../dashboard/footer.jsp" %>

    </body>
</html>
