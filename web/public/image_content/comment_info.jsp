
<%@page import="com.admin.ImageComment"%>
<%
    int user_id = 0;
    if (session.getAttribute("user_id") != null) {
        String cart_user_id = session.getAttribute("user_id").toString();
        if (cart_user_id != null) {
            user_id = Integer.parseInt(cart_user_id);
        }
    }

    String comment_text = request.getParameter("comment_text");
    String rating_text = request.getParameter("rating");
    String image_id_text = request.getParameter("image_id");
    String type = request.getParameter("type");

    ImageComment imageComment = new ImageComment();

    if (type.contentEquals("insert")) {
        if (user_id != 0 && comment_text != null && comment_text != "" && rating_text != null && rating_text != "" && image_id_text != null) {
//            for both Ratting and Review
            int rating = Integer.parseInt(rating_text);
            int image_id = Integer.parseInt(image_id_text);

            imageComment.insertImageComment(user_id, comment_text, rating, image_id);
            imageComment.insertRatingReview(rating, image_id);

//            System.out.println("for Ratting and Review");
        }
        if (user_id != 0  && (comment_text == null || comment_text == "") && rating_text != null && rating_text != "" && image_id_text != null) {
            // for Ratting or star
            int rating = Integer.parseInt(rating_text);
            int image_id = Integer.parseInt(image_id_text);
            imageComment.insertRating(rating, image_id);

//            System.out.println("for Ratting or star");
        }
        if (user_id != 0 && comment_text != null && comment_text != "" && (rating_text == null || rating_text == "") && image_id_text != null) {
            // for Review or comment
            int image_id = Integer.parseInt(image_id_text);
            imageComment.insertReviewComment(user_id, comment_text, image_id);
            imageComment.insertReview(image_id);
            
//            System.out.println("for Review or comment");
        }
    }

    String comment_id_text = request.getParameter("comment_id");
    if (type.contentEquals("like")) {
        if (comment_id_text != null) {
            int comment_id = Integer.parseInt(comment_id_text);
            imageComment.insertLike(comment_id, user_id);
        }
    }

    if (type.contentEquals("dislike")) {
        if (comment_id_text != null) {
            int comment_id = Integer.parseInt(comment_id_text);
            imageComment.insertDisLike(comment_id, user_id);
        }
    }


%>