<%-- 
    Document   : work
    Created on : Jan 11, 2021, 8:11:38 PM
    Author     : shoumitro
--%>

<%@page import="com.admin.DesignerWork"%>
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
        <link rel="stylesheet" href="../../asset/css/admin/form.css"/>
        <link rel="stylesheet" href="../../asset/css/admin/view.css"/>
        <!--<link rel="stylesheet" href="../../asset/css/admin/work.css"/>-->
        <title>Work</title>
    </head>
    <body>

        <!--for navigation-->
        <%@include file="../dashboard/navbar.jsp" %>

                <!--for delete box-->
        <div id="delete_alert" class="delete-box">
            <%--<%@include file="delete_box.jsp" %>--%>
        </div>
        
        <%

            DesignerWork dw = new DesignerWork();
            List list = dw.getAllDesginerWork();
            int size = list.size();
        %>

                                
          <section>
            <div class="body-content">

                <!--for side menu-->
                <%@include  file="../dashboard/side_menu.jsp" %>

                <!--for main content-->
                <div class="body-main-container">
                    <div class="body-main-content">
                        <p class="panel-head">Total (<% out.write(size+""); %>)</p>
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
                                            <span class="caption-text">Work List (<% out.write(size+""); %>)</span>
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
                                                <th onclick="sortTable(this, 0, 'table_1')" class="th_down">Designer Name</th>
                                                <th onclick="sortTable(this, 1, 'table_1')" class="th_updown">Image Name</th>
                                                <th onclick="sortTable(this, 2, 'table_1')" class="th_updown">Count</th>
                                                <th style="text-align: center;">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                Iterator it = list.iterator();
                                                while (it.hasNext()) {
                                                    Map map = (Map)it.next();
                                            %>
                                            <tr>
                                                <td style="text-transform: capitalize;"><%out.write(map.get("designer_name").toString());%></td>
                                                <td><%out.write(map.get("name").toString());%></td>
                                                <td><%out.write(map.get("count").toString());%></td>
                                                <td style="text-align: center;font-weight: bold;" class="td_actions">
                                                    <a style="color: green;font-weight: bold;" href="work_show.jsp?designer_id=<%out.write(map.get("desginer_id").toString());%>">Confirm</a>/
                                                    &nbsp; <a style="color: red;font-weight: bold;" href="" onclick="openDeleteAlert(<%out.write(map.get("work_id").toString());%>)">Delete</a>
                                                </td>
                                            </tr>

                                           <% } %>
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
                                

        <!--for footer-->
        <%@include file="../dashboard/footer.jsp" %>
        <script src="../../asset/js/admin/common.js" type="text/javascript"></script>
        <script>
            //for delete
            var id = 0;
            function openDeleteAlert(work_id) {
                event.preventDefault();
                let xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState === 4 && this.status === 200) {
                        document.getElementById("delete_alert").innerHTML = this.responseText;
                        document.getElementById("delete_alert").style.display = "block";
                        id = work_id;
                    }
                };
                xhttp.open("GET", "delete_box.jsp", true);
                xhttp.send();
            }
            
            function deleteItem() {
                event.preventDefault();
            //    window.location = "delete.jsp?id=" + id;
                window.location.assign("delete_work.jsp?work_id=" + id);
            }

        </script>

    </body>
</html>
