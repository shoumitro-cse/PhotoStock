<%-- 
    Document   : view
    Created on : Jul 31, 2020, 1:38:09 PM
    Author     : shoumitro
--%>
<%@page import="com.admin.AdminAccount"%>
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
        <link rel="stylesheet" href="../../asset/css/admin/form.css"/>
        <title> Admin Account List</title>
    </head>
    <body>

        <%
            List list = AdminAccount.getAllAdminAccount();
            int size = list.size();
        %>


        <!--for delete box-->
        <div id="delete_alert" class="delete-box">
            <%--<%@include file="delete_box.jsp" %>--%>
        </div>

        <!--for navigation-->
        <%@include file="../dashboard/navbar.jsp" %>

        <section>
            <div class="body-content">

                <!--for side menu-->
                <%@include  file="../dashboard/side_menu.jsp" %>

                <!--for main content-->
                <div class="body-main-container">
                    <div class="body-main-content">
                        <p class="panel-head">Total Account (<% out.write(size + ""); %>)</p>
                        <main>
                            <!-- for code separate file-->

                            <div class="table-container">

                                <div class="tab-content">
                                    <ul>
                                        <li><a class="all_time_tab_active" id="tab_bar_1" onclick="tabShow(this, 'tab_content_1', 'tab_bar_1')" href="">Table</a></li> 
                                        <li><a  id="tab_bar_2" onclick="tabShow(this, 'tab_content_2', 'tab_bar_2')" href="">Create</a></li> 

                                    </ul>
                                </div>
                                <div id="tab_content_1" class="table-content">

                                    <table id="table_1" class="table">
                                        <caption>
                                            <span class="caption-searchbox">
                                                <input id="table_1_search_box" onkeyup="tableSearchBox('table_1_search_box', 'table_1')" type="search" name="desginer_list_search_box" placeholder="Search..." />
                                            </span>
                                            <span class="caption-text">Admin Account List</span>
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
                                                <th onclick="sortTable(this, 0, 'table_1')" class="th_down">admin_id</th>
                                                <th onclick="sortTable(this, 1, 'table_1')" class="th_updown">name</th>
                                                <th onclick="sortTable(this, 2, 'table_1')" class="th_updown">email</th>
                                                <th onclick="sortTable(this, 3, 'table_1')" class="th_updown">password</th>
                                                <th onclick="sortTable(this, 4, 'table_1')" class="th_updown">last_login</th>
                                                <th onclick="sortTable(this, 5, 'table_1')" class="th_updown">isActive</th>
                                                <th onclick="sortTable(this, 7, 'table_1')" class="th_updown">picture_url</th>
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
                                                <td><% out.write(map.get("admin_id").toString()); %></td>
                                                <td><% out.write(map.get("name").toString()); %></td>
                                                <td><% out.write(map.get("email").toString()); %></td>
                                                <td><% out.write(map.get("password").toString()); %></td>
                                                <td><% out.write(map.get("last_login").toString()); %></td>
                                                <td><% out.write(map.get("isActive").toString()); %></td>
                                                <td><% out.write(map.get("picture_url").toString()); %></td>
                                                <td style="min-width: 0;" class="edit">
                                                    <!--<a href=""  onclick="adminUpdateFormBoxOpen(<% out.write(map.get("admin_id").toString()); %>)"  title="edit" class="fa fa-edit"></a>-->
                                                    <a href="account.jsp?admin_id=<% out.write(map.get("admin_id").toString()); %>" title="edit" class="fa fa-edit"></a>
                                                    <a href="" onclick="openAdminDeleteAlert(<% out.write(map.get("admin_id").toString()); %>)" title="delete" class="fa fa-trash"></a>
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
                                    <div id="insert_form_container" class="form-container">
                                        <form id="admin_insert_form" action="insert.jsp" method="get" >
                                            <input type="hidden" name="page" value="view.jsp" />
                                            <%@include file="insert_form.jsp" %>
                                        </form>
                                    </div>
                                </div>

                            </div>

                        </main>
                    </div>
                </div>

            </div>
        </section>

        <!--add javascript-->
        <script src="../../asset/js/admin/common.js" type="text/javascript"></script>
        <script src="../../asset/js/admin/admin_account.js" type="text/javascript"></script>
        <!--for footer-->
        <%@include file="../dashboard/footer.jsp" %>

    </body>
</html>
