<%-- 
    Document   : gallery
    Created on : Jun 20, 2020, 9:00:02 AM
    Author     : shoumitro
--%>

<%@page import="com.admin.Category"%>
<%@page import="com.admin.Image"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="../asset/images/web_icon/ps_small.png"/>
        <title>PhotoStock Gallery</title>
        <link rel="stylesheet" href="../asset/css/font-awesome.css"/>
        <link rel="stylesheet" href="../asset/css/common.css"/>
        <link rel="stylesheet" href="../asset/css/model.css"/>
        <link rel="stylesheet" href="../asset/css/gallery.css"/>
        <link rel="stylesheet" href="../asset/css/my_section.css"/>
        <style>

        </style>
    </head>
    <body onload="onBodyLoad()">
        <!--Header-->
        <%@include file="header.jsp" %>
        <%@include file="model.jsp" %>
        <main>

            <%@include file="preview.jsp" %>

            <%@include file="shopping_cart_menu.jsp" %>
            <%@include file="account_section/acc_side_menu.jsp" %>
            <%
                int floatingUserId = 0;

                if (session.getAttribute("user_id") != null) {
                    String cart_user_id2 = session.getAttribute("user_id").toString();
                    if (cart_user_id2 != null) {
                        floatingUserId = Integer.parseInt(cart_user_id2);
                    }
                }

                List list, list2;
                Image p = new Image();
                String type = "", key = "", category_name = "";

                if (request.getParameter("category_name") != null) {
                    category_name = request.getParameter("category_name").toLowerCase().trim();
                    list = Category.getImageByCategoryType(category_name);

                } else {

                    if (request.getParameter("body_search_box") != null) {
                        type = request.getParameter("select_box").toLowerCase().trim();
                        key = request.getParameter("body_search_box").toLowerCase().trim();
                        list = Image.galleryImageByKeyword(key, type);

                    } else if (request.getParameter("top_search_box") != null) {
                        type = request.getParameter("select_box").toLowerCase().trim();
                        key = request.getParameter("top_search_box").toLowerCase().trim();
                        list = Image.galleryImageByKeyword(key, type);

                    } else {
                        list = p.galleryImage();
                    }

                }
                //for result not found
                if (list.size() < 1) {
                    list2 = Image.getSubstringSearch(key, type);
                } else {
                    list2 = p.galleryImage();
                }

