
<%@page import="com.admin.Image"%>
<%

    // for introduction
    String name = request.getParameter("name");
    String desginer_id = request.getParameter("desginer_id");
    String category_id = request.getParameter("category_id");
    String header = request.getParameter("header");

    // for pricing
    String unitPrice = request.getParameter("unitPrice");
    String alternatePrice = request.getParameter("alternatePrice");
    String saveMoney = request.getParameter("saveMoney");
    String percentRate = request.getParameter("percentRate");

    // for stock
    String total_stock = request.getParameter("total_stock");
    String current_stock = request.getParameter("current_stock");
    String uploadDate = request.getParameter("uploadDate");
    String type = request.getParameter("type");

    // for meta
    String keyword = request.getParameter("keyword");
    String isTaxed = request.getParameter("isTaxed");
    String longDescription = request.getParameter("longDescription");

    String image_id = request.getParameter("image_id");

    Image.updateImage(image_id, name, desginer_id, category_id, header, unitPrice, alternatePrice, saveMoney, percentRate, total_stock, current_stock, uploadDate, type, keyword, isTaxed, longDescription);

    session.setAttribute("image_id", image_id);
    session.setAttribute("update", "update_form");

//    System.out.println(keyword);
//    System.out.println(image_id);

%>