<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../asset/css/font-awesome.css" />
        <link rel="stylesheet" href="../asset/css/common.css" />
        <link rel="stylesheet" href="../asset/css/my_section.css" />
        <title>Profile, Order, list</title>
        <style>
        </style>
    </head>
    <body>

        <%@include file="header.jsp" %>
        <%@include file="shopping_cart_menu.jsp" %>

        <section>
            <div class="content-section">
                <div onclick="showAccountMenu()" class="user-icon">
                    <!--<span class="fa fa-user-circle"></span>-->
                </div>
                <script>
                    function showAccountMenu() {
                        var mb = document.getElementById("account-mobile-menu");
                        if (mb.style.display == "block") {
                            mb.style.display = "none";
                        } else {
                            mb.style.display = "block";
                        }
                    }
                </script>

                <!-- Sidebar -->
                <!--<div style="display: none" id="account-mobile-menu" class="column-3">-->
                <div  id="account-mobile-menu" class="column-3">
                    <aside>
                        <div class="sidebar-info">
                            <div class="profile-img">
                                <img class="" src="../asset/images/web_icon/img_avatar2.png" alt=""/>
                            </div>
                            <div class="info-content">
                                <p>Hello,</p>
                                <h4>Shoumitro Ray</h4>
                            </div>
                        </div>
                        <ul class="sidebar-menu">
                            <!--<li class="active"></li>-->
                            <li>
                                <a id="active-link" onclick="loadDoc(event, this)" href="account_section/profile.jsp" target="_self">My Accounts</a>
                            </li>
                            <li>
                                <a onclick="loadDoc(event, this)" href="/my-section/orders">My Orders</a>
                            </li>
                            <li>
                                <a onclick="loadDoc(event, this)" href="/my-section/list">My Lists</a>
                            </li>
                            <li>
                                <a onclick="loadDoc(event, this)" href="account_section/wish_list.jsp">My Wishlist</a>
                            </li>
                            <li>
                                <a onclick="loadDoc(event, this)" href="/my-section/reviews/not-reviewed">My Rating &amp; Reviews</a>
                            </li>
                            <li>
                                <a onclick="loadDoc(event, this)"href="/my-section/wallet">My Wallet</a>
                            </li>
                            <li>
                                <a onclick="loadDoc(event, this)" href="/my-section/point">My Points</a>
                            </li>
                            <li>
                                <a onclick="loadDoc(event, this)" href="/loadgiftvoucher">Load Gift Voucher</a>
                            </li>
                        </ul>
                    </aside>
                    <script>
                        function loadDoc(event, ele) {
                            event.preventDefault();
                            
                            var current_active = document.getElementsByClassName("active");
                            for (var i = 0; i < current_active.length; i++) {
                              current_active[i].className = current_active[i].className.replace(" active", "");
                            }
                            ele.parentNode.className += " active";
//                            console.log(current_active);
//                            console.log(ele.parentNode);
                            
                            var xhttp;
                            if (window.XMLHttpRequest) {
                                // code for modern browsers
                                xhttp = new XMLHttpRequest();
                            } else {
                                // code for IE6, IE5
                                xhttp = new ActiveXObject("Microsoft.XMLHTTP");
                            }
                            xhttp.onreadystatechange = function () {
                                if (this.readyState == 4 && this.status == 200) {
                                    document.getElementById("main-tab-content").innerHTML = this.responseText;
                                }
                            };
                            xhttp.open("GET", ele.pathname, true);
//                          xhttp.open("GET", "/PhotoStock/public/account_section/wish_list.jsp", true);
                            xhttp.send();
//                            for mobile phone
                            if (window.matchMedia("(max-width: 490px)").matches) {
                                 document.getElementById("account-mobile-menu").style.display = "none";
                            }
                        }
                        document.getElementById("active-link").click(); 
                    </script>
                </div>
                <!-- Main Content -->
                <div class="column-9">
                    <main id="main-tab-content" class="main-content">
                        <%--<%@include file="account_section/profile.jsp" %>--%>
                        <%--<%@include file="account_section/wish_list.jsp" %>--%>
                        <!--load for ajax data-->
                    </main>
                </div>
            </div>
        </section>

    </body>
</html>
