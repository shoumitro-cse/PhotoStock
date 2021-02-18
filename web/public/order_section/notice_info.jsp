<%@page import="com.account.Notice"%>
<%
    int user_id = 0;
    if (session.getAttribute("user_id") != null) {
        String cart_user_id = session.getAttribute("user_id").toString();
        if (cart_user_id != null) {
            user_id = Integer.parseInt(cart_user_id);
        }
    }

    int notice_id = 0;
    if (request.getParameter("notice_id") != null) {
        notice_id = Integer.parseInt(request.getParameter("notice_id").toString());
    }

    if (notice_id != 0 && user_id != 0) {
        Notice notice = new Notice();
        notice.deteteNotice(notice_id, user_id);
    }

%>