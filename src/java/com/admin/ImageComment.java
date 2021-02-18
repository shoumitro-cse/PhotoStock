package com.admin;

import com.db_connect.MysqlDBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 *
 * @author shoumitro
 */
public class ImageComment extends Image {

    public void insertImageComment(int user_id, String comment_text, int rating, int image_id) throws SQLException {

        Connection con;
        con = MysqlDBConnection.getConnection();
        PreparedStatement ps;
        ResultSet rs;
        String sql;

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("E, dd MMM yyyy hh:mm:ss");

        String comment_date = LocalDateTime.now().format(formatter).toString();

        sql = "INSERT INTO `image_comment` ( `rating`, `longDescription`, `commentDate`, `image_id`, `user_id`) VALUES (?, ?, ?, ?, ?);";
        ps = con.prepareStatement(sql);
        ps.setInt(1, rating);
        ps.setString(2, comment_text);
        ps.setString(3, comment_date);
        ps.setInt(4, image_id);
        ps.setInt(5, user_id);
        ps.executeUpdate();
        con.close();

    }

    public void insertRatingReview(int rating, int image_id) throws SQLException {

        Connection con;
        con = MysqlDBConnection.getConnection();
        PreparedStatement ps;
        ResultSet rs;
        String sql;

        sql = "SELECT * FROM `image_rating_review` WHERE `image_id` = ?;";
        ps = con.prepareStatement(sql);
        ps.setInt(1, image_id);
        rs = ps.executeQuery();
        if (!rs.next()) {
            // for not exist record
            sql = "INSERT INTO `image_rating_review` (`ratings`, `reviews`, `point`, `oneStar`, `twoStar`, `threeStar`, `fourStar`, `fiveStar`, `image_id`) VALUES ('0', '0', '0.00', '0', '0', '0', '0', '0', ?); ";
            ps = con.prepareStatement(sql);
            ps.setInt(1, image_id);
            ps.executeUpdate();

            sql = "SELECT * FROM `image_rating_review` WHERE `image_id` = ?;";
            ps = con.prepareStatement(sql);
            ps.setInt(1, image_id);
            rs = ps.executeQuery();
            int onStar = 0, twoStar = 0, threeStar = 0, fourStar = 0, fiveStar = 0, rating_count = 0, reviews = 0;
            while (rs.next()) {
                onStar = rs.getInt("oneStar");
                twoStar = rs.getInt("twoStar");
                threeStar = rs.getInt("threeStar");
                fourStar = rs.getInt("fourStar");
                fiveStar = rs.getInt("fiveStar");
                rating_count = rs.getInt("ratings");
                reviews = rs.getInt("reviews");
            }

            if (rating == 1) {
                sql = "UPDATE `image_rating_review` SET `reviews` = '" + (reviews + 1) + "', `ratings` = '" + (rating_count + 1) + "', `oneStar` = '" + (onStar + 1) + "' WHERE image_id = ? ";
            }
            if (rating == 2) {
                sql = "UPDATE `image_rating_review` SET `reviews` = '" + (reviews + 1) + "', `ratings` = '" + (rating_count + 1) + "', `twoStar` = '" + (twoStar + 1) + "' WHERE image_id = ? ";
            }
            if (rating == 3) {
                sql = "UPDATE `image_rating_review` SET `reviews` = '" + (reviews + 1) + "', `ratings` = '" + (rating_count + 1) + "', `threeStar` = '" + (threeStar + 1) + "' WHERE image_id = ? ";
            }
            if (rating == 4) {
                sql = "UPDATE `image_rating_review` SET `reviews` = '" + (reviews + 1) + "', `ratings` = '" + (rating_count + 1) + "', `fourStar` = '" + (fourStar + 1) + "' WHERE image_id = ? ";
            }
            if (rating == 5) {
                sql = "UPDATE `image_rating_review` SET `reviews` = '" + (reviews + 1) + "', `ratings` = '" + (rating_count + 1) + "', `fiveStar` = '" + (fiveStar + 1) + "' WHERE image_id = ? ";
            }

            ps = con.prepareStatement(sql);
            ps.setInt(1, image_id);
            ps.executeUpdate();

        } else {
            //for exist record
            sql = "SELECT * FROM `image_rating_review` WHERE `image_id` = ?;";
            ps = con.prepareStatement(sql);
            ps.setInt(1, image_id);
            rs = ps.executeQuery();
            int onStar = 0, twoStar = 0, threeStar = 0, fourStar = 0, fiveStar = 0, rating_count = 0, reviews = 0;
            while (rs.next()) {
                onStar = rs.getInt("oneStar");
                twoStar = rs.getInt("twoStar");
                threeStar = rs.getInt("threeStar");
                fourStar = rs.getInt("fourStar");
                fiveStar = rs.getInt("fiveStar");
                rating_count = rs.getInt("ratings");
                reviews = rs.getInt("reviews");
            }

            if (rating == 1) {
                sql = "UPDATE `image_rating_review` SET `reviews` = '" + (reviews + 1) + "', `ratings` = '" + (rating_count + 1) + "', `oneStar` = '" + (onStar + 1) + "' WHERE image_id = ? ";
            }
            if (rating == 2) {
                sql = "UPDATE `image_rating_review` SET `reviews` = '" + (reviews + 1) + "', `ratings` = '" + (rating_count + 1) + "', `twoStar` = '" + (twoStar + 1) + "' WHERE image_id = ? ";
            }
            if (rating == 3) {
                sql = "UPDATE `image_rating_review` SET `reviews` = '" + (reviews + 1) + "', `ratings` = '" + (rating_count + 1) + "', `threeStar` = '" + (threeStar + 1) + "' WHERE image_id = ? ";
            }
            if (rating == 4) {
                sql = "UPDATE `image_rating_review` SET `reviews` = '" + (reviews + 1) + "', `ratings` = '" + (rating_count + 1) + "', `fourStar` = '" + (fourStar + 1) + "' WHERE image_id = ? ";
            }
            if (rating == 5) {
                sql = "UPDATE `image_rating_review` SET `reviews` = '" + (reviews + 1) + "', `ratings` = '" + (rating_count + 1) + "', `fiveStar` = '" + (fiveStar + 1) + "' WHERE image_id = ? ";
            }

            ps = con.prepareStatement(sql);
            ps.setInt(1, image_id);
            ps.executeUpdate();

        }

        con.close();
    }

