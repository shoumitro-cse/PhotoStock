<%-- 
    Document   : category
    Created on : Aug 3, 2020, 12:23:08 AM
    Author     : shoumitro
--%>
<%@page import="com.admin.Category"%>
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
        <title>Category</title>
    </head>
    <body>

        <%
            List list = Category.getImageCategory();
            int size = list.size();
        %>



        <!--for delete box-->
        <div id="delete_alert" class="delete-box">
            <div class="delete-box-content">
                <p style="margin-top: -40px;text-align: center;color: blue">Alert</p>
                <p class="delete-text">Are you sure delete?</p>
                <div style="text-align: right;padding-right: 10px;">
                    <a href="" onclick="" class="no_btn" >No</a>
                    <a href="" onclick="deleteCategoryItem()" class="yes_btn" >Yes</a>
                </div>
            </div>
        </div>


        <!--for update box-->
        <div id="insert_update_box" class="update-box">
            <div class="update-box-content">
                <div id="update_form_container" class="form-container">
                    <p style="text-align: center;margin: 0 0 20px 0;background-color: forestgreen;color: #fff" class="form-panel-head">
                        Update Form
                        <span onclick="document.getElementById('insert_update_box').style.display = 'none';" style="float: right;cursor: pointer;" class="fa fa-close"></span>
                    </p>
                    <form style="padding: 0 10px 3px 10px" id="admin_insert_form" action="update_category.jsp" method="get" >
                        <div class="p_row">
                            <div class="col-content m-20">
                                <p class="col-heading">Category Information</p> 
                                <div class="m-20"> 
                                    <input type="hidden" id="category_id"  name="category_id" value="0" />

                                    <label for="category_name">Category Name </label>
                                    <input type="text" id="category_name"  name="category_name" placeholder="Science.." />
                                    
                                </div>
                            </div>
                        </div>
                        <div class="f-submit-content">
                            <input onclick="adminFormValidation('update_form_container')" id="submit_btn" class="btn-active" type="submit" value="Save">
                            <span class="text-success-msg">Updated successfully</span>
                        </div>
                    </form>
                </div>
            </div>

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
                        <p class="panel-head">Total Category (<% out.write(size + ""); %>)</p>
                        <main>
                            <!-- for code separate file-->

                            <div class="table-container">

                                <div class="tab-content">
                                    <ul>
                                        <li><a class="all_time_tab_active" id="tab_bar_1" onclick="tabShow(this, 'tab_content_1', 'tab_bar_1')" href="">Table</a></li> 
                                        <li><a id="tab_bar_2" onclick="tabShow(this, 'tab_content_2', 'tab_bar_2')" href="">Create</a></li> 

                                    </ul>
                                </div>
                                <div id="tab_content_1" class="table-content">

                                    <table id="table_1" class="table">
                                        <caption>
                                            <span class="caption-searchbox">
                                                <input id="table_1_search_box" onkeyup="tableSearchBox('table_1_search_box', 'table_1')" type="search" name="desginer_list_search_box" placeholder="Search..." />
                                            </span>
                                            <span class="caption-text">Category</span>
                                            <span class="caption-select-box">
                                                Show  <select class="select_box" id="table_1_select_box" name="item" onchange="pagination(this, 1, 'table_1_select_box', 'table_1', 'table_1_pagination')">
                                                    <option value="5">5</option>
                                                    <option value="10">10</option>
                                                    <option value="20">20</option>
                                                    <option selected="true" value="30">30</option>
                                                    <option value="40">40</option>
                                                    <option value="60">60</option>
                                                    <option value="all">all</option>
                                                </select> entities
                                            </span>
                                        </caption>
                                        ,<thead>
                                            <tr>
                                                <th onclick="sortTable(this, 0, 'table_1')" class="th_down">category_id</th>
                                                <th onclick="sortTable(this, 1, 'table_1')" class="th_updown">name</th>
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
                                                <td><% out.write(map.get("category_id").toString()); %></td>
                                                <td><% out.write(map.get("name").toString()); %></td>
                                                <td style="min-width: 0;" class="edit">
                                                    <button onclick="openCategoryUpdateForm(<% out.write(map.get("category_id").toString()); %>)" title="edit" class="fa fa-edit"></button>
                                                    <button onclick="openCategoryDeleteAlert(<% out.write(map.get("category_id").toString()); %>)" title="delete" class="fa fa-trash"></button>
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
                                        <form id="admin_insert_form" action="insert_category.jsp" method="get" >
                                            <input type="hidden" name="page" value="view.jsp" />
                                            <div class="p_row">
                                                <div class="col-content m-20">
                                                    <p class="col-heading">Category Information</p> 
                                                    <div class="m-20"> 
                                                        <input type="hidden" id="category_id"  name="category_id" value="0" />

                                                        <label for="category_name">Category Name </label>
                                                        <input type="text" id="category_name"  name="category_name" placeholder="Science.." />

                                                        <!-- <br/>
                                                             <label for="email">Email </label>
                                                             <input type="email" id="email" name="email" placeholder="john12@gmail.com">
                                                             <br/>
                                                             <label for="password">Password </label>
                                                             <input type="password" id="password" name="password" placeholder="Password..">
                                                        -->
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="f-submit-content">
                                                <input onclick="adminFormValidation('insert_form_container')" id="submit_btn" class="btn-active" type="submit" value="Save">
                                                <span class="text-success-msg">Updated successfully</span>
                                            </div>
                                        </form>
                                    </div>
                                </div>

                            </div>

                        </main>
                    </div>
                </div>

            </div>
        </section>

        <script src="../../asset/js/admin/common.js" type="text/javascript"></script>
        <script src="../../asset/js/admin/admin_account.js" type="text/javascript"></script>
        <!--for footer-->
        <%@include file="../dashboard/footer.jsp" %>

    </body>
</html>
