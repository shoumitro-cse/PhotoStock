<%-- 
    Document   : work_show
    Created on : Jan 11, 2021, 8:42:18 PM
    Author     : shoumitro
--%>

<%@page import="com.admin.DesignerWork"%>
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
        <link rel="stylesheet" href="../../asset/css/admin/work.css"/>
        
        <link rel="stylesheet" href="../../asset/css/admin/form.css"/>

        <title>Image Show</title>
    </head>
    <body>

        <!--for navigation-->
        <%@include file="../dashboard/navbar.jsp" %>

        <section>
            <div class="body-content">

                <!--for side menu-->
                <%@include  file="../dashboard/side_menu.jsp" %>
        
                
                <%
                    int designer_id = 0;
                    String des_id = request.getParameter("designer_id");
                    String designer_name ="";
                   
                    
                    if(des_id != null) {
                        designer_id = Integer.parseInt(des_id);
                    }
                    
                    if(designer_id != 0) {
                        
                    }
                    
                    DesignerWork dw = new DesignerWork();
                    List list = dw.desginerWorkShow(designer_id);
                    
                    int size = list.size();
                    
                    designer_name = dw.getDesginerName(designer_id);
                    
//                    Iterator it = list.iterator();
//                    while (it.hasNext()) {
//                        Map map = (Map)it.next();
//                        out.write(map.get("name").toString());
//                    }
                    
                
                %>
                
                <!--for main content-->
                <div class="body-main-container">
                    <div class="body-main-content">
                        <p class="panel-head">Image Show</p>
                        <main>
                            <!-- for code separate file-->
                            <div class="btn-content">
                                <div class="work_show_content">
                                    <h1 class="des_name"> <% out.write(designer_name); %> (Designer)</h1>
                                    <p>Count: <% out.write(size+"");%></p>
                                    <div>
                                        <%
                                         Iterator it = list.iterator();
                                         while (it.hasNext()) {    
                                           Map map = (Map)it.next();
                                        %>
                                        <span class="img_content">
                                            <span class="view_img">
                                                <img class="view_img_name"  src="../../asset/images/<% out.write(map.get("img_url").toString());%>" alt="empty"/>
                                                <p class="img_name"><% out.write(map.get("name").toString());%></p>
                                                <a href="add_gallery_image.jsp?work_id=<% out.write(map.get("work_id").toString());%>"><button class="add_img_btn">Add Image In Gallery</button></a>
                                            </span>
                                        </span>
                                        
                                        <% }%>

                                    </div>
                                    <br/>
                                    <div class="footer-content">
                                        <a href="work.jsp"><button class="add_img_btn">Go Back</button></a>
                                    </div>
                                </div>
                            </div>
                        </main>
                    </div>
                </div>

            </div>
        </section>

        <!--for footer-->
        <%@include file="../dashboard/footer.jsp" %>

    </body>
</html>