    public void insertRating(int rating, int image_id) throws SQLException {

        Connection con;
        con = MysqlDBConnection.getConnection();
        PreparedStatement ps;
        ResultSet rs;
        String sql;

        sql = "SELECT * FROM `image_rating_review` WHERE `image_id` = ?;";
        ps = con.prepareStatement(sql);
        ps.setInt(1, image_id);
        rs = ps.executeQuery();
        if (!rs.next()) {
            // for not exist record
            sql = "INSERT INTO `image_rating_review` (`ratings`, `reviews`, `point`, `oneStar`, `twoStar`, `threeStar`, `fourStar`, `fiveStar`, `image_id`) VALUES ('0', '0', '0.00', '0', '0', '0', '0', '0', ?); ";
            ps = con.prepareStatement(sql);
            ps.setInt(1, image_id);
            ps.executeUpdate();

            sql = "SELECT * FROM `image_rating_review` WHERE `image_id` = ?;";
            ps = con.prepareStatement(sql);
            ps.setInt(1, image_id);
            rs = ps.executeQuery();
            int onStar = 0, twoStar = 0, threeStar = 0, fourStar = 0, fiveStar = 0, rating_count = 0;
            while (rs.next()) {
                onStar = rs.getInt("oneStar");
                twoStar = rs.getInt("twoStar");
                threeStar = rs.getInt("threeStar");
                fourStar = rs.getInt("fourStar");
                fiveStar = rs.getInt("fiveStar");
                rating_count = rs.getInt("ratings");
            }

            if (rating == 1) {
                sql = "UPDATE `image_rating_review` SET `ratings` = '" + (rating_count + 1) + "', `oneStar` = '" + (onStar + 1) + "' WHERE image_id = ? ";
            }
            if (rating == 2) {
                sql = "UPDATE `image_rating_review` SET `ratings` = '" + (rating_count + 1) + "', `twoStar` = '" + (twoStar + 1) + "' WHERE image_id = ? ";
            }
            if (rating == 3) {
                sql = "UPDATE `image_rating_review` SET `ratings` = '" + (rating_count + 1) + "', `threeStar` = '" + (threeStar + 1) + "' WHERE image_id = ? ";
            }
            if (rating == 4) {
                sql = "UPDATE `image_rating_review` SET `ratings` = '" + (rating_count + 1) + "', `fourStar` = '" + (fourStar + 1) + "' WHERE image_id = ? ";
            }
            if (rating == 5) {
                sql = "UPDATE `image_rating_review` SET `ratings` = '" + (rating_count + 1) + "', `fiveStar` = '" + (fiveStar + 1) + "' WHERE image_id = ? ";
            }

            ps = con.prepareStatement(sql);
            ps.setInt(1, image_id);
            ps.executeUpdate();

        } else {
            //for exist record
            sql = "SELECT * FROM `image_rating_review` WHERE `image_id` = ?;";
            ps = con.prepareStatement(sql);
            ps.setInt(1, image_id);
            rs = ps.executeQuery();
            int onStar = 0, twoStar = 0, threeStar = 0, fourStar = 0, fiveStar = 0, rating_count = 0;
            while (rs.next()) {
                onStar = rs.getInt("oneStar");
                twoStar = rs.getInt("twoStar");
                threeStar = rs.getInt("threeStar");
                fourStar = rs.getInt("fourStar");
                fiveStar = rs.getInt("fiveStar");
                rating_count = rs.getInt("ratings");
            }

            if (rating == 1) {
                sql = "UPDATE `image_rating_review` SET `ratings` = '" + (rating_count + 1) + "', `oneStar` = '" + (onStar + 1) + "' WHERE image_id = ? ";
            }
            if (rating == 2) {
                sql = "UPDATE `image_rating_review` SET `ratings` = '" + (rating_count + 1) + "', `twoStar` = '" + (twoStar + 1) + "' WHERE image_id = ? ";
            }
            if (rating == 3) {
                sql = "UPDATE `image_rating_review` SET `ratings` = '" + (rating_count + 1) + "', `threeStar` = '" + (threeStar + 1) + "' WHERE image_id = ? ";
            }
            if (rating == 4) {
                sql = "UPDATE `image_rating_review` SET `ratings` = '" + (rating_count + 1) + "', `fourStar` = '" + (fourStar + 1) + "' WHERE image_id = ? ";
            }
            if (rating == 5) {
                sql = "UPDATE `image_rating_review` SET `ratings` = '" + (rating_count + 1) + "', `fiveStar` = '" + (fiveStar + 1) + "' WHERE image_id = ? ";
            }

            ps = con.prepareStatement(sql);
            ps.setInt(1, image_id);
            ps.executeUpdate();

        }

        con.close();
    }

