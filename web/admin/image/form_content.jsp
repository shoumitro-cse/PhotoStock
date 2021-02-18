<%@page import="com.admin.DesignerWork"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="com.admin.Category"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.admin.Designer"%>
<%@page import="java.util.List"%>


<%
    int get_work_id = 0;
    String getId = request.getParameter("work_id");
    if (getId != null) {
        int id = Integer.parseInt(getId);
        get_work_id = id;

    }
   
   int stock=0;
   int desginer_id=0;
   String name = "";
   String designer_type = "";
   String img_url = "";
   DesignerWork dw = new DesignerWork();
   List des_work_list = dw.getDesignerWorkById(get_work_id);
   Iterator dw_it =  des_work_list.iterator();
   if (dw_it.hasNext()) {
     Map map = (Map)  dw_it.next();
//     System.out.println(map.get("name"));   
     stock=(int) map.get("stock");
     desginer_id=(int) map.get("desginer_id");
     List list = Designer.getDesignerListById(desginer_id);
     Iterator it = list.iterator();
     if (it.hasNext()) {
         Map m = (Map)it.next();
        designer_type = m.get("type").toString();
     }
     name = map.get("name").toString();
     img_url = map.get("img_url").toString();
  }

%>


<div class="p_row">
    <div class="col-50">
        <div class="col-content">
            <p class="col-heading">Introduction </p>
            <input type="hidden" id="image_id" name="image_id" value="0">
            
            <label for="name">Image Name </label>
            <% if(name != "") {%>
              <input value="<% out.write(name); %>" type="text" id="name" name="name" placeholder="Adobe Image">
            <%} else {%>
              <input type="text" id="name" name="name" placeholder="Image Name">
            <% }%>


            <% if(name != "") {%>
               <input type="hidden" disabled="true" value="<% out.write(desginer_id+""); %>" id="desginer_id" name="desginer_id" placeholder="desginer name">    
            <%} else {%>
                <label for="desginer_id">Designer Name</label>
                <select name="desginer_id" id="desginer_id" onchange="getDesignerType(this.value)">
                    <option selected="true" value="all" >select designer</option>
                    <%
                        List selectList = Designer.getDesignerList();
                        Iterator selectList_it = selectList.iterator();
                        while (selectList_it.hasNext()) {
                            Map map = (Map) selectList_it.next();
                    %>
                    <option value="<% out.write(map.get("desginer_id").toString()); %>">
                        <% out.write(map.get("fullname").toString()); %> (<% out.write(map.get("type").toString()); %> )
                    </option>
                    <% }%>
                </select>
           <% }%>

            <label for="category_id">Category</label>
            <select name="category_id" id="category_id">
                <option selected="true" value="all" >select category</option>
                <%
                    List categoryList = Category.getImageCategory();
                    Iterator category_it = (Iterator) categoryList.iterator();
                    while (category_it.hasNext()) {
                        Map map = (Map) category_it.next();
                %>        

                <option value="<% out.write(map.get("category_id").toString()); %>">
                    <% out.write(map.get("name").toString()); %>
                </option>

                <% }%>
            </select>



            <label for="header">Header Text </label>
            <input onchange="keywordAutocomplete(this.value)" type="text" id="header" name="header" placeholder="Adobe Image for banner">
        </div>
        <div class="col-content">
            <p class="col-heading">Pricing </p>
            <label for="unitPrice">Unit Price </label>
            <input onchange="autocompletePrice()" type="text" id="unitPrice" name="unitPrice" placeholder="$4">

            <label for="percentRate">Percent Rate</label>
            <input onchange="autocompletePrice()" type="text" id="percentRate" name="percentRate" placeholder="25%">

            <label for="alternatePrice">Alternate Price </label>
            <input type="text" id="alternatePrice" name="alternatePrice" placeholder="$3">

            <label for="saveMoney">Save Money</label>
            <input type="text" id="saveMoney" name="saveMoney" placeholder="$1">
        </div>
    </div>
    <div class="col-50">
        <div class="col-content">
            <% if(name != ""){%>            
            <p class="col-heading">Stock Info </p>
            <label for="total_stock">Total Stock </label>
            <input disabled="true" value="<% out.write(stock+""); %>"  type="text" id="total_stock" name="total_stock" placeholder="20">
            <label for="current_stock">Current Stock</label>
            <input disabled="true" value="<% out.write(stock+""); %>" type="text" id="current_stock" name="current_stock" placeholder="15">
            
          
            <% } else {%>
            <p class="col-heading">Stock Info </p>
            <label for="total_stock">Total Stock </label>
            <input onchange="stockAutocomplete(this.value)" type="text" id="total_stock" name="total_stock" placeholder="20">
            <label for="current_stock">Current Stock</label>
            <input onchange="currentStockAutocomplete(this.value)" type="text" id="current_stock" name="current_stock" placeholder="15">
            
            <% }%>
            <label for="uploadDate">Upload Date </label>
            <input onfocus="this.setAttribute('type', 'date')" type="text" id="uploadDate" value="<% out.write(LocalDateTime.now().toLocalDate().toString()); %>" name="uploadDate" placeholder="12-12-2020">
            <% if(name != ""){%>
            <input type="hidden" value="<% out.write(designer_type+""); %>" id="type" name="type">
            <% } else {%>
              <label for="type">Type </label>
              <input  style="background-color: #f0f0f0;color: #000;cursor: not-allowed" type="text" readonly="true" id="type" name="type" placeholder="Type is empty">
            <% }%>
       
        </div>
        <div class="col-content">
            <p class="col-heading">Meta Content </p>
            <label for="keyword">Keyword</label>
            <input type="text" id="keyword" name="keyword" placeholder="Animation">

            <label for="isTaxed">isTaxed </label>
            <!--<input type="text"  placeholder="false">-->
            <select id="isTaxed" name="isTaxed">
                <option value="all">select under task or not</option>
                <option selected="true" value="false">False</option>
                <option value="true">True</option>
            </select>

            <label for="longDescription">Description</label>
            <textarea id="longDescription" name="longDescription" placeholder="Image Description"></textarea>
           
            
            <% if(name != "") {%>
            <input value="<% out.write(img_url); %>" type="hidden" id="largeImage" form="image_picture_upload_form" name="largeImage">
            <input value="<% out.write(desginer_id+""); %>" type="hidden" id="desginer_id2" form="image_picture_upload_form" name="desginer_id">
            <input value="<% out.write(get_work_id+""); %>" type="hidden" id="get_work_id" form="image_picture_upload_form" name="get_work_id">
            <%} else {%>
            <label for="largeImage">Image url </label>
            <input type="file" id="largeImage" form="image_picture_upload_form" name="largeImage" placeholder="largeImage">
            <% }%>
            
        </div>

    </div>
</div>