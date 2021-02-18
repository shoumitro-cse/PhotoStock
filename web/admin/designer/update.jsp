<%@page import="com.admin.Designer"%>
<%

    //introduction
    String desginer_id_text = request.getParameter("desginer_id");

    String first_name = request.getParameter("first_name");
    String surname = request.getParameter("surname");
    String type = request.getParameter("type");
    String msg = request.getParameter("msg");
    String phone = request.getParameter("phone");

    //social
    String email = request.getParameter("email");
    String linkedin = request.getParameter("linkedin");
    String facebook = request.getParameter("facebook");
//    String picture_url = request.getParameter("picture_url");

    if (desginer_id_text != null && first_name != null && surname != null && type != null && msg != null && phone != null && email != null && linkedin != null && facebook != null) {
        int desginer_id = Integer.parseInt(desginer_id_text);
        Designer.updateDesigner(desginer_id, first_name, surname, type, msg, phone, email, linkedin, facebook);

        session.setAttribute("desginer_id", desginer_id);
        session.setAttribute("update", "update_form");
//        response.sendRedirect("view.jsp");
    }


%>

