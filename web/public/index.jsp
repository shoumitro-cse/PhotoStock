<%@page import="com.admin.Image"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>PhotoStock Graphics, Art, Photographs</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="../asset/images/web_icon/ps_small.png"/>
        <link rel="stylesheet" href="../asset/css/font-awesome.css"/>
        <link rel="stylesheet" href="../asset/css/common.css"/>
        <link rel="stylesheet" href="../asset/css/home.css"/>
        <link rel="stylesheet" href="../asset/css/model.css"/>
        <link rel="stylesheet" href="../asset/css/my_section.css"/>
        <style>
            #top-search-box::placeholder {
                /*font-size: 1.1rem;*/
            }
        </style>
    </head>
    <body onload="pageLoader()">

        <%@include file="header.jsp" %>
        <header>
            <figure>
                <img src="../asset/images/home/homepage1.jpg" />
            </figure>
            <section class="header-content">
                <div class="company-logo">
                    <a href="index.jsp"><img src="../asset/images/web_icon/ps.png" alt=""  width="200px"/></a>
                </div>
                <span>2,000+ Free Photographs for Adobe, Business and Banner.</span>
                <p>PhotoStock is a World's Premier only PhotoGraphs Marketplace</p>
                <form id="search_form_top" action="gallery.jsp" method="get">
                    <div>
                        <select onchange="document.getElementById('search_form_top').submit(); sessionStorage.setItem('body_select_box', this.value);" name="select_box" id="select-box">
                            <option selected="true" value="all">All Photographs</option>
<!--                       <option value="template" >Template</option>
                            <option value="premium">Premium</option>
                            <option value="3d">3D</option>
                            <option value="corona">Corona</option>
                            <option value="house">House Image</option>
                            <option value="nature">Nature</option>
                            <option value="food">Food</option>-->
                            <%
                                Iterator selectList_it2 = selectList.iterator();
                                while (selectList_it2.hasNext()) {
                                    Map map = (Map) selectList_it2.next();
                            %>
                            <option style="text-transform: capitalize" value="<% out.write(map.get("type").toString().toLowerCase()); %>">
                                <% out.write(map.get("type").toString()); %> 
                            </option>
                            <% }%>
                        </select>

                        <input autocomplete="off" type="search" name="top_search_box" placeholder="Search...." id="top-search-box" /><input type="submit" value="" id="top-search-submit" />
                    </div>
                </form>
                <br/>
                <p>5,00+ New Photographs Uploaded Today.</p>
            </section>
            <!--for model-->
        </header>
        <div class="last-news-info">
            <div class="last-news-cotainer">
                <span> Get Popular Photo Stock images.</span>
                <a href="categories.jsp">Start Now</a>
            </div>
        </div>
        <%@include file="model.jsp" %>
        <%@include file="account_section/acc_side_menu.jsp" %>
        <section id="categories" >
            <!--categories bar-->
            <nav>
                <ul>
                    <%
                        List typeList = selectList;
