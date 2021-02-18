<%-- 
    Document   : shopping_cart
    Created on : Jul 29, 2020, 11:58:43 AM
    Author     : shoumitro
--%>

<%@page import="com.admin.OrderInfo"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.admin.User"%>
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
        <title> Shopping Cart</title>
    </head>
    <body>

        <%

            List list1 = OrderInfo.getShopping();
            int size = list1.size();

            List list2 = OrderInfo.getShoppingCart();
            int sizeh = list2.size();
        %>

        <!--for navigation-->
        <%@include file="../dashboard/navbar.jsp" %>

        <section>
            <div class="body-content">

                <!--for side menu-->
                <%@include  file="../dashboard/side_menu.jsp" %>

                <!--for main content-->
                <div class="body-main-container">
                    <div class="body-main-content">
                        <p class="panel-head">Shopping</p>
                        <main>
                            <!-- for code separate file-->

                            <div class="table-container">

                                <div class="tab-content">
                                    <ul>
                                        <li><a class="all_time_tab_active" id="tab_bar_1" onclick="tabShow(this, 'tab_content_1', 'tab_bar_1')" href="">Shopping</a></li> 
                                        <li><a  id="tab_bar_2" onclick="tabShow(this, 'tab_content_2', 'tab_bar_2')" href="">Shopping Cart</a></li> 

                                    </ul>
                                </div>
                                <div id="tab_content_1" class="table-content">

                                    <table id="table_1" class="table">
                                        <caption>
                                            <span class="caption-searchbox">
                                                <input id="table_1_search_box" onkeyup="tableSearchBox('table_1_search_box', 'table_1')" type="search" name="desginer_list_search_box" placeholder="Search..." />
                                            </span>
                                            <span class="caption-text">Shopping (<% out.write(size + ""); %>)</span>
                                            <span class="caption-select-box">
                                                Show  <select class="select_box" id="table_1_select_box" name="item" onchange="pagination(this, 1, 'table_1_select_box', 'table_1', 'table_1_pagination')">
                                                    <option value="5">5</option>
                                                    <option selected="true" value="10">10</option>
                                                    <option value="20">20</option>
                                                    <option value="40">40</option>
                                                    <option value="60">60</option>
                                                    <option value="all">all</option>
                                                </select> entities
                                            </span>
                                        </caption>
                                        ,<thead>
                                            <tr>
                                                <th onclick="sortTable(this, 0, 'table_1')" class="th_down">shopping_id</th>
                                                <th onclick="sortTable(this, 1, 'table_1')" class="th_updown">item_count</th>
                                                <th onclick="sortTable(this, 2, 'table_1')" class="th_updown">totalPrice</th>
                                                <th onclick="sortTable(this, 3, 'table_1')" class="th_updown">totalSaveMony</th>
                                                <th onclick="sortTable(this, 4, 'table_1')" class="th_updown">user_id</th>
                                                <th style="text-align: center;cursor: initial;">Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                Iterator iterator1 = list1.iterator();
                                                while (iterator1.hasNext()) {
                                                    Map map = (Map) iterator1.next();
                                            %>
                                            <tr>
                                                <td><% out.write(map.get("shopping_id").toString()); %></td>
                                                <td><% out.write(map.get("item_count").toString()); %></td>
                                                <td><% out.write(map.get("totalPrice").toString()); %></td>
                                                <td><% out.write(map.get("totalSaveMony").toString()); %></td>
                                                <td><% out.write(map.get("user_id").toString()); %></td>
                                                <td style="min-width: 0;" class="edit">
                                                    <button onclick="openDeleteAlert(<% out.write(map.get("shopping_id").toString()); %>)" title="delete" class="fa fa-trash"></button>
                                                </td>
                                            </tr>  
                                            <% }%>
                                        </tbody>
                                        <tfoot>

                                        </tfoot>
                                    </table>
                                    <div id="table_1_pagination" class="table-pagination">

                                    </div>                        
                                </div>
                                <div id="tab_content_2" class="table-content">

                                    <table id="table_2" class="table">
                                        <caption>
                                            <span class="caption-searchbox">
                                                <input id="table_2_search_box" onkeyup="tableSearchBox('table_2_search_box', 'table_2')" type="search" name="desginer_list_search_box" placeholder="Search..." />
                                            </span>
                                            <span class="caption-text">Shopping Cart (<% out.write(sizeh + ""); %>)</span>
                                            <span class="caption-select-box">
                                                Show  <select class="select_box" id="table_2_select_box" name="item" onchange="pagination(this, 1, 'table_2_select_box', 'table_2', 'table_2_pagination')">
                                                    <option value="5">5</option>
                                                    <option selected="true" value="10">10</option>
                                                    <option value="20">20</option>
                                                    <option value="40">40</option>
                                                    <option value="60">60</option>
                                                    <option value="all">all</option>
                                                </select> entities
                                            </span>
                                        </caption>
                                        ,<thead>
                                            <tr>
                                                <th onclick="sortTable(this, 0, 'table_2')" class="th_down">cart_id</th>
                                                <th onclick="sortTable(this, 1, 'table_2')" class="th_updown">quantity</th>
                                                <th onclick="sortTable(this, 2, 'table_2')" class="th_updown">shopping_id</th>
                                                <th onclick="sortTable(this, 3, 'table_2')" class="th_updown">image_id</th>
                                                <th onclick="sortTable(this, 4, 'table_2')" class="th_updown">user_id</th>
                                                <th style="text-align: center;cursor: initial;">Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                Iterator iterator2 = list2.iterator();
                                                while (iterator2.hasNext()) {
                                                    Map map = (Map) iterator2.next();
                                            %>
                                            <tr>
                                                <td><% out.write(map.get("cart_id").toString()); %></td>
                                                <td><% out.write(map.get("quantity").toString()); %></td>
                                                <td><% out.write(map.get("shopping_id").toString()); %></td>
                                                <td><% out.write(map.get("image_id").toString()); %></td>
                                                <td><% out.write(map.get("user_id").toString()); %></td>
                                                <td style="min-width: 0;" class="edit">
                                                    <button onclick="openDeleteAlert(<% out.write(map.get("cart_id").toString()); %>)" title="delete" class="fa fa-trash"></button>
                                                </td>
                                            </tr>  
                                            <% }%>
                                        </tbody>
                                        <tfoot>

                                        </tfoot>
                                    </table>
                                    <div id="table_2_pagination" class="table-pagination">

                                    </div>                        
                                </div>



                            </div>

                        </main>
                    </div>
                </div>

            </div>
        </section>

        <script src="../../asset/js/admin/common.js" type="text/javascript"></script>
        <!--for footer-->
        <%@include file="../dashboard/footer.jsp" %>

    </body>
</html>
