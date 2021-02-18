
<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.account.Order"%>
<%
    int user_id = 0;
    if (session.getAttribute("user_id") != null) {
        String cart_user_id = session.getAttribute("user_id").toString();
        if (cart_user_id != null) {
            user_id = Integer.parseInt(cart_user_id);
        }
    }

    Order order = new Order();
    List orderList = order.getAllInvoiceOrderItem(user_id);
//    System.out.println("list size : " + orderList.size());
%>
<section class="order">
    <section class="my-order">
        <div class="my-order-info">
            <div class="my-order-heading">
                <h1>My Orders</h1>
                <p>Your Total Order: <span>
                        <%
                            if (orderList.size() > 0) {
                                out.write(orderList.size() + "");
                            } else {
                                out.write("0");
                            }
                        %>
                    </span></p>               
            </div>

            <div class="my-order-heading-sort">
                <form action="">
                    <div class="or-row">
                        <div class="or-col-2 sm-100">
                            <label>Order Id:</label>&nbsp;
                            <input class="orId-input" type="text" name="status" placeholder="Order Id" />
                        </div>
                        <div class="or-col-4 sm-100">
                            <label>Status:</label>&nbsp;
                            <select name="orderStatus" class="custom-select">
                                <option value="" selected="">Select Any</option>
                                <option value="PROCESSING">Processing</option>
                                <option value="APPROVED">Approved</option>
                                <option value="ON_SHIPPING">On Shipping</option>
                                <option value="SHIPPED">Shipped</option>
                                <option value="COMPLETED">Completed</option>
                                <option value="CANCELLED">Cancelled</option>
                                <option value="RETURNED">Returned</option>
                            </select>
                        </div>
                        <div class="or-col-4 sm-100">
                            <input type="submit" class="or-submit" value="Submit">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <section class="my-order-card">

        <%
            for (int i = 0; i < orderList.size(); i++) {
                List li = (List) orderList.get(i);
                Iterator it = li.iterator();
                while (it.hasNext()) {
                    Map map = (Map) it.next();
//                    System.out.println(map.get("item_count"));
//                    System.out.println(map.get("totalPrice"));

                    List imageList = (List) map.get("imageList");
                    Iterator it2 = imageList.iterator();
        %>
        <!--per order card-->
        <div class="my-order-card-wrapper">
            <div class="my-order-card-meta">
                <h1>
                    Your Order ID: <em><% out.write(map.get("order_id").toString()); %></em>
                    (<% out.write(map.get("item_count").toString()); %> items) 
                    | Payment Amount: <em>$<% out.write(map.get("totalPrice").toString()); %></em>
                </h1>
                <!--<a href="" class="or-btn ">Pay by Card</a>-->
            </div>
            <div class="status">
                <span class="or-btn ">Approved</span>
                <a class="or-btn track" href="purchase_image.jsp?order_id=<% out.write(map.get("order_id").toString()); %>">Track My Order</a>
            </div>

            <div class="my-order-card-content">
                <div class="or-row">
                    <%
                        while (it2.hasNext()) {
                            Map imageMap = (Map) it2.next();
                    %>
                    <!--column-->
                    <div class="or-col-25 or-mb-col-50 ">
                        <a href="image.jsp?id=<% out.write(imageMap.get("image_id").toString()); %> " class="or-item">
                            <figure>
                                <img src="../asset/<% out.write(imageMap.get("largeImage").toString()); %>" alt="">
                            </figure>
                            <p class="or-img-title"><% out.write(imageMap.get("name").toString()); %></p>
                            <div class="or-price">
                                $<% out.write(imageMap.get("alternatePrice").toString()); %> <strike style="color: gray">$<% out.write(imageMap.get("unitPrice").toString()); %></strike> <span>(<% out.write(imageMap.get("percentRate").toString()); %> % Off)</span>
                            </div>
                        </a>
                    </div>
                    <% }%>
                </div>
            </div>
        </div>
        <%
                }
            }
        %>


    </section>
</section>