<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.account.UserAccountEdit"%>
<!--<span onclick="showAccountMenu()" class="user-icon"></span>-->
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
<%
    int p_user_id = 0;
    if (session.getAttribute("user_id") != null) {
        String cart_user_id = session.getAttribute("user_id").toString();
        if (cart_user_id != null) {
            p_user_id = Integer.parseInt(cart_user_id);
        }
    }

    String profile_picture_url = "", full_name = "";
    UserAccountEdit userAccountPList = new UserAccountEdit();
    List userInfoPList = userAccountPList.getUserInfo(p_user_id);
    if (userInfoPList.size() > 0) {
        Map map = (Map) userInfoPList.get(0);
        profile_picture_url = (String) map.get("picture_url");
        full_name = (String) map.get("full_name");
    }
    
%>
<!-- Sidebar -->
<!--<div style="display: none" id="account-mobile-menu" class="column-3">-->
<div  id="account-mobile-menu" class="column-3">
    <span onclick="this.parentNode.style.display = 'none'" class="fa fa-close desktop-close-none"></span>
    <aside>
        <div class="sidebar-info">
            <div class="profile-img">
                <img class="" src="../asset/<% if (profile_picture_url != "") {out.write(profile_picture_url);} %>" alt=""/>
            </div>
            <div class="info-content">
                <p>Hello,</p>
                <h4><% if (full_name != "") {out.write(full_name);} %></h4>
            </div>
        </div>
        <ul class="sidebar-menu">
            <!--<li class="active"></li>-->
            <li>
                <a id="profile"  href="profile.jsp" target="_self">My Accounts</a>
            </li>
            <li>
                <a id="order" href="order.jsp">My Orders</a>
            </li>
            <li>
                <a id="wishlist" class="active" href="wishlist.jsp">My Wishlist</a>
            </li>
            <li>
                <a href="">My Lists</a>
            </li>
            <li>
                <a  href="">My Rating &amp; Reviews</a>
            </li>
            <li>
                <a  href="">My Wallet</a>
            </li>
            <li>
                <a  href="">My Points</a>
            </li>
            <li>
                <a  href="">Load Gift Voucher</a>
            </li>
        </ul>
    </aside>
</div>