    public void insertReviewComment(int user_id, String comment_text, int image_id) throws SQLException {
        Connection con;
        con = MysqlDBConnection.getConnection();
        PreparedStatement ps;
        ResultSet rs;
        String sql;

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("E, dd MMM yyyy hh:mm:ss");

        String comment_date = LocalDateTime.now().format(formatter).toString();

        sql = "INSERT INTO `image_comment` ( `longDescription`, `commentDate`, `image_id`, `user_id`) VALUES (?, ?, ?, ?);";
        ps = con.prepareStatement(sql);
        ps.setString(1, comment_text);
        ps.setString(2, comment_date);
        ps.setInt(3, image_id);
        ps.setInt(4, user_id);
        ps.executeUpdate();
        con.close();

    }

    public void insertReview(int image_id) throws SQLException {

        Connection con;
        con = MysqlDBConnection.getConnection();
        PreparedStatement ps;
        ResultSet rs;
        String sql;

        sql = "SELECT * FROM `image_rating_review` WHERE `image_id` = ?;";
        ps = con.prepareStatement(sql);
        ps.setInt(1, image_id);
        rs = ps.executeQuery();
        if (!rs.next()) {
            // for not exist record
            sql = "INSERT INTO `image_rating_review` (`ratings`, `reviews`, `point`, `oneStar`, `twoStar`, `threeStar`, `fourStar`, `fiveStar`, `image_id`) VALUES ('0', '0', '0.00', '0', '0', '0', '0', '0', ?); ";
            ps = con.prepareStatement(sql);
            ps.setInt(1, image_id);
            ps.executeUpdate();

            sql = "SELECT * FROM `image_rating_review` WHERE `image_id` = ?;";
            ps = con.prepareStatement(sql);
            ps.setInt(1, image_id);
            rs = ps.executeQuery();
            int reviews = 0;
            while (rs.next()) {
                reviews = rs.getInt("reviews");
            }

            sql = "UPDATE `image_rating_review` SET `reviews` = ? WHERE `image_rating_review`.`image_id` = ?; ";
            ps = con.prepareStatement(sql);
            ps.setInt(1, reviews + 1);
            ps.setInt(2, image_id);
            ps.executeUpdate();

        } else {
            //for exist record
            sql = "SELECT * FROM `image_rating_review` WHERE `image_id` = ?;";
            ps = con.prepareStatement(sql);
            ps.setInt(1, image_id);
            rs = ps.executeQuery();
            int reviews = 0;
            while (rs.next()) {
                reviews = rs.getInt("reviews");
            }

            sql = "UPDATE `image_rating_review` SET `reviews` = ? WHERE `image_rating_review`.`image_id` = ?; ";
            ps = con.prepareStatement(sql);
            ps.setInt(1, reviews + 1);
            ps.setInt(2, image_id);
            ps.executeUpdate();
        }

        con.close();
    }

//Thank you for submitting your review. 
    public void insertLike(int comment_id, int user_id) throws SQLException {

        Connection con;
        con = MysqlDBConnection.getConnection();
        PreparedStatement ps;
        ResultSet rs;
        String sql;

        sql = "SELECT * FROM `comment_like` WHERE user_id = ? and comment_id = ?";
        ps = con.prepareStatement(sql);
        ps.setInt(1, user_id);
        ps.setInt(2, comment_id);
        rs = ps.executeQuery();
        if (!rs.next()) {
            sql = "INSERT INTO `comment_like` (`comment_id`, `user_id`) VALUES (?, ?); ";
            ps = con.prepareStatement(sql);
            ps.setInt(1, comment_id);
            ps.setInt(2, user_id);
            ps.executeUpdate();

            sql = "SELECT COUNT(*) as count FROM `comment_like` WHERE comment_id = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, comment_id);
            rs = ps.executeQuery();
            int like_count = 0;
            if (rs.next()) {
                like_count = rs.getInt("count");
            }

            if (like_count != 0) {
                sql = "UPDATE `image_comment` SET `like_count` = ? WHERE `image_comment`.`comment_id` = ?; ";
                ps = con.prepareStatement(sql);
                ps.setInt(1, (like_count));
                ps.setInt(2, comment_id);
                ps.executeUpdate();

            }
        } else {
            sql = "DELETE FROM `comment_like` WHERE  user_id = ? and comment_id = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, user_id);
            ps.setInt(2, comment_id);
            ps.executeUpdate();

            sql = "SELECT COUNT(*) as count FROM `comment_like` WHERE comment_id = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, comment_id);
            rs = ps.executeQuery();
            int like_count = 0;
            if (rs.next()) {
                like_count = rs.getInt("count");
            }

            if (like_count > -1) {
                sql = "UPDATE `image_comment` SET `like_count` = ? WHERE `image_comment`.`comment_id` = ?; ";
                ps = con.prepareStatement(sql);
                ps.setInt(1, (like_count));
                ps.setInt(2, comment_id);
                ps.executeUpdate();

            }
        }
        con.close();
    }

