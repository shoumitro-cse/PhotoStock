<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.admin.Designer"%>
<%@page import="java.util.List"%>


<table id="full_info_Table" class="table">
    <!--<caption>fullTable</caption>-->
    <caption>
        <span class="caption-searchbox">
            <input id="full_info_Table_search_box" onkeyup="tableSearchBox('full_info_Table_search_box', 'full_info_Table')" type="search" name="full_info_Table_search_box" placeholder="Search..." />
        </span>
        <span style="margin-left: -15%" class="caption-text">Full Table</span>
        <span style="float: none;margin-left: 18%;" class="caption-select-box">
            Show  <select  class="select_box" id="full_info_Table_select_box" name="item1" onchange="pagination(this, 1, 'full_info_Table_select_box', 'full_info_Table', 'full_info_Table_pagination')">
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
            <th onclick="sortTable(this, 0, 'full_info_Table')" class="th_down">ID</th>
            <th onclick="sortTable(this, 1, 'full_info_Table')" class="th_updown">Fullname</th>
            <th onclick="sortTable(this, 2, 'full_info_Table')" class="th_updown">Type</th>
            <th onclick="sortTable(this, 3, 'full_info_Table')" class="th_updown">Message</th>
            <th onclick="sortTable(this, 4, 'full_info_Table')" class="th_updown">Phone</th>
            <th onclick="sortTable(this, 5, 'full_info_Table')" class="th_updown">Linkedin</th>
            <th onclick="sortTable(this, 6, 'full_info_Table')" class="th_updown">Facebook</th>
            <th onclick="sortTable(this, 7, 'full_info_Table')" class="th_updown">Email</th>
            <th onclick="sortTable(this, 8, 'full_info_Table')" class="th_updown">Picture url</th>
            <th style="text-align: center;cursor: initial;">Actions</th>
        </tr>

    </thead>
    <tbody>                                          
        <%

            List list = Designer.getDesignerList();
            Iterator it3 = list.iterator();
            while (it3.hasNext()) {
                Map map = (Map) it3.next();
                // System.out.println(map.get("facebook"));
        %>
        <tr>
            <td><% out.write(map.get("desginer_id").toString()); %></td>

            <td><% out.write(map.get("fullname").toString()); %></td>
            <td><% out.write(map.get("type").toString()); %></td>
            <td><% out.write(map.get("msg").toString()); %></td>
            <td><% out.write(map.get("phone").toString()); %></td>

            <td><% out.write(map.get("linkedin").toString()); %></td>
            <td><% out.write(map.get("facebook").toString()); %></td>
            <td><% out.write(map.get("email").toString()); %></td>
            <td><% out.write(map.get("picture_url").toString()); %></td>

            <td class="edit">
                <button onclick="viewDesignerProfile(<% out.write(map.get("desginer_id").toString()); %>)" title="view" class="fa fa-eye"></button>
                <button  onclick="updateFormBoxOpen(<% out.write(map.get("desginer_id").toString()); %>)"  title="edit" class="fa fa-edit"></button>
                <button onclick="openDeleteAlert(<% out.write(map.get("desginer_id").toString()); %>)" title="delete" class="fa fa-trash"></button>
            </td>
        </tr>
        <% }%>
    </tbody>
    <tfoot>

    </tfoot>
</table>
<div id="full_info_Table_pagination" class="table-pagination">
</div>