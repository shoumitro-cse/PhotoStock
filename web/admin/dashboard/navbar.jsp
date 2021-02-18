
<%@page import="com.admin.Contact"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.admin.AdminAccount"%>
<%@page import="java.util.List"%>
<nav class="top-nav">
    <div>
        <a class="ad-logo-content" target="_blank" href="../../public/index.jsp">
            <span class="logo-img"> <img src="../../asset/images/web_icon/ps_small.png" alt=""/> </span>
            <span class="logo-text" >PhotoStock</span>
        </a>
    </div>
    <ul>
        <li style="margin-left: 1rem">

            <%
                String navbar_user_email = "";
                String navbar_user_name = "";
                String navbar_user_picture_url = "";
                int navbar_admin_id = 0;
                if (session.getAttribute("admin_id") != null) {
                    String admin_id_text = session.getAttribute("admin_id").toString();
                    if (admin_id_text != null && admin_id_text != "") {
                        navbar_admin_id = Integer.parseInt(admin_id_text);
                    }
                }

                List navbarlist = AdminAccount.getAdminAccountById(navbar_admin_id);
                Iterator navbarlist_it = (Iterator) navbarlist.iterator();

                if (navbarlist_it.hasNext()) {
                    Map map = (Map) navbarlist_it.next();
                    navbar_user_email = map.get("email").toString();
                    navbar_user_name = map.get("name").toString();
                    navbar_user_picture_url = map.get("picture_url").toString();
                }

                if (session.getAttribute("admin_login") != null) {
                    if ((Boolean.parseBoolean(session.getAttribute("admin_login").toString()))) {
            %> 

            <a style="background-image: url(../../asset/<% out.write(navbar_user_picture_url); %>);" href="" onclick="openAccountMenu(this)" class="account"></a>

            <% } else {%>
            <a style="background-image: url(../../asset/images/web_icon/img_avatar2.png);" href="javascript:void(0)" class="account"></a>
            <% }
            } else { %>
            <a style="background-image: url(../../asset/images/web_icon/img_avatar2.png);" href="javascript:void(0)" class="account"></a>
            <% }%>

        </li>


        <%
            List contact_active_list = Contact.getAllContactActiveInfo();
        %>

        <li class="navbar-msg-box" >
            <a onclick="massageBoxShow(this)"  href="../user/message.jsp"><span id="msg_quantity" class="msg-quantity"><% out.write(contact_active_list.size() + ""); %></span></a>
        </li>




        <!--        <li>
                    <a href="../image/image.jsp">Image</a>
                </li>-->
        <!--        <li>
                    <a href="../designer/designer.jsp">Designer</a>
                </li>-->

    </ul>

    <div id="account-d-menu" class="account-d-menu">
        <div class="menu-head-content">
            <img src="../../asset/<% out.write(navbar_user_picture_url); %>" alt="" />
            <div class="admin-details">
                <div class="admin-name"><% out.write(navbar_user_name); %></div>
                <div class="admin-email"><% out.write(navbar_user_email);%></div>
            </div>
        </div>
        <div class="separator"></div>
        <div class="item-content">
            <a href="../admin_account/account.jsp"><span class="fa fa-user"></span> Account</a>
            <a href="../login/logout.jsp"><span class="fa fa-sign-out"></span> Logout</a>
        </div>

    </div>

    <div id="notification_box" class="notifications-container">
        <h6 class="notifications-header">
            <span class="fa fa-envelope"></span>
            &nbsp;Message Center
        </h6>
        <div class="notifications-content">

            <%
                Iterator contact_active_list_it = (Iterator) contact_active_list.iterator();
                while (contact_active_list_it.hasNext()) {
                    Map map = (Map) contact_active_list_it.next();
            %>

            <a class="notifications-item" href="javascript:void(0)">
                <img class="notifications-item-img" width="40px" height="40px" src="../../asset/<% out.write(map.get("picture_url").toString()); %>">
                <div class="notifications-item-content">
                    <div class="notifications-item-content-text">Message from  <span class="msg-email"> <% out.write(map.get("email").toString()); %> </span></div>
                    <div class="notifications-item-content-details"><% out.write(map.get("msg").toString()); %></div>
                </div>
            </a>

            <% }%>


            <a class="notifications-footer" href="../user/message.jsp">
                Read All Messages
            </a>
        </div>
    </div>


</nav>

<script>
    function openAccountMenu(ele) {
        event.preventDefault();

        let account_d_menu = document.getElementById("account-d-menu");

        account_d_menu.classList.toggle("acc-m-show");

        document.addEventListener("click", function (event) {
            if (event.target !== ele) {
                account_d_menu.className = account_d_menu.className.replace("acc-m-show", "");
            }
        });
    }

    function massageBoxShow(ele) {
        event.preventDefault();

        let notification_box = document.getElementById("notification_box");
        notification_box.classList.toggle("acc-m-show");
//        console.log(notification_box);

        document.addEventListener("click", function (event) {
            if (event.target !== ele) {
                notification_box.className = notification_box.className.replace("acc-m-show", "");
            }
        });
    }

//    function noticeNotActive() {
//        event.preventDefault();
//        let xhttp = new XMLHttpRequest();
//        xhttp.onreadystatechange = function () {
//            if (this.readyState === 4 && this.status === 200) {
//               window.location = "../user/message.jsp";
//            }
//        };
//        xhttp.open("GET", "../dashboard/msg_not_active.jsp", true);
//        xhttp.send();
//    }


</script>