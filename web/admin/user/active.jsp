<%-- 
    Document   : user
    Created on : Jul 22, 2020, 10:41:52 AM
    Author     : shoumitro
--%>

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
        <title>Active</title>
    </head>
    <body>

        <%
            List list = User.getActiveUser();
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
                        <p class="panel-head">Active User (<% out.write(size+""); %>)</p>
                        <main>
                            <!-- for code separate file-->

                            <div class="table-container">

                                <div class="tab-content">
                                    <ul>
                                        <li><a class="all_time_tab_active" id="introduct_tab_id" onclick="tabShow(this, 'active_inroduction', 'introduct_tab_id')" href="">Table</a></li> 

                                    </ul>
                                </div>
                                <div id="active_inroduction" class="table-content">

                                    <table id="table_1" class="table">
                                        <caption>
                                            <span class="caption-searchbox">
                                                <input id="table_1_search_box" onkeyup="tableSearchBox('table_1_search_box', 'table_1')" type="search" name="desginer_list_search_box" placeholder="Search..." />
                                            </span>
                                            <span class="caption-text">Active Table</span>
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
                                                <th onclick="sortTable(this, 0, 'table_1')" class="th_down">user_id</th>
                                                <th onclick="sortTable(this, 1, 'table_1')" class="th_updown">fullname</th>
                                                <th onclick="sortTable(this, 2, 'table_1')" class="th_updown">user_type</th>
                                                <th onclick="sortTable(this, 3, 'table_1')" class="th_updown">active</th>
                                                <th onclick="sortTable(this, 4, 'table_1')" class="th_updown">enter_datetime</th>
                                                <th onclick="sortTable(this, 5, 'table_1')" class="th_updown">exit_datetime</th>
                                                <th onclick="sortTable(this, 6, 'table_1')" class="th_updown">stay_amount_time</th>
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
                                                <td><% out.write(map.get("user_id").toString()); %></td>
                                                <td><% out.write(map.get("fullname").toString()); %></td>
                                                <td><% out.write(map.get("user_type").toString()); %></td>
                                                <td><% out.write(map.get("active").toString()); %></td>
                                                <td><% out.write(map.get("enter_datetime").toString()); %></td>
                                                <td><% out.write(map.get("exit_datetime").toString()); %></td>
                                                <td><% out.write(map.get("stay_amount_time").toString()); %></td>
                                                <td style="min-width: 0;" class="edit">
                                                    <button onclick="openDeleteAlert(<% out.write(map.get("active_id").toString()); %>)" title="delete" class="fa fa-trash"></button>
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
