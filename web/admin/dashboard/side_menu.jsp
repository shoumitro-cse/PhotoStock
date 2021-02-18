
<%
    if (session.getAttribute("admin_login") != null) {
        if (!(Boolean.parseBoolean(session.getAttribute("admin_login").toString()))) {
            response.sendRedirect("../login/login.jsp");
        }
    } else {
        response.sendRedirect("../login/login.jsp");
    }

%>


<div class="body-left-side">
    <ul>
        <li>
            <a href="../index.jsp"><span class="fa fa-dashboard"></span> Dashboard</a>
        </li>
        <li>
            <p>Interface</p>
        </li>
        <li>
            <a href="../admin_account/admin.jsp"><span class="fa fa-adn"></span> Admin</a>
        </li>
        <li>
            <a href="../designer/designer.jsp"><span class="fa fa-wheelchair"></span> Designer </a>
        </li>
        <li>
            <a href="../image/image.jsp"><span class="fa fa-puzzle-piece"></span> Image</a>
        </li>
        <li>
            <a href="../user/user.jsp"><span class="fa fa-user"></span> User</a>
        </li>
        <li>
            <a href="../order/order.jsp"><span class="fa fa-first-order"></span> Order</a>
        </li>
        <li>
            <p>Interface</p>
        </li>
        <li>
            <a href="../table/table.jsp"><span class="fa fa-table" style="vertical-align: bottom"></span> Table</a>
        </li>
        <li>
            <a href="../chart/chart.jsp"><span class="fa fa-area-chart"></span> Chart</a>
        </li>
    </ul>

</div>