    public void insertDisLike(int comment_id, int user_id) throws SQLException {
        Connection con;
        con = MysqlDBConnection.getConnection();
        PreparedStatement ps;
        ResultSet rs;
        String sql;

        sql = "SELECT * FROM `comment_dislike` WHERE user_id = ? and comment_id = ?";
        ps = con.prepareStatement(sql);
        ps.setInt(1, user_id);
        ps.setInt(2, comment_id);
        rs = ps.executeQuery();
        if (!rs.next()) {
            sql = "INSERT INTO `comment_dislike` (`comment_id`, `user_id`) VALUES (?, ?); ";
            ps = con.prepareStatement(sql);
            ps.setInt(1, comment_id);
            ps.setInt(2, user_id);
            ps.executeUpdate();

            sql = "SELECT COUNT(*) as count FROM `comment_dislike` WHERE comment_id = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, comment_id);
            rs = ps.executeQuery();
            int dislike_count = 0;
            if (rs.next()) {
                dislike_count = rs.getInt("count");
            }

            if (dislike_count != 0) {
                sql = "UPDATE `image_comment` SET `dislike_count` = ? WHERE `image_comment`.`comment_id` = ?; ";
                ps = con.prepareStatement(sql);
                ps.setInt(1, (dislike_count));
                ps.setInt(2, comment_id);
                ps.executeUpdate();

            }
        } else {
            sql = "DELETE FROM `comment_dislike` WHERE  user_id = ? and comment_id = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, user_id);
            ps.setInt(2, comment_id);
            ps.executeUpdate();

            sql = "SELECT COUNT(*) as count FROM `comment_dislike` WHERE comment_id = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, comment_id);
            rs = ps.executeQuery();
            int dislike_count = 0;
            if (rs.next()) {
                dislike_count = rs.getInt("count");
            }

            if (dislike_count > -1) {
                sql = "UPDATE `image_comment` SET `dislike_count` = ? WHERE `image_comment`.`comment_id` = ?; ";
                ps = con.prepareStatement(sql);
                ps.setInt(1, (dislike_count));
                ps.setInt(2, comment_id);
                ps.executeUpdate();

            }
        }
        con.close();
    }

