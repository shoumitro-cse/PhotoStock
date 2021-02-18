<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.admin.Designer"%>
<%@page import="java.util.List"%>
<header>
    <nav>
        <div class="mb-fixed-menu-container">
            <span onclick="showAccountMenu()" class="user-icon"></span>
            <span class="notice-icon" onclick="showNotification()"></span>
            <span onclick="menuIcon(this)" id="sm_menu" class="fa fa-bars"></span>
            <a id="sm-logo" class="desktop-none" href="index.jsp"><img src="../asset/images/web_icon/ps_small.png" alt=""/></a>
            <span class=" mb-icon mb-cart-icon"></span>
            <span class="mb-icon mb-wish-icon"></span>
        </div>
        <%@include file="notification_menu.jsp" %>
        <script>
            function menuIcon(x) {
                //x.classList.toggle("change");
                var mt = document.getElementById("menuId");
                if (mt.style.display === "block") {
                    mt.style.display = "none";
                } else {
                    mt.style.display = "block";
                }
            }
            
            function signOut(e) {
                e.preventDefault();
                xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState === 4 && this.status === 200) {
                        window.location = "";
//                      localStorage.setItem("login_user_id", false);
                        sessionStorage.setItem("login_user_id", false);
                        console.log(sessionStorage);
                    }
                };
                xhttp.open("GET", "user_account/logout.jsp", true);
                xhttp.send();
            }
            
            function employeeSignOut(e) {
                e.preventDefault();
                xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState === 4 && this.status === 200) {
                        window.location = "";
                    }
                };
                xhttp.open("GET", "user_account/employee_signout.jsp", true);
                xhttp.send();
            }
            
            
        </script>
        <%--<%@taglib uri="http://java.sun.com/jsp/jstl/core" %>--%>
        <ul id="menuId">
            <li class="close-menu fa fa-close" onclick="this.parentNode.style.display = 'none'"></li>
   
         <% if (session.getAttribute("designer_id") == null) {%>
            
            <%
                if (session.getAttribute("login") != null) {
                    if (Boolean.parseBoolean(session.getAttribute("login").toString())) { %>
            <li class="item-float-right"><a href="profile.jsp"><span class="fa fa-user"></span> My Account</a></li>
            <li class="item-float-right"><a onclick="signOut(event)" href="#"><span  class="fa fa-sign-out"></span> SignOut</a></li>
                <% } else { %>
            <li class="item-float-right " ><a onclick="signupForm()" href="#"><span class="fa fa-sign-in"></span> SignUp</a></li>
            <li class="item-float-right " ><a onclick="loginForm()" href="#"><span class="fa fa-sign-in"></span> SignIn</a></li>
                <% }
                } else {%>
            <li class="item-float-right " ><a onclick="signupForm()" href="#"><span class="fa fa-sign-in"></span> SignUp</a></li>
            <li class="item-float-right " ><a onclick="loginForm()" href="#"><span class="fa fa-sign-in"></span> SignIn</a></li>

            <% }%>
        <% } else {%>
            <li class="item-float-right"><a href="employee.jsp"><span class="fa fa-user"></span> Employee</a></li>
            <li class="item-float-right"><a onclick="employeeSignOut(event)" href="#"><span  class="fa fa-sign-out"></span> SignOut</a></li>
      
        <% }%>
            
            
            <li class="item-float-right " ><a href="pricing.jsp">Pricing</a></li>
            <li class="item-float-right " ><a href="contact.jsp">Contact</a></li>
            <li><a href="gallery.jsp">Gallery</a></li>
            
            
            <%
                List selectList = Designer.getDesignerTypeList();
                Iterator selectList_it = selectList.iterator();
                while (selectList_it.hasNext()) {
                    Map map = (Map) selectList_it.next();
            %>

            <li><a href="gallery.jsp?select_box=<% out.write(map.get("type").toString().trim().toLowerCase()); %>&body_search_box="><% out.write(map.get("type").toString()); %> </a></li>

            <% }%>

            <li><a href="categories.jsp">Categories</a></li>

        </ul>             
    </nav>
</header>
<div class="search-container">
    <div class="logo-content">
        <a target="_blank" href="index.jsp"><img src="../asset/images/web_icon/ps_small.png" alt=""  width="200px"/>
            <span>PhotoStock</span></a>
        <!--<a href="index.jsp"><img src="../asset/images/web_icon/ps.png" alt=""  width="200px"/></a>-->
    </div>
    <div class="search-content">
        <form id="search_form" action="gallery.jsp" method="get">
            <div class="search-control-group"> 
                <select onchange="document.getElementById('search_form').submit(); sessionStorage.setItem('body_select_box', this.value);" name="select_box" id="body-select-box">
                    <option selected="true" value="all">All Photographs</option>
                    <%
                        Iterator selectTList_it = selectList.iterator();
                        while (selectTList_it.hasNext()) {
                            Map map = (Map) selectTList_it.next();
                    %>
                    <option style="text-transform: capitalize" value="<% out.write(map.get("type").toString().toLowerCase()); %>">
                        <% out.write(map.get("type").toString()); %> 
                    </option>
                    <% }%>
                </select>

                <span class="fa fa-search body-search-icon"></span>
                <input autocomplete="off" type="search" name="body_search_box" placeholder="Search...." id="body-search-box" />
                <a href="gallery.jsp"  class="gallery-img fa-2x fa fa-image"> Gallery </a>
            </div>
        </form>
    </div>
</div>

