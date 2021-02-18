<%-- 
    Document   : comment
    Created on : Jul 30, 2020, 1:49:41 PM
    Author     : shoumitro
--%>

<%@page import="com.admin.ImageComment"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
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
        <title>Comment</title>
    </head>
    <body>

        <%
            List list = ImageComment.getAllComment();
            List list2 = ImageComment.getAllCommentLike();
            List list3 = ImageComment.getAllCommentDisLike();
            int size = list.size();
            int like = list2.size();
            int dislike = list3.size();
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
                        <p class="panel-head">Comment</p>
                        <main>
                            <!-- for code separate file-->

                            <div class="table-container">

                                <div class="tab-content">
                                    <ul>
                                        <li><a class="all_time_tab_active" id="tab_bar_1" onclick="tabShow(this, 'tab_content_1', 'tab_bar_1')" href="">Comment</a></li> 
                                        <li><a id="tab_bar_2" onclick="tabShow(this, 'tab_content_2', 'tab_bar_2')" href="">Like</a></li> 
                                        <li><a id="tab_bar_3" onclick="tabShow(this, 'tab_content_3', 'tab_bar_3')" href="">DisLike</a></li> 

                                    </ul>
                                </div>
                                <div id="tab_content_1" class="table-content">

                                    <table id="table_1" class="table">
                                        <caption>
                                            <span class="caption-searchbox">
                                                <input id="table_1_search_box" onkeyup="tableSearchBox('table_1_search_box', 'table_1')" type="search" name="desginer_list_search_box" placeholder="Search..." />
                                            </span>
                                            <span class="caption-text">Comment (<% out.write(size + ""); %>)</span>
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
                                                <th onclick="sortTable(this, 0, 'table_1')" class="th_down">comment_id</th>
                                                <th onclick="sortTable(this, 1, 'table_1')" class="th_updown">like_count</th>
                                                <th onclick="sortTable(this, 2, 'table_1')" class="th_updown">dislike_count </th>
                                                <th onclick="sortTable(this, 3, 'table_1')" class="th_updown">rating</th>
                                                <th onclick="sortTable(this, 4, 'table_1')" class="th_updown">description</th>
                                                <th onclick="sortTable(this, 5, 'table_1')" class="th_updown">commentDate</th>
                                                <th onclick="sortTable(this, 6, 'table_1')" class="th_updown">image_id</th>
                                                <th onclick="sortTable(this, 7, 'table_1')" class="th_updown">user_id</th>
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
                                                <td><% out.write(map.get("comment_id").toString()); %></td>
                                                <td><% out.write(map.get("like_count").toString()); %></td>
                                                <td><% out.write(map.get("dislike_count").toString()); %></td>
                                                <td><% out.write(map.get("rating").toString()); %></td>
                                                <td><% out.write(map.get("description").toString()); %></td>
                                                <td><% out.write(map.get("commentDate").toString()); %></td>
                                                <td><% out.write(map.get("image_id").toString()); %></td>
                                                <td><% out.write(map.get("user_id").toString()); %></td>
                                                <td style="min-width: 0;" class="edit">
                                                    <button onclick="openDeleteAlert(<% out.write(map.get("comment_id").toString()); %>)" title="delete" class="fa fa-trash"></button>
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
                                            <span class="caption-text">Total Like (<% out.write(like + ""); %>)</span>
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
                                                <th onclick="sortTable(this, 0, 'table_2')" class="th_updown">like_id</th>
                                                <th onclick="sortTable(this, 1, 'table_2')" class="th_down">comment_id</th>
                                                <th onclick="sortTable(this, 2, 'table_2')" class="th_updown">user_id</th>
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
                                                <td><% out.write(map.get("like_id").toString()); %></td>
                                                <td><% out.write(map.get("comment_id").toString()); %></td>
                                                <td><% out.write(map.get("user_id").toString()); %></td>
                                                <td style="min-width: 0;" class="edit">
                                                    <button onclick="openDeleteAlert(<% out.write(map.get("like_id").toString()); %>)" title="delete" class="fa fa-trash"></button>
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
                                <div id="tab_content_3" class="table-content">

                                    <table id="table_3" class="table">
                                        <caption>
                                            <span class="caption-searchbox">
                                                <input id="table_3_search_box" onkeyup="tableSearchBox('table_3_search_box', 'table_3')" type="search" name="desginer_list_search_box" placeholder="Search..." />
                                            </span>
                                            <span class="caption-text">Total dislike (<% out.write(dislike + ""); %>)</span>
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
                                                <th onclick="sortTable(this, 0, 'table_3')" class="th_updown">dislike_id</th>
                                                <th onclick="sortTable(this, 1, 'table_3')" class="th_down">comment_id</th>
                                                <th onclick="sortTable(this, 2, 'table_3')" class="th_updown">user_id</th>
                                                <th style="text-align: center;cursor: initial;">Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                Iterator iterator3 = list3.iterator();
                                                while (iterator3.hasNext()) {
                                                    Map map = (Map) iterator3.next();
                                            %>
                                            <tr>
                                                <td><% out.write(map.get("dislike_id").toString()); %></td>
                                                <td><% out.write(map.get("comment_id").toString()); %></td>
                                                <td><% out.write(map.get("user_id").toString()); %></td>
                                                <td style="min-width: 0;" class="edit">
                                                    <button onclick="openDeleteAlert(<% out.write(map.get("dislike_id").toString()); %>)" title="delete" class="fa fa-trash"></button>
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