//                        List typeList = Designer.getDesignerTypeList();
                        Iterator typeList_it = typeList.iterator();
                        while (typeList_it.hasNext()) {
                            Map map = (Map) typeList_it.next();
                            int active_id = 1;
                    %>
                    <% if(active_id == 1) {%>
                    <li id="active_tab_link_id" onclick="openLayout(event, '<% out.write(map.get("type").toString().trim().toLowerCase()); %>')" class="<% out.write(map.get("type").toString().trim().toLowerCase()); %>  tablink"><a href=""><% out.write(map.get("type").toString().trim().toUpperCase()); %> </a> <span></span></li>
                    <% active_id ++; } else { %>
                    
                    <li onclick="openLayout(event, '<% out.write(map.get("type").toString().trim().toLowerCase()); %>')" class="<% out.write(map.get("type").toString().trim().toLowerCase()); %>  tablink"><a href=""><% out.write(map.get("type").toString().trim().toUpperCase()); %> </a> <span></span></li>
                    <% } 
                    }%>
                    
                </ul>
            </nav>
            <%
                String type_name = "";
                int limit_number = 0;
                int count = 0;
                boolean order_asc_by = true;
             %>
            <!--categories tab-->
            <div class="layout">
                
                   <%
                       int type_id = 4;
                        Iterator typeList_it2 = typeList.iterator();
                        while (typeList_it2.hasNext()) {
                            Map map2 = (Map) typeList_it2.next();
                            type_name = map2.get("type").toString().trim().toLowerCase();
                            
                             if(type_id < 1) {
                                 type_id = 4;
                             }
                    %>
                    

                        <%
                             limit_number = 9;
                             count = 1;
                             order_asc_by = true;
                         %>

                         <% if(type_name != "") { %>

                         <div class="<% out.write(type_name); %> <% out.write("type_"+type_id); %>  tab-content" >
                         <!--<div class="<% // out.write(type_name); %> type_3  tab-content" >-->
                            <div class="wrap">
                                <ul>
                                    <%
                                        List list = Image.getImageByType(type_name, limit_number, order_asc_by);
                                        Iterator it = (Iterator) list.iterator();

                                        while (it.hasNext()) {
                                            Map map = (Map) it.next();
                                    %> 

                                    <li class="<% out.write("img_"+count); %>"> <span class="loader"></span> <a class="" href="gallery.jsp?select_box=<% out.write(type_name); %>&body_search_box=" style="background-image: url(../asset/<% out.write(map.get("largeImage").toString()); %>)" title="<% out.write(map.get("name").toString()); %>"></a></li>

                                    <%
                                            count++;
                                        }
                                    %>
                                </ul>
                            </div>
                            <div class="list">
                                <ul>
                                    <% 
                                        order_asc_by = false;
                                        limit_number = 8;
                                       List list2 = Image.getImageByType(type_name, limit_number, order_asc_by);
                                       Iterator it2 = (Iterator) list2.iterator();                              
                                       while (it2.hasNext()) {
                                            Map map = (Map) it2.next();
                                    %>
                                    <!--<li><span class="loader"></span><a href="gallery.jsp?select_box=" style="background-image: url(../asset/<% out.write(map.get("largeImage").toString()); %>)" title="<% out.write(map.get("name").toString()); %>"></a></li>-->
                                    <li><span class="loader"></span><a href="gallery.jsp?select_box=all&body_search_box=<% out.write(map.get("name").toString().trim().substring(0, 3)); %>" style="background-image: url(../asset/<% out.write(map.get("largeImage").toString()); %>)" title="<% out.write(map.get("name").toString()); %>"></a></li>
                                   <% } %>

                                    <li class="more">
                                        <a href="gallery.jsp?select_box=<% out.write(type_name); %>&body_search_box=" title="<% out.write(type_name); %> photo">
                                            <span>
                                                <span class="label">Search <% out.write(type_name); %></span>
                                                <span class="button">View more!</span>
                                            </span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div> 
                     <% }  %>
                    
                    
                    <% type_id --; } %>
                    
                   

            </div>
            <div class="link">
                <a href="categories.jsp">View Image Categories</a>
            </div>
        </section>
        <section id="section-bottom">
            <div id="section-counter" class="row">
                <div class="column">
                    <div class="card">
                        <p><i class="fa fa-2x  fa-user"></i></p>
                        <h3>11+</h3>
                        <p>Partners</p>
                    </div>
                </div>

                <div class="column">
                    <div class="card">
                        <p><i class="fa fa-2x fa-check"></i></p>
                        <h3>246+</h3>
                        <p>3D Images</p>
                    </div>
                </div>

                <div class="column">
                    <div class="card">
                        <p><i class="fa fa-2x  fa-smile-o"></i></p>
                        <h3>100+</h3>
                        <p>Happy Clients</p>
                    </div>
                </div>

                <div class="column">
                    <div class="card">
                        <p><i class="fa fa-2x  fa-coffee"></i></p>
                        <h3>100+</h3>
                        <p>Meetings with Artist</p>
                    </div>
                </div>
            </div>
            <div id="pricing">
                <div>
                    <h2>PhotoStock Images and Prices</h2>
                    <h3>Millions of photographs with 10,000+ new added daily</h3>
                    <div class="options">
                        <ul>
                            <li>
                                <a href="pricing.jsp">
                                    <span class="value">
                                        <span class="cost">0<sup>$</sup></span>
                                        <span class="item">Free Photo</span>
                                    </span>
                                    <span class="title">Free PhotoGraphs</span>
                                    <span class="descr">5,000+ Free Image</span>
                                </a>
                            </li>
                            <li>
                                <a href="pricing.jsp" rel="nofollow">
                                    <span class="value">
                                        <span class="cost">69<sup>&cent;</sup></span>
                                        <span class="item">Images</span>
                                    </span>
                                    <span class="title">Subscription</span>
                                    <span class="descr">Monthly Image Plans</span>
                                </a>
                            </li>
                            <li>
                                <a href="pricing.jsp" rel="nofollow">
                                    <span class="value">
                                        <span class="cost">1<sup>$</sup></span>
                                        <span class="item">Images</span>
                                    </span>
                                    <span class="title">Credits</span>
                                    <span class="descr">Pre-paid Image Credits Pre-paid Image Credits</span>
                                </a>
                            </li>
                            <li>
                                <a href="pricing.jsp" >
                                    <span class="value">
                                        <span class="cost"><sup>$</sup>14<sup>.99</sup></span>
                                        <span class="item">Images</span>
                                    </span>
                                    <span class="title">Pay-per-Image</span>
                                    <span class="descr">One-off Image Purchase</span>
                                </a>
                            </li>

                        </ul>
                    </div>
                </div>
            </div>
        </section>
        <!-- This Footer Style is store inside home.css file -->
        <%@include file="footer.jsp" %>
        <script src="../asset/js/common.js" type="text/javascript"></script>
        <script src="../asset/js/home.js" type="text/javascript"></script>
        <script src="../asset/js/model.js" type="text/javascript"></script>
        <script type="text/javascript">
//            document.querySelector("recent-search").style.boxShadow = "none";
//              console.log( document.querySelector("recent-search"));
                        try {
                            if (document.getElementById("top-search-box")) {
                                autocomplete(document.getElementById("top-search-box"), autoCompleteKeywordList, rs);
                            }
                        } catch (e) {
                            console.log("cosole.log mesg => " + e);
                        }

        </script>

    </body>
</html>
