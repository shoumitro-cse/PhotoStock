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
        <title>Simple</title>
    </head>
    <body>

        <%
            List list = User.getAllSimpleUser();
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
                        <p class="panel-head">Simple User (<% out.write(size+""); %>)</p>
                        <main>
                            <!-- for code separate file-->

                            <div class="table-container">

                                <div class="tab-content">
                                    <ul>
                                        <li><a class="all_time_tab_active" id="introduct_tab_id" onclick="tabShow(this, 'simple_inroduction', 'introduct_tab_id')" href="">Introduction</a></li> 
                                        <li><a class="all_time_tab_active" id="simple_addr_tab_id" onclick="tabShow(this, 'simple_addr', 'simple_addr_tab_id')" href="">Address</a></li> 
                                        <li><a class="all_time_tab_active" id="simple_fullTable_tab_id" onclick="tabShow(this, 'simple_fullTable', 'simple_fullTable_tab_id')" href="">Full Table</a></li> 

                                    </ul>
                                </div>
                                <div id="simple_inroduction" class="table-content">

                                    <table id="table_1" class="table">
                                        <caption>
                                            <span class="caption-searchbox">
                                                <input id="table_1_search_box" onkeyup="tableSearchBox('table_1_search_box', 'table_1')" type="search" name="desginer_list_search_box" placeholder="Search..." />
                                            </span>
                                            <span class="caption-text">inroduction</span>
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
                                                <th onclick="sortTable(this, 0, 'table_1')" class="th_down">ID</th>
                                                <th onclick="sortTable(this, 1, 'table_1')" class="th_updown">Fullname</th>
                                                <th onclick="sortTable(this, 2, 'table_1')" class="th_updown">Email</th>
                                                <th onclick="sortTable(this, 3, 'table_1')" class="th_updown">Password</th>
                                                <th onclick="sortTable(this, 4, 'table_1')" class="th_updown">Re_type_password</th>
                                                <th onclick="sortTable(this, 5, 'table_1')" class="th_updown">dob</th>
                                                <th onclick="sortTable(this, 6, 'table_1')" class="th_updown">Gender</th>
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
                                                <td><% out.write(map.get("simple_user_id").toString()); %></td>
                                                <td><% out.write(map.get("fullname").toString()); %></td>
                                                <td><% out.write(map.get("email").toString()); %></td>
                                                <td><% out.write(map.get("password").toString()); %></td>
                                                <td><% out.write(map.get("re_type_password").toString()); %></td>
                                                <td><% out.write(map.get("dob").toString()); %></td>
                                                <td><% out.write(map.get("gender").toString()); %></td>
                                                <td style="min-width: 0;" class="edit">
                                                    <button onclick="openDeleteAlert(<% out.write(map.get("simple_user_id").toString()); %>)" title="delete" class="fa fa-trash"></button>
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

                                <div id="simple_addr" class="table-content">

                                    <table id="table_2" class="table">
                                        <caption>
                                            <span class="caption-searchbox">
                                                <input id="table_2_search_box" onkeyup="tableSearchBox('table_2_search_box', 'table_2')" type="search" name="desginer_list_search_box" placeholder="Search..." />
                                            </span>
                                            <span class="caption-text">Address</span>
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
                                                <th onclick="sortTable(this, 0, 'table_2')" class="th_down">ID</th>
                                                <th onclick="sortTable(this, 1, 'table_2')" class="th_updown">Fullname</th>
                                                <th onclick="sortTable(this, 2, 'table_2')" class="th_updown">Country</th>
                                                <th onclick="sortTable(this, 3, 'table_2')" class="th_updown">City</th>
                                                <th onclick="sortTable(this, 4, 'table_2')" class="th_updown">State</th>
                                                <th onclick="sortTable(this, 5, 'table_2')" class="th_updown">permanent address</th>
                                                <th onclick="sortTable(this, 6, 'table_2')" class="th_updown">current address</th>
                                                <th onclick="sortTable(this, 7, 'table_2')" class="th_updown">zip</th>
                                                <th style="text-align: center;cursor: initial;">Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <%

                                                Iterator iterator2 = list.iterator();
                                                while (iterator2.hasNext()) {
                                                    Map map = (Map) iterator2.next();
                                            %>

                                            <tr>
                                                <td><% out.write(map.get("simple_user_id").toString()); %></td>
                                                <td><% out.write(map.get("fullname").toString()); %></td>
                                                <td><% out.write(map.get("country").toString()); %></td>
                                                <td><% out.write(map.get("city").toString()); %></td>
                                                <td><% out.write(map.get("state").toString()); %></td>
                                                <td><% out.write(map.get("permanent_addr").toString()); %></td>
                                                <td><% out.write(map.get("current_addr").toString()); %></td>
                                                <td><% out.write(map.get("zip").toString()); %></td>
                                                <td style="min-width: 0;" class="edit">
                                                    <button onclick="openDeleteAlert(<% out.write(map.get("simple_user_id").toString()); %>)" title="delete" class="fa fa-trash"></button>
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

                                <div id="simple_fullTable" class="table-content">

                                    <table id="table_3" class="table">
                                        <caption>
                                            <span class="caption-searchbox">
                                                <input id="table_3_search_box" onkeyup="tableSearchBox('table_3_search_box', 'table_3')" type="search" name="desginer_list_search_box" placeholder="Search..." />
                                            </span>
                                            <span class="caption-text">Full Table</span>
                                            <span class="caption-select-box">
                                                Show  <select class="select_box" id="table_3_select_box" name="item" onchange="pagination(this, 1, 'table_3_select_box', 'table_3', 'table_3_pagination')">
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
                                                <th onclick="sortTable(this, 0, 'table_3')" class="th_down">ID</th>
                                                <th onclick="sortTable(this, 1, 'table_3')" class="th_updown">Fullname</th>
                                                <th onclick="sortTable(this, 2, 'table_3')" class="th_updown">Email</th>
                                                <th onclick="sortTable(this, 3, 'table_3')" class="th_updown">Password</th>
                                                <th onclick="sortTable(this, 4, 'table_3')" class="th_updown">Re_type_password</th>
                                                <th onclick="sortTable(this, 5, 'table_3')" class="th_updown">dob</th>
                                                <th onclick="sortTable(this, 6, 'table_3')" class="th_updown">Gender</th>


                                                <th onclick="sortTable(this, 7, 'table_3')" class="th_updown">Country</th>
                                                <th onclick="sortTable(this, 8, 'table_3')" class="th_updown">City</th>
                                                <th onclick="sortTable(this, 9, 'table_3')" class="th_updown">State</th>
                                                <th onclick="sortTable(this, 10, 'table_3')" class="th_updown">permanent address</th>
                                                <th onclick="sortTable(this, 11, 'table_3')" class="th_updown">current address</th>
                                                <th onclick="sortTable(this, 12, 'table_3')" class="th_updown">zip</th>
                                                <th onclick="sortTable(this, 15, 'table_3')" class="th_updown">picture_url</th>
                                                <th style="text-align: center;cursor: initial;">Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <%

                                                Iterator iterator3 = list.iterator();
                                                while (iterator3.hasNext()) {
                                                    Map map = (Map) iterator3.next();
                                            %>

                                            <tr>
                                                <td><% out.write(map.get("simple_user_id").toString()); %></td>
                                                <td><% out.write(map.get("fullname").toString()); %></td>

                                                <td><% out.write(map.get("email").toString()); %></td>
                                                <td><% out.write(map.get("password").toString()); %></td>
                                                <td><% out.write(map.get("re_type_password").toString()); %></td>
                                                <td><% out.write(map.get("dob").toString()); %></td>
                                                <td><% out.write(map.get("gender").toString()); %></td>

                                                <td><% out.write(map.get("country").toString()); %></td>
                                                <td><% out.write(map.get("city").toString()); %></td>
                                                <td><% out.write(map.get("state").toString()); %></td>
                                                <td><% out.write(map.get("permanent_addr").toString()); %></td>
                                                <td><% out.write(map.get("current_addr").toString()); %></td>
                                                <td><% out.write(map.get("zip").toString()); %></td>
                                                <td><% out.write(map.get("picture_url").toString()); %></td>
                                                <td style="min-width: 0;" class="edit">
                                                    <button onclick="openDeleteAlert(<% out.write(map.get("simple_user_id").toString()); %>)" title="delete" class="fa fa-trash"></button>
                                                </td>
                                            </tr>  
                                            <% }%>

                                        </tbody>
                                        <tfoot>

                                        </tfoot>
                                    </table>
                                    <div id="table_3_pagination" class="table-pagination">

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