    public static List getAllComment() throws SQLException {
        List list;
        list = new ArrayList();

        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        con = MysqlDBConnection.getConnection();

        String sql = "SELECT * FROM `image_comment`";
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        while (rs.next()) {
            Map map = new Hashtable<String, String>();
            map.put("comment_id", rs.getInt("comment_id"));
            map.put("like_count", rs.getInt("like_count"));
            map.put("dislike_count", rs.getInt("dislike_count"));
            map.put("rating", rs.getInt("rating"));
//            map.put("shortDescription", rs.getString("shortDescription"));
            map.put("description", rs.getString("longDescription"));
            map.put("commentDate", rs.getString("commentDate"));
            map.put("image_id", rs.getInt("image_id"));
            map.put("user_id", rs.getInt("user_id"));
            list.add(map);
        }

//        Iterator it = (Iterator) list.iterator();
//        while (it.hasNext()) {
//            Map map = (Map) it.next();
//            System.out.println(map.get("comment_id"));
//            System.out.println(map.get("like_count"));
//            System.out.println(map.get("dislike_count"));
//            System.out.println(map.get("rating"));
//            System.out.println(map.get("longDescription"));
//            System.out.println(map.get("image_id"));
//            System.out.println(map.get("user_id"));
//            System.out.println("-----------");
//        }
        return list;
    }

    public static List getAllCommentLike() throws SQLException {
        List list;
        list = new ArrayList();

        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        con = MysqlDBConnection.getConnection();

        String sql = "SELECT * FROM `comment_like`";
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        while (rs.next()) {
            Map map = new Hashtable<String, String>();
            map.put("like_id", rs.getInt("like_id"));
            map.put("comment_id", rs.getInt("comment_id"));
            map.put("user_id", rs.getInt("user_id"));
            list.add(map);
        }

//        Iterator it = (Iterator) list.iterator();
//        while (it.hasNext()) {
//            Map map = (Map) it.next();
//            System.out.println(map.get("like_id"));
//            System.out.println(map.get("comment_id"));
//            System.out.println(map.get("user_id"));
//            System.out.println("-----------");
//        }
        return list;
    }

    public static List getAllCommentDisLike() throws SQLException {
        List list;
        list = new ArrayList();

        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        con = MysqlDBConnection.getConnection();

        String sql = "SELECT * FROM `comment_dislike`";
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        while (rs.next()) {
            Map map = new Hashtable<String, String>();
            map.put("dislike_id", rs.getInt("dislike_id"));
            map.put("comment_id", rs.getInt("comment_id"));
            map.put("user_id", rs.getInt("user_id"));
            list.add(map);
        }

//        Iterator it = (Iterator) list.iterator();
//        while (it.hasNext()) {
//            Map map = (Map) it.next();
//            System.out.println(map.get("dislike_id"));
//            System.out.println(map.get("comment_id"));
//            System.out.println(map.get("user_id"));
//            System.out.println("-----------");
//        }
        return list;
    }

    public static List getAllRatingAndReview() throws SQLException {
        List list;
        list = new ArrayList();

        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        con = MysqlDBConnection.getConnection();

        String sql = "SELECT * FROM `image_rating_review`";
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        while (rs.next()) {
            Map map = new Hashtable<String, String>();
            map.put("rating_review_id", rs.getInt("rating_review_id"));
            map.put("ratings", rs.getInt("ratings"));
            map.put("reviews", rs.getInt("reviews"));
            map.put("point", rs.getInt("point"));
            map.put("oneStar", rs.getString("oneStar"));
            map.put("twoStar", rs.getString("twoStar"));
            map.put("threeStar", rs.getString("threeStar"));
            map.put("fourStar", rs.getString("fourStar"));
            map.put("fiveStar", rs.getString("fiveStar"));
            map.put("image_id", rs.getInt("image_id"));
            list.add(map);
        }

//        Iterator it = (Iterator) list.iterator();
//        while (it.hasNext()) {
//            Map map = (Map) it.next();
//            System.out.println(map.get("rating_review_id"));
//            System.out.println(map.get("ratings"));
//            System.out.println(map.get("image_id"));
//
//            System.out.println("-----------");
//        }
        return list;
    }

    public static void main(String[] args) throws SQLException {
//        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("E, dd MMM yyyy hh:mm:ss");
//        System.out.println(LocalDateTime.now().format(formatter));
//        System.out.println(LocalTime.now());

//        ImageComment.getAllComment();
//        ImageComment.getAllCommentLike();
//        ImageComment.getAllCommentDisLike();
        ImageComment.getAllRatingAndReview();
    }
}