//                System.out.println("&&&&&&&&&&&&&&&&");
//                System.out.println(list.size());
//                System.out.println("&&&&&&&&&&&&&&&&");

            %>
            <section>
                <div id="collection" class="collection">
                    <ul>
                        <%                            Iterator it = (Iterator) list.iterator();
                            if (it.hasNext()) {
                        %> 

                        <%
                            while (it.hasNext()) {
                                Map map = (Map) it.next();
                        %>
                        <li>
                            <a  href="image.jsp?id=<%out.write(map.get("image_id").toString());%>" target="_self">
                                <span class="title"><%out.write(map.get("name").toString());%></span>
                                <span class="image">
                                    <img 
                                        src="../asset/<%out.write(map.get("largeImage").toString());%>"
                                        title="<%out.write(map.get("name").toString());%>"
                                        alt="<%out.write(map.get("name").toString());%>" 
                                        class="reveal">
                                </span>
                            </a>
                            <div class="bg">
                                <div class="actions">
                                    <ul>
                                        <li image-id="<%out.write(map.get("image_id").toString());%>">
                                            <% if (floatingUserId == 0) { %>
                                            <button onclick="loginForm()" class="cart_btn" type="button">
                                                <% } else {%>
                                                <button onclick="inCart(this)" class="cart_btn" type="button">
                                                    <% } %>
                                                    <em>Add to </em>Cart
                                                </button>
                                        </li>
                                        <li wish-image-id="<%out.write(map.get("image_id").toString());%>">
                                            <% if (floatingUserId == 0) { %>
                                            <button onclick="loginForm()" type="button">
                                                <% } else {%>
                                                <button class="wishcart" onclick="insertWishlist(this)" type="button">
                                                    <% } %>
                                                    <em>Wishlist</em>
                                                </button>
                                        </li>
                                    </ul>
                                    <span class="link">
                                        <!--<em>View</em>Similar Images-->
                                        <em onclick="openPreView('<%out.write(map.get("name").toString());%>', '<%out.write(map.get("desginer_name").toString());%>', '<%out.write(map.get("largeImage").toString());%>')">Preview</em>
                                    </span>
                                </div>
                            </div>
                        </li>
                        <%  }%>

                        <% } else {
                        %>
                        <%@include file="image_content/not_found.jsp" %>

                        <%
                            Iterator it2 = (Iterator) list2.iterator();
                            while (it2.hasNext()) {
                                Map map = (Map) it2.next();
                        %>
                        <li>
                            <a  href="image.jsp?id=<%out.write(map.get("image_id").toString());%>" target="_self">
                                <span class="title"><%out.write(map.get("name").toString());%></span>
                                <span class="image">
                                    <img 
                                        src="../asset/<%out.write(map.get("largeImage").toString());%>"
                                        title="<%out.write(map.get("name").toString());%>"
                                        alt="<%out.write(map.get("name").toString());%>" 
                                        class="reveal">
                                </span>
                            </a>
                            <div class="bg">
                                <div class="actions">
                                    <ul>
                                        <li image-id="<%out.write(map.get("image_id").toString());%>">
                                            <% if (floatingUserId == 0) { %>
                                            <button onclick="loginForm()" class="cart_btn" type="button">
                                                <% } else {%>
                                                <button onclick="inCart(this)" class="cart_btn" type="button">
                                                    <% } %>
                                                    <em>Add to </em>Cart
                                                </button>
                                        </li>
                                        <li wish-image-id="<%out.write(map.get("image_id").toString());%>">
                                            <% if (floatingUserId == 0) { %>
                                            <button onclick="loginForm()" type="button">
                                                <% } else {%>
                                                <button class="wishcart" onclick="insertWishlist(this)" type="button">
                                                    <% } %>
                                                    <em>Wishlist</em>
                                                </button>
                                        </li>
                                    </ul>
                                    <span class="link">
                                        <!--<em>View</em>Similar Images-->
                                        <em onclick="openPreView('<%out.write(map.get("name").toString());%>', '<%out.write(map.get("desginer_name").toString());%>', '<%out.write(map.get("largeImage").toString());%>')">Preview</em>
                                    </span>
                                </div>
                            </div>
                        </li>
                        <%  }%>
                        <% }%>

                        <!--minify-->
                        <!--<li> <a target="_self"> <span class="title">Adobe Photo</span> <span class="image"> <img src="../asset/images/adobe/a9.jpeg" title="Adobe Image" alt="Adobe" class="reveal"> </span> </a> <div class="bg"> <div class="actions"> <ul> <li> <button type="button"> <em>Add to </em>Cart </button> </li><li> <button type="button"> <em>In </em>Cart </button> </li></ul> <span class="link"> <em>View</em>Similar Images </span> </div></div></li>-->

                    </ul>
                </div>
            </section>






            <div class="gallery-pagination">
                <input type="button" id="first"  value="first" />
                <input type="button" id="previous"  value="&lt;" />
                <input type="text" id="page_input"  />
                <span class="pg-small-text"><em id="current_page"></em>of <em id="total_page"></em> pages</span>
                <input type="button" id="next" value="&gt;" />
                <input type="button" id="last" value="last" />
                <div id="list"></div>
            </div>
        </main>
        <%@include file="footer.jsp" %>
        <script src="../asset/js/gallery.js" type="text/javascript"></script>
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
        <script type="text/javascript">
            (function () {
                var list = [];
                var pageList = [];
                var currentPage = 1;
                var numberPerPage = 30;
                var numberOfPages = 0;
                var item_list = document.querySelectorAll("section>.collection>ul>li");


                function displayNone() {
                    for (var i = 0; i < item_list.length; i++) {
                        item_list[i].style.display = "none";
                    }
                }
                function makeList() {
                    for (var x = 0; x < item_list.length; x++)
                        list.push(x);

                    numberOfPages = getNumberOfPages();
                }
                function getNumberOfPages() {
                    return Math.ceil(list.length / numberPerPage);
                }
                document.getElementById("next").onclick = function () {
                    currentPage += 1;
                    loadList();
                };
                document.getElementById("first").onclick = function () {
                    currentPage = 1;
                    loadList();
                };
                document.getElementById("previous").onclick = function () {
                    currentPage -= 1;
                    loadList();
                };
                document.getElementById("last").onclick = function () {
                    currentPage = numberOfPages;
                    loadList();
                };
                document.getElementById("page_input").oninput = function () {
                    currentPage = this.value * 1;
                    //console.log(currentPage)
                    if (currentPage < 1) {
                        currentPage = 1;
                    } else if (currentPage > numberOfPages) {
                        currentPage = numberOfPages;
                    } else {
                        if (!(currentPage < 1 || currentPage.toString() == 'NaN' || currentPage > numberOfPages)) {
                            loadList();
                        }
                    }

                };
                function loadList() {
                    var begin = ((currentPage - 1) * numberPerPage);
                    var end = begin + numberPerPage;

                    pageList = list.slice(begin, end);
                    drawList();
                    check();
                    document.getElementById("current_page").innerHTML = currentPage;
                    document.getElementById("total_page").innerHTML = numberOfPages;
//                    window.location = "#collection";
                }
                function drawList() {
                    displayNone();
                    //document.getElementById("list").innerHTML = "";
                    for (var r = 0; r < pageList.length; r++) {
                        //document.getElementById("list").innerHTML += pageList[r] + "<br/>";
                        var p_item = pageList[r];
                        item_list[p_item].style.display = "block";
                    }
                }
                function check() {
                    document.getElementById("next").disabled = currentPage == numberOfPages ? true : false;
                    document.getElementById("previous").disabled = currentPage == 1 ? true : false;
                    document.getElementById("first").disabled = currentPage == 1 ? true : false;
                    document.getElementById("last").disabled = currentPage == numberOfPages ? true : false;
                }
                function load() {
                    makeList();
                    loadList();
                }
                window.onload = load;
            })();
        </script>
    </body>
</html>
