<%-- 
    Document   : order_item
    Created on : Jul 29, 2020, 11:10:16 AM
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
        <title>Total Order</title>
    </head>
    <body>

        <%
            List list = OrderInfo.getAllOrder();
            int size = list.size();
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
                        <p class="panel-head">Total Order (<% out.write(size+""); %>)</p>
                        <main>
                            <!-- for code separate file-->

                            <div class="table-container">

                                <div class="tab-content">
                                    <ul>
                                        <li><a class="all_time_tab_active" id="tab_bar_1" onclick="tabShow(this, 'tab_content_1', 'tab_bar_1')" href="">Table</a></li> 

                                    </ul>
                                </div>
                                <div id="tab_content_1" class="table-content">

                                    <table id="table_1" class="table">
                                        <caption>
                                            <span class="caption-searchbox">
                                                <input id="table_1_search_box" onkeyup="tableSearchBox('table_1_search_box', 'table_1')" type="search" name="desginer_list_search_box" placeholder="Search..." />
                                            </span>
                                            <span class="caption-text">Total Order</span>
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
                                                <th onclick="sortTable(this, 0, 'table_1')" class="th_down">order_id</th>
                                                <th onclick="sortTable(this, 1, 'table_1')" class="th_updown">user_id</th>
                                                <th onclick="sortTable(this, 2, 'table_1')" class="th_updown">invoice_image_id</th>
                                                <th onclick="sortTable(this, 3, 'table_1')" class="th_updown">payment_id</th>
                                                <th style="text-align: center;cursor: initial;">Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                Iterator iterator = list.iterator();
                                                while (iterator.hasNext()) {
                                                    Map map = (Map) iterator.next();
                                            %>
                                            <tr>
                                                <td><% out.write(map.get("order_id").toString()); %></td>
                                                <td><% out.write(map.get("user_id").toString()); %></td>
                                                <td><% out.write(map.get("invoice_image_id").toString()); %></td>
                                                <td><% out.write(map.get("payment_id").toString()); %></td>
                                                <td style="min-width: 0;" class="edit">
                                                    <button onclick="openDeleteAlert(<% out.write(map.get("order_id").toString()); %>)" title="delete" class="fa fa-trash"></button>
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
