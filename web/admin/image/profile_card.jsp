<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.admin.Image"%>
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

                                int image_id = 0;
                                String image_id_text = request.getParameter("image_id");

                                if (image_id_text != null) {
                                    image_id = Integer.parseInt(image_id_text);
                                }
                                if (image_id != 0) {

                                    List list = Image.getImageById(image_id);
                                    Iterator it = list.iterator();
                                    if (it.hasNext()) {
                                        Map map = (Map) it.next();


                            %>
                            <!-- for code separate file-->
                            <div style="color: gray"  class="profile-card">
                                <div class="profile-content">
                                    <div class="profile-header">
                                        <p  style="margin: 10px 0"><span style="text-transform: capitalize"><% out.write(map.get("name").toString()); %></span><span>(image card)</span></p>
                                    </div>
                                    <div class="heading-img-content">
                                        <img src="../../asset/<% out.write(map.get("largeImage").toString()); %>" alt="" />
                                    </div>
                                    <div style="min-height: 120px;" class="profile-body-content">
                                        <h1 style="margin: 10px 0; font-size: 140%;color: gray"> <% out.write(map.get("header").toString()); %></h1>
                                        <p style="margin: 10px 0"><span>Type :</span> <% out.write(map.get("type").toString()); %></p>
                                        <p style="margin: 10px 0"><span style="text-decoration: underline">Description</span> : </p>
                                        <p style="text-transform: none"><% out.write(map.get("longDescription").toString()); %>. I can make many 3d game card that is use many creative work.</p>
                                    </div>
                                    <div style="display: flex; flex-wrap: wrap;justify-content: space-between;" class="contact-section">
                                        
                                        <strong> <span style="color: #333">$<% out.write(map.get("alternatePrice").toString()); %></span></strong>
                                        <strong> <strike><span>$<% out.write(map.get("unitPrice").toString()); %></span></strike></strong>
                                        <!--<strong> <span>$<% // out.write(map.get("saveMoney").toString()); %></span></strong>-->
                                        <strong> <span style="color: orange"><% out.write(map.get("percentRate").toString()); %>%</span></strong>
                                    </div>
                                    <div class="profile-footer">
                                        <p style="color: #000;">Price : $<% out.write(map.get("alternatePrice").toString()); %></p>
                                    </div>
                                </div>
                            </div>
                            <% }
                            }%>
                        </main>
                    </div>
                </div>

            </div>
        </section>

        <!--for footer-->
        <%@include file="../dashboard/footer.jsp" %>

    </body>
</html>
