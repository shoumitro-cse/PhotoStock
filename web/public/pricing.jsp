<%-- 
    Document   : pricing
    Created on : Aug 6, 2020, 6:45:08 PM
    Author     : shoumitro
--%>

<%@page import="com.admin.Image"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="../asset/images/web_icon/ps_small.png"/>
        <link rel="stylesheet" href="../asset/css/font-awesome.css" />
        <link rel="stylesheet" href="../asset/css/ionicons.css" />
        <link rel="stylesheet" href="../asset/css/common.css" />
        <link rel="stylesheet" href="../asset/css/model.css"/>
        <link rel="stylesheet" href="../asset/css/my_section.css" />
        <link rel="stylesheet" href="../asset/css/contact.css" />
        <title>Pricing</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <%@include file="model.jsp" %>

        <%@include file="shopping_cart_menu.jsp" %>
        <%@include file="account_section/acc_side_menu.jsp" %>

        <section>
            <div class="contact-container m-o">
                <div class="contact-heading pricing-content-heading">
                    <h1> PhotoStock Images (pricing)</h1>
                    <p>PhotoStock offer different type of pricing option that is help choice buy images.</p>
                    <div class="line-seperator"></div>
                </div>
                <div class="contact-body">
                    <div style="" class="contact-form-container pd-o">
                        <p style="" class="contact-title">Pricing</p>
                        <div class="pricing-container">

                            <%
                                Map map = (Map) Image.max_minPrice().get(0);

                                int min_price = (int) map.get("min_price");
                                int max_price = (int) map.get("max_price");
                                int max_percent_rate = (int) map.get("max_percent_rate");
                                int min_percent_rate = (int) map.get("min_percent_rate");

                            %>

                            <!--per item-->
                            <div class="pricing-item">
                                <div class="pricing-content">
                                    <div class="pricing-heading">
                                        Image pricing
                                    </div>
                                    <div class="pricing-body">
                                        <ul>
                                            <%                               
                                                
                                                Iterator imageTypeList_it = selectList.iterator();
                                                while (imageTypeList_it.hasNext()) {
                                                    Map map2 = (Map) imageTypeList_it.next();
                                            %>
                                            <li><span><% out.write(map2.get("type").toString()); %></span><span>$<% out.write(min_price+""); %>-$<% out.write(max_price+""); %></span></li>
                                            <% }%>
                                        </ul>
                                    </div>
                                    <div class="pricing-footer">
                                        <a href="contact.jsp"> Contact Us </a>
                                        <a href="gallery.jsp"> View Image </a>
                                    </div>
                                </div>
                            </div>
                            <!--per item-->
                            <div class="pricing-item">
                                <div class="pricing-content">
                                    <div class="pricing-heading">
                                        Image   Discount
                                    </div>
                                    <div class="pricing-body">
                                        <ul>
                                            <%                               
                                                
                                                Iterator imageTypeList_it2 = selectList.iterator();
                                                while (imageTypeList_it2.hasNext()) {
                                                    Map map2 = (Map) imageTypeList_it2.next();
                                            %>
                                            <li><span><% out.write(map2.get("type").toString()); %></span><span>(<% out.write(min_percent_rate+""); %>-<% out.write(max_percent_rate+""); %>)%</span></li>
                                            <% }%>
                                        </ul>
                                    </div>
                                    <div class="pricing-footer">
                                        <a href="contact.jsp"> Contact Us </a>
                                        <a href="gallery.jsp"> View Image </a>
                                    </div>
                                </div>
                            </div>




                        </div> 
                    </div>
                </div>
                <div class="contact-footer">

                </div>

            </div>
        </section>



        <!--for footer-->
        <%@include file="footer.jsp" %>
        <script src="../asset/js/common.js" type="text/javascript"></script>
        <script src="../asset/js/model.js" type="text/javascript" ></script>

        <script type="text/javascript">
            try {
                if (document.getElementById("body-search-box")) {
                    autocomplete(document.getElementById("body-search-box"), autoCompleteKeywordList, rs);
                }
            } catch (e) {
                console.log("cosole.log mesg => " + e);
            }

        </script>
    </body>
</html>
