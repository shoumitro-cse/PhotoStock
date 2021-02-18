<%-- 
    Document   : categories
    Created on : Jun 21, 2020, 10:26:56 PM
    Author     : shoumitro
--%>

<%@page import="com.admin.Category"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Photo Categories, Science, Entertainment, Religion.</title>
        <link rel="icon" href="../asset/images/web_icon/ps_small.png"/>

        <link rel="stylesheet" href="../asset/css/font-awesome.css"/>
        <link rel="stylesheet" href="../asset/css/common.css"/>
        <link rel="stylesheet" href="../asset/css/model.css"/>
        <link rel="stylesheet" href="../asset/css/categories.css"/>
        <link rel="stylesheet" href="../asset/css/my_section.css"/>
    </head>
    <body>
        <%
//            if (!(Boolean.parseBoolean(session.getAttribute("login").toString()))) {
//                response.sendRedirect("index.jsp");
//            }
%>
        <%@include file="header.jsp" %>
        <%@include file="model.jsp" %>


        <!--for shopping menu-->
        <%@include file="shopping_cart_menu.jsp" %>
        <%@include file="account_section/acc_side_menu.jsp" %>

        <%
            List categoryList;
        %>

        <section>
            <article>
                <h3>Popular Categories</h3>

                <div class="row-panels-bleed">
                    <ul>
                        <%
                            categoryList = Category.getLimitedCategory(0, 5);

                            if (categoryList.size() > 0) {
                                String category_name = "";
                                Iterator it = (Iterator) categoryList.iterator();
                                while (it.hasNext()) {
                                    Map categoryMap = (Map) it.next();
                                    category_name = categoryMap.get("name").toString().trim().toLowerCase();

                                    List categoryImageList = Category.getImageByCategoryType(category_name);
                                    Iterator it2 = (Iterator) categoryImageList.iterator();
                                    if (it2.hasNext()) {
                                        Map map = (Map) it2.next();
                        %>
                        <li>
                            <a href="gallery.jsp?category_name=<% out.write(map.get("category_name").toString().trim().toLowerCase()); %>" >
                                <span class="label"><% out.write(map.get("category_name").toString()); %></span>
                                <span 
                                    class="image reveal" 
                                    style="background-image: url(../asset/<% out.write(map.get("largeImage").toString()); %>)">  
                                </span>
                            </a>
                        </li>

                        <%  }
                                }
                            }%>
                    </ul>
                </div>




                <div class="row-panels-mini">
                    <h2>
                        <a href="" title="Vector Backgrounds">Backgrounds</a>
                    </h2>

                    <ul>
                        <%
                            categoryList = Category.getLimitedCategory(5, 4);

                            if (categoryList.size() > 0) {
                                String category_name = "";
                                Iterator it = (Iterator) categoryList.iterator();
                                while (it.hasNext()) {
                                    Map categoryMap = (Map) it.next();
                                    category_name = categoryMap.get("name").toString().trim().toLowerCase();

                                    List categoryImageList = Category.getImageByCategoryType(category_name);
                                    Iterator it2 = (Iterator) categoryImageList.iterator();
                                    if (it2.hasNext()) {
                                        Map map = (Map) it2.next();
                        %>
                        <li>
                            <a href="gallery.jsp?category_name=<% out.write(map.get("category_name").toString().trim().toLowerCase()); %>" >
                                <span 
                                    class="image reveal" 
                                    style="background-image: url(../asset/<% out.write(map.get("largeImage").toString()); %>)">  
                                </span>
                                <span class="label"><% out.write(map.get("category_name").toString()); %></span>
                            </a>
                        </li>

                        <%  }
                                }
                            }%>
                    </ul>
                </div>




                <div class="row-panels-normal">
                    <h2>
                        <a href="" title="Icons &amp; Emblems">Science</a>
                    </h2>
                    <ul>

                        <%

                            categoryList = Category.getLimitedCategory(9, 5);

                            if (categoryList.size() > 0) {
                                String category_name = "";
                                Iterator it = (Iterator) categoryList.iterator();
                                while (it.hasNext()) {
                                    Map categoryMap = (Map) it.next();
                                    category_name = categoryMap.get("name").toString().trim().toLowerCase();

                                    List categoryImageList = Category.getImageByCategoryType(category_name);
                                    Iterator it2 = (Iterator) categoryImageList.iterator();
                                    if (it2.hasNext()) {
                                        Map map = (Map) it2.next();
                        %>
                        <li>
                            <a href="gallery.jsp?category_name=<% out.write(map.get("category_name").toString().trim().toLowerCase()); %>" >
                                <span 
                                    class="image reveal" 
                                    style="background-image: url(../asset/<% out.write(map.get("largeImage").toString()); %>)">  
                                </span>
                                <span class="label"><% out.write(map.get("category_name").toString()); %></span>
                            </a>
                        </li>

                        <%  }
                                }
                            }%>

                    </ul>
                </div>


                <div class="row-panels-bleed">
                    <h2>Textures</h2>
                    <ul>

                        <%

                            categoryList = Category.getLimitedCategory(14, 5);

                            if (categoryList.size() > 0) {
                                String category_name = "";
                                Iterator it = (Iterator) categoryList.iterator();
                                while (it.hasNext()) {
                                    Map categoryMap = (Map) it.next();
                                    category_name = categoryMap.get("name").toString().trim().toLowerCase();

                                    List categoryImageList = Category.getImageByCategoryType(category_name);
                                    Iterator it2 = (Iterator) categoryImageList.iterator();
                                    if (it2.hasNext()) {
                                        Map map = (Map) it2.next();
                        %>
                        <li>
                            <a href="gallery.jsp?category_name=<% out.write(map.get("category_name").toString().trim().toLowerCase()); %>" >
                                <span 
                                    class="image" 
                                    style="background-image: url(../asset/<% out.write(map.get("largeImage").toString()); %>)">  
                                </span>
                                <span class="label"><% out.write(map.get("category_name").toString()); %></span>
                            </a>
                        </li>

                        <%  }
                                }
                            }%>

                    </ul>
                </div>




                <div class="row-panels-mini">
                    <h2><a href="" title="Vector Logos">Humans</a></h2>
                    <ul>

                        <%

                            categoryList = Category.getLimitedCategory(19, 4);

                            if (categoryList.size() > 0) {
                                String category_name = "";
                                Iterator it = (Iterator) categoryList.iterator();
                                while (it.hasNext()) {
                                    Map categoryMap = (Map) it.next();
                                    category_name = categoryMap.get("name").toString().trim().toLowerCase();

                                    List categoryImageList = Category.getImageByCategoryType(category_name);
                                    Iterator it2 = (Iterator) categoryImageList.iterator();
                                    if (it2.hasNext()) {
                                        Map map = (Map) it2.next();
                        %>
                        <li>
                            <a href="gallery.jsp?category_name=<% out.write(map.get("category_name").toString().trim().toLowerCase()); %>" >
                                <span 
                                    class="image reveal" 
                                    style="background-image: url(../asset/<% out.write(map.get("largeImage").toString()); %>)">  
                                </span>
                                <span class="label"><% out.write(map.get("category_name").toString()); %></span>
                            </a>
                        </li>

                        <%  }
                                }
                            }%>

                    </ul>
                </div>



                <div class="row-badges">
                    <ul>

                        <%

                            categoryList = Category.getLimitedCategory(20, 5);// fake value
                            //                             categoryList = Category.getLimitedCategory(23, 5); // correct value

                            if (categoryList.size() > 0) {
                                String category_name = "";
                                Iterator it = (Iterator) categoryList.iterator();
                                while (it.hasNext()) {
                                    Map categoryMap = (Map) it.next();
                                    category_name = categoryMap.get("name").toString().trim().toLowerCase();

                                    List categoryImageList = Category.getImageByCategoryType(category_name);
                                    Iterator it2 = (Iterator) categoryImageList.iterator();
                                    if (it2.hasNext()) {
                                        Map map = (Map) it2.next();
                        %>
                        <li>
                            <a href="gallery.jsp?category_name=<% out.write(map.get("category_name").toString().trim().toLowerCase()); %>" >
                                <span 
                                    class="image reveal" 
                                    style="background-image: url(../asset/<% out.write(map.get("largeImage").toString()); %>)">  
                                </span>
                                <span class="label"><% out.write(map.get("category_name").toString()); %></span>
                            </a>
                        </li>

                        <%  }
                                }
                            }%>
                    </ul>
                </div>



                <div class="row-panels-normal resized">
                    <h2> <a href="" title="Holidays">Travel</a></h2>
                    <ul>

                        <%

                            categoryList = Category.getLimitedCategory(20, 5); // fake value
                            //                             categoryList = Category.getLimitedCategory(28, 5); // correct value

                            if (categoryList.size() > 0) {
                                String category_name = "";
                                Iterator it = (Iterator) categoryList.iterator();
                                while (it.hasNext()) {
                                    Map categoryMap = (Map) it.next();
                                    category_name = categoryMap.get("name").toString().trim().toLowerCase();

                                    List categoryImageList = Category.getImageByCategoryType(category_name);
                                    Iterator it2 = (Iterator) categoryImageList.iterator();
                                    if (it2.hasNext()) {
                                        Map map = (Map) it2.next();
                        %>
                        <li>
                            <a href="gallery.jsp?category_name=<% out.write(map.get("category_name").toString().trim().toLowerCase()); %>" >
                                <span 
                                    class="image reveal" 
                                    style="background-image: url(../asset/<% out.write(map.get("largeImage").toString()); %>)">  
                                </span>
                                <span class="label"><% out.write(map.get("category_name").toString()); %></span>
                            </a>
                        </li>

                        <%  }
                                }
                            }%>

                    </ul>
                </div>
            </article>
        </section>
        <!--for footer-->
        <%@include file="footer.jsp" %>
        <script src="../asset/js/common.js" type="text/javascript"></script>
        <script src="../asset/js/model.js" type="text/javascript" ></script>

        <script type="text/javascript">
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
