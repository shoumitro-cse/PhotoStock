
<%@page import="com.admin.Designer"%>
<%
    String view_create = request.getParameter("view_create");
    String add_form = request.getParameter("add_form");

    //introduction
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

    int desginer_id = 0;
    if (first_name != null && surname != null && type != null && msg != null && phone != null && email != null && linkedin != null && facebook != null) {

        desginer_id = Designer.insertDesigner(first_name, surname, type, msg, phone, email, linkedin, facebook);

        session.setAttribute("desginer_id", desginer_id);
        if (view_create != null) {
            session.setAttribute("view_create", view_create);
        }
        if (add_form != null) {
            session.setAttribute("add_form", add_form);
        }

    }


%>








