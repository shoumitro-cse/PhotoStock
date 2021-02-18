package com.admin;

import com.db_connect.MysqlDBConnection;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author shoumitro
 */
public class Image {

    public List getImageItem(int image_id) throws SQLException {
        Map map;
        List mapList, commentList;

        mapList = new ArrayList();
        commentList = new ArrayList();

        map = new Hashtable<String, String>();

        Connection con, con2;
        con = MysqlDBConnection.getConnection();
        con2 = MysqlDBConnection.getConnection();
        PreparedStatement ps, ps2;
        ResultSet rs, rs2;

        String sql = "SELECT * FROM `image` where image_id = " + image_id;
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        while (rs.next()) {
            map.put("name", rs.getString("name"));
            map.put("uploadDate", rs.getString("uploadDate"));
            map.put("header", rs.getString("header"));
            map.put("category_id", rs.getInt("category_id"));
            map.put("type", rs.getString("type"));
            map.put("unitPrice", rs.getString("unitPrice"));
            map.put("alternatePrice", rs.getString("alternatePrice"));
            map.put("saveMoney", rs.getString("saveMoney"));
            map.put("percentRate", rs.getString("percentRate"));
            map.put("longDescription", rs.getString("longDescription") + "");
            map.put("largeImage", rs.getString("largeImage"));
            map.put("image_id", rs.getInt("image_id"));
            map.put("desginer_id", rs.getInt("desginer_id"));
            map.put("category_name", "");

            sql = "SELECT * FROM `category` where category_id = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, rs.getInt("category_id"));
            ResultSet rs3 = ps.executeQuery();
            while (rs3.next()) {
                map.put("category_name", rs3.getString("name"));
            }

        }

        String sql2 = "SELECT * FROM `desginer` where desginer_id = " + map.get("desginer_id");
        ps = con.prepareStatement(sql2);
        rs = ps.executeQuery();
        while (rs.next()) {
            map.put("desginer_name", rs.getString("first_name") + " " + rs.getString("surname"));
            map.put("desginer_type", rs.getString("type"));
            map.put("desginer_msg", rs.getString("msg"));
            map.put("phone", rs.getString("phone"));
            map.put("linkedin", rs.getString("linkedin"));
            map.put("facebook", rs.getString("facebook"));
            map.put("email", rs.getString("email"));
            map.put("desginer_picture_url", rs.getString("picture_url"));
        }

        String sql3 = "SELECT * FROM `image_rating_review` where image_id = " + image_id;
        ps = con.prepareStatement(sql3);
        rs = ps.executeQuery();
        while (rs.next()) {
            map.put("ratings", rs.getInt("ratings"));
            map.put("reviews", rs.getInt("reviews"));
            map.put("point", rs.getDouble("point"));
            map.put("oneStar", rs.getInt("oneStar"));
            map.put("twoStar", rs.getInt("twoStar"));
            map.put("threeStar", rs.getInt("threeStar"));
            map.put("fourStar", rs.getInt("fourStar"));
            map.put("fiveStar", rs.getInt("fiveStar"));
        }

        //for comment
        String sql4 = "SELECT * FROM `image_comment` where image_id = " + image_id;
        ps = con.prepareStatement(sql4);
        rs = ps.executeQuery();
        while (rs.next()) {
            //make comment map
            Map mapComment = new Hashtable<String, String>();
            mapComment.put("like_count", rs.getString("like_count"));
            mapComment.put("dislike_count", rs.getString("dislike_count"));
//            mapComment.put("shortDescription", rs.getString("shortDescription") + "");
            mapComment.put("longDescription", rs.getString("longDescription") + "");
            mapComment.put("commentDate", rs.getString("commentDate"));
            mapComment.put("rating", rs.getString("rating"));
            mapComment.put("comment_id", rs.getInt("comment_id"));
            mapComment.put("user_id", rs.getInt("user_id"));

            String sql5 = "SELECT * FROM `user` where user_id = " + rs.getInt("user_id");
            ps2 = con2.prepareStatement(sql5);
            rs2 = ps2.executeQuery();
            while (rs2.next()) {
                mapComment.put("user_name", rs2.getString("first_name") + " " + rs2.getString("surname"));
                mapComment.put("user_picture_url", rs2.getString("picture_url"));
            }
            commentList.add(mapComment);

        }

//        Iterator it2 = (Iterator) commentList.iterator();
//        while (it2.hasNext()) {
//            Map map2 = (Map) it2.next();
//            System.out.println(map2.get("like_count"));
//            System.out.println(map2.get("dislike_count"));
//            System.out.println(map2.get("shortDescription"));
//            System.out.println(map2.get("longDescription"));
//            System.out.println(map2.get("commentDate"));
//            System.out.println(map2.get("rating"));
//            System.out.println(map2.get("user_picture_url"));
//            System.out.println(map2.get("user_name"));
//            System.out.println("-----------");
//        }
        mapList.add(map);
        mapList.add(commentList);
        return mapList;
    }

    public static List getImageById(int image_id) throws SQLException {
        List list = new ArrayList();
        Connection con = MysqlDBConnection.getConnection();
        PreparedStatement ps;
        ResultSet rs;
        String sql;

        sql = "SELECT * FROM `image` where image_id = " + image_id;
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        if (rs.next()) {
            Map map = new HashMap<String, String>();
            map.put("name", rs.getString("name"));
            map.put("uploadDate", rs.getString("uploadDate"));
            map.put("header", rs.getString("header"));
            map.put("category_id", rs.getInt("category_id"));
            map.put("type", rs.getString("type"));
            map.put("keyword", rs.getString("keyword"));
            map.put("unitPrice", rs.getString("unitPrice"));
            map.put("alternatePrice", rs.getString("alternatePrice"));
            map.put("saveMoney", rs.getString("saveMoney"));
            map.put("percentRate", rs.getString("percentRate"));
            map.put("longDescription", rs.getString("longDescription") + "");
            map.put("largeImage", rs.getString("largeImage"));
            map.put("total_stock", rs.getInt("total_stock"));
            map.put("current_stock", rs.getInt("current_stock"));
            map.put("isTaxed", rs.getBoolean("isTaxed"));
            map.put("image_id", rs.getInt("image_id"));
            map.put("desginer_id", rs.getInt("desginer_id"));
            list.add(map);
        }

        return list;
    }

    public static List getAllImage() throws SQLException {
        List list;
        list = new ArrayList();

        Connection con;
        PreparedStatement ps;
        ResultSet rs, rs2;
        con = MysqlDBConnection.getConnection();

        String sql = "SELECT * FROM `image`";
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        while (rs.next()) {
            Map map = new Hashtable<String, String>();
            map.put("name", rs.getString("name"));
            map.put("uploadDate", rs.getString("uploadDate"));
            map.put("header", rs.getString("header"));
            map.put("category_id", rs.getInt("category_id"));
            map.put("keyword", rs.getString("keyword"));
            map.put("type", rs.getString("type"));
            map.put("unitPrice", rs.getString("unitPrice"));
            map.put("alternatePrice", rs.getString("alternatePrice"));
            map.put("saveMoney", rs.getString("saveMoney"));
            map.put("percentRate", rs.getString("percentRate"));
            map.put("isTaxed", rs.getString("isTaxed"));
            map.put("total_stock", rs.getString("total_stock"));
            map.put("current_stock", rs.getString("current_stock"));
            map.put("longDescription", rs.getString("longDescription") + "");
            map.put("largeImage", rs.getString("largeImage") + "");
            map.put("image_id", rs.getInt("image_id"));
            map.put("desginer_id", rs.getInt("desginer_id"));
            map.put("category_name", "");

            sql = "SELECT * FROM `category` where category_id = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, rs.getInt("category_id"));
            ResultSet rs3 = ps.executeQuery();
            while (rs3.next()) {
                map.put("category_name", rs3.getString("name"));
            }

            sql = "SELECT * FROM `desginer` where desginer_id = " + map.get("desginer_id");
            ps = con.prepareStatement(sql);
            rs2 = ps.executeQuery();
            while (rs2.next()) {
                map.put("desginer_id", rs2.getInt("desginer_id"));
                map.put("first_name", rs2.getString("first_name"));
                map.put("surname", rs2.getString("surname"));
                map.put("fullname", rs2.getString("first_name") + " " + rs2.getString("surname"));
                map.put("type", rs2.getString("type"));
                map.put("msg", rs2.getString("msg"));
                map.put("phone", rs2.getString("phone"));
                map.put("linkedin", rs2.getString("linkedin"));
                map.put("facebook", rs2.getString("facebook"));
                map.put("email", rs2.getString("email"));
                map.put("picture_url", rs2.getString("picture_url"));
            }

            list.add(map);
        }
        con.close();
        return list;
    }

    public static List getStockEndImage() throws SQLException {
        List list;
        list = new ArrayList();

        Connection con;
        PreparedStatement ps;
        ResultSet rs, rs2;
        con = MysqlDBConnection.getConnection();

        String sql = "SELECT * FROM `image`  where current_stock = 0 ORDER BY `image`.`image_id` ASC;";
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        while (rs.next()) {
            Map map = new Hashtable<String, String>();
            map.put("name", rs.getString("name"));
            map.put("uploadDate", rs.getString("uploadDate"));
            map.put("header", rs.getString("header"));
            map.put("category_id", rs.getInt("category_id"));
            map.put("keyword", rs.getString("keyword"));
            map.put("type", rs.getString("type"));
            map.put("unitPrice", rs.getString("unitPrice"));
            map.put("alternatePrice", rs.getString("alternatePrice"));
            map.put("saveMoney", rs.getString("saveMoney"));
            map.put("percentRate", rs.getString("percentRate"));
            map.put("isTaxed", rs.getString("isTaxed"));
            map.put("total_stock", rs.getString("total_stock"));
            map.put("current_stock", rs.getString("current_stock"));
            map.put("longDescription", rs.getString("longDescription") + "");
            map.put("largeImage", rs.getString("largeImage") + "");
            map.put("image_id", rs.getInt("image_id"));
            map.put("desginer_id", rs.getInt("desginer_id"));
            map.put("category_name", "");

            sql = "SELECT * FROM `category` where category_id = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, rs.getInt("category_id"));
            ResultSet rs3 = ps.executeQuery();
            while (rs3.next()) {
                map.put("category_name", rs3.getString("name"));
            }

            sql = "SELECT * FROM `desginer` where desginer_id = " + map.get("desginer_id");
            ps = con.prepareStatement(sql);
            rs2 = ps.executeQuery();
            while (rs2.next()) {
                map.put("desginer_id", rs2.getInt("desginer_id"));
                map.put("first_name", rs2.getString("first_name"));
                map.put("surname", rs2.getString("surname"));
                map.put("fullname", rs2.getString("first_name") + " " + rs2.getString("surname"));
                map.put("type", rs2.getString("type"));
                map.put("msg", rs2.getString("msg"));
                map.put("phone", rs2.getString("phone"));
                map.put("linkedin", rs2.getString("linkedin"));
                map.put("facebook", rs2.getString("facebook"));
                map.put("email", rs2.getString("email"));
                map.put("picture_url", rs2.getString("picture_url"));
            }

            list.add(map);
        }
        con.close();
        return list;
    }

    public List galleryImage() throws SQLException {
        List list;
        list = new ArrayList();

        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        con = MysqlDBConnection.getConnection();

        String sql = "SELECT * FROM `image`";
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        while (rs.next()) {
            Map map = new Hashtable<String, String>();
            map.put("name", rs.getString("name"));
            map.put("largeImage", rs.getString("largeImage"));
            map.put("image_id", rs.getInt("image_id"));
            map.put("desginer_id", rs.getInt("desginer_id"));

            String sql2 = "SELECT * FROM `desginer` where desginer_id = " + map.get("desginer_id");
            ps = con.prepareStatement(sql2);
            ResultSet rs2 = ps.executeQuery();
            while (rs2.next()) {
                map.put("desginer_name", rs2.getString("first_name") + " " + rs2.getString("surname"));

            }

            list.add(map);
        }

//        Iterator it2 = (Iterator) list.iterator();
//        while (it2.hasNext()) {
//            Map map2 = (Map) it2.next();
//            System.out.println(map2.get("name"));
//            System.out.println(map2.get("largeImage"));
//            System.out.println("-----------");
//        }
        return list;
    }

    public static List getBestSellerImage() throws SQLException {
        List list;
        list = new ArrayList();

        Connection con;
        PreparedStatement ps;
        ResultSet rs, sell_rs, rs2;
        con = MysqlDBConnection.getConnection();
        String sql;

//        sql = "SELECT * FROM `invoice_image_history` order by quantity desc limit 10;";
        sql = "SELECT COUNT(image_id) as count, image_id FROM `invoice_image_history` GROUP BY image_id ORDER BY count DESC limit 10";
        ps = con.prepareStatement(sql);
        sell_rs = ps.executeQuery();

        while (sell_rs.next()) {

            int image_id = sell_rs.getInt("image_id");

            sql = "SELECT * FROM `image` where image_id = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, image_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Map map = new Hashtable<String, String>();
                map.put("name", rs.getString("name"));
                map.put("largeImage", rs.getString("largeImage"));
                map.put("image_id", rs.getInt("image_id"));
                map.put("desginer_id", rs.getInt("desginer_id"));

                map.put("header", rs.getString("header"));

                map.put("unitPrice", rs.getString("unitPrice"));
                map.put("alternatePrice", rs.getString("alternatePrice"));
                map.put("percentRate", rs.getString("percentRate"));

                String sql2 = "SELECT * FROM `desginer` where desginer_id = " + map.get("desginer_id");
                ps = con.prepareStatement(sql2);
                rs2 = ps.executeQuery();
                while (rs2.next()) {
                    map.put("desginer_name", rs2.getString("first_name") + " " + rs2.getString("surname"));

                }

                list.add(map);
            }
        }

//        Iterator it2 = (Iterator) list.iterator();
//        while (it2.hasNext()) {
//            Map map2 = (Map) it2.next();
//            System.out.println(map2.get("name"));
//            System.out.println(map2.get("largeImage"));
//            System.out.println("-----------");
//        }
        return list;
    }

    public List getKeyword() throws SQLException {
        List list = new ArrayList();
        List imageKeyword = new ArrayList();
        List imageHeading = new ArrayList();
        Connection con;
        String sql;
        con = MysqlDBConnection.getConnection();
        PreparedStatement ps;
        ResultSet rs;

        sql = "SELECT * FROM `image`";
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        while (rs.next()) {
            imageKeyword.add(rs.getString("keyword").trim());
//            imageKeyword.add(rs.getString("keyword").trim() + "," + rs.getString("category_id").trim());
            imageHeading.add(rs.getString("header").trim());

        }
        list.add(imageKeyword);
        list.add(imageHeading);
        return list;
    }

    public static int insertImage(String name, String desginer_id, String category_id, String header,
            String unitPrice, String alternatePrice, String saveMoney, String percentRate,
            String total_stock, String current_stock, String uploadDate, String type,
            String keyword, String isTaxed, String longDescription) throws SQLException {

        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        con = MysqlDBConnection.getConnection();
        String sql;
        int image_id = 0;

        sql = "INSERT INTO `image` (`type`, `name`, `uploadDate`, `total_stock`, `current_stock`, `category_id`, `keyword`, `longDescription`, `unitPrice`, `alternatePrice`, `saveMoney`, `percentRate`, `header`, `isTaxed`, `desginer_id`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?); ";

        ps = con.prepareStatement(sql);
        ps.setString(1, type);
        ps.setString(2, name);
        ps.setString(3, uploadDate);
        ps.setInt(4, Integer.parseInt(total_stock));
        ps.setInt(5, Integer.parseInt(current_stock));
        ps.setInt(6, Integer.parseInt(category_id));
        ps.setString(7, keyword);
        ps.setString(8, longDescription);
        ps.setDouble(9, Double.parseDouble(unitPrice));
        ps.setDouble(10, Double.parseDouble(alternatePrice));
        ps.setDouble(11, Double.parseDouble(saveMoney));
        ps.setInt(12, Integer.parseInt(percentRate));
        ps.setString(13, header);
        ps.setBoolean(14, Boolean.parseBoolean(isTaxed));
        ps.setInt(15, Integer.parseInt(desginer_id));
        ps.executeUpdate();

        sql = "SELECT * FROM `image` ORDER BY `image_id`  DESC LIMIT 1;";
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();

        if (rs.last()) {
            image_id = rs.getInt("image_id");
        }

        System.out.println("insert Ok \n image_id = " + image_id);

        return image_id;
    }

    public static void updateImage(String image_id, String name, String desginer_id, String category_id, String header,
            String unitPrice, String alternatePrice, String saveMoney, String percentRate,
            String total_stock, String current_stock, String uploadDate, String type,
            String keyword, String isTaxed, String longDescription) throws SQLException {

        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        con = MysqlDBConnection.getConnection();
        String sql;

        sql = "UPDATE `image` SET `type` = ?, `name` = ?, `uploadDate` = ?, `total_stock` = ?, `current_stock` = ?, `category_id` = ?, `keyword` = ?, `longDescription` = ?, `unitPrice` = ?, `alternatePrice` = ?, `saveMoney` = ?, `percentRate` = ?, `header` = ?, `isTaxed` = ?, `desginer_id` = ? WHERE `image`.`image_id` = ?;";
        ps = con.prepareStatement(sql);
        ps.setString(1, type);
        ps.setString(2, name);
        ps.setString(3, uploadDate);
        ps.setInt(4, Integer.parseInt(total_stock));
        ps.setInt(5, Integer.parseInt(current_stock));
        ps.setInt(6, Integer.parseInt(category_id));
        ps.setString(7, keyword);
        ps.setString(8, longDescription);
        ps.setDouble(9, Double.parseDouble(unitPrice));
        ps.setDouble(10, Double.parseDouble(alternatePrice));
        ps.setDouble(11, Double.parseDouble(saveMoney));
        ps.setInt(12, Integer.parseInt(percentRate));
        ps.setString(13, header);
        ps.setBoolean(14, Boolean.parseBoolean(isTaxed));
        ps.setInt(15, Integer.parseInt(desginer_id));
        ps.setInt(16, Integer.parseInt(image_id));
        ps.executeUpdate();

//        System.out.println("Image Update Successfully");
    }

    public static void updateImagePicture(String picture_url, int image_id) throws SQLException {
        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        con = MysqlDBConnection.getConnection();
        String sql;

        sql = "UPDATE `image` SET `largeImage` = ? WHERE `image`.`image_id` = ? ";
        ps = con.prepareStatement(sql);
        ps.setString(1, picture_url);
        ps.setInt(2, image_id);
        ps.executeUpdate();

        System.out.println("image image update Succefull");
    }

    public static void deleteImageRecord(int image_id) throws SQLException {
        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        con = MysqlDBConnection.getConnection();
        String sql;

        sql = "DELETE FROM `image` WHERE `image`.`image_id` = ?";
        ps = con.prepareStatement(sql);
        ps.setInt(1, image_id);
        ps.executeUpdate();

        con.close();
    }

    public static void deleteImageFolder(int image_id, String images_dir) {
        File folder = new File(images_dir + "image/" + image_id);
        if (folder.exists()) {
            Image.deleteFile(folder);
            boolean b = folder.delete();
            System.out.println("folder delete successfull : " + b);
        }
    }

    private static void deleteFile(File folder) {
        try {
            for (File f : folder.listFiles()) {
                f.delete();
            }
        } catch (Exception e) {
            e.printStackTrace(System.err);
        }
    }

    public static List galleryImageByKeyword(String key, String type) throws SQLException {
        List list;
        list = new ArrayList();

        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        con = MysqlDBConnection.getConnection();
        String sql;

        // for keyword and category_id search
        if (type.contentEquals("all")) {
//            sql = "SELECT * FROM `image` where keyword like '%" + key + "%' or  category_id like '%" + key + "%';";
            sql = "SELECT * FROM `image` where keyword like '%" + key + "%';";//only keyword search
        } else {
            sql = "SELECT * FROM `image` where keyword like '%" + key + "%' and  type like '%" + type + "%' ;";//only keyword search
//            sql = "SELECT * FROM `image` where keyword like '%" + key + "%' or  category_id like '%" + key + "%' and  type like '%" + type + "%' ;";
        }

        //for header name search
        Pattern whitespace = Pattern.compile("\\s");
        Matcher matcher = whitespace.matcher(key);
        if (matcher.find()) {
            if (type.contentEquals("all")) {
                sql = "SELECT * FROM `image` where header like '%" + key + "%';";
            } else {
                sql = "SELECT * FROM `image` where header like '%" + key + "%' and  type like '%" + type + "%' ;";
            }
        }

        //for only type search
        if (key == "") {
            if (type.contentEquals("all")) {
                sql = "SELECT * FROM `image`;";
            } else {
                sql = "SELECT * FROM `image` where type like '%" + type + "%' ;";
            }
        }
        //System.out.println(sql);

        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        while (rs.next()) {
            Map map = new Hashtable<String, String>();
            map.put("name", rs.getString("name"));
            map.put("largeImage", rs.getString("largeImage") + "");
            map.put("image_id", rs.getInt("image_id"));
            map.put("desginer_id", rs.getInt("desginer_id"));

            String sql2 = "SELECT * FROM `desginer` where desginer_id = " + map.get("desginer_id");
            ps = con.prepareStatement(sql2);
            ResultSet rs2 = ps.executeQuery();
            while (rs2.next()) {
                map.put("desginer_name", rs2.getString("first_name") + " " + rs2.getString("surname"));

            }

            list.add(map);
        }
        return list;
    }

    public static List getSubstringSearch(String key, String type) throws SQLException {
        List list = galleryImageByKeyword(key, type);

        System.out.println("\n\n\n*******search by substring (slice last char)******");
        if (list.size() < 1) {
            int len = key.length();
            for (int i = len; i > 0; i--) {
                System.out.println(key.substring(0, i));
                list = galleryImageByKeyword(key.substring(0, i), type);
                if (list.size() > 0) {
                    break;
                }
            }
        }
        System.out.println("\n\n\n*******search by substring (slice first char)******");
        if (list.size() < 1) {
            int len = key.length();
            for (int i = 0; i < len; i++) {
                System.out.println(key.substring(i, len));
                list = galleryImageByKeyword(key.substring(i, len), type);
                if (list.size() > 0) {
                    break;
                }
            }
        }
        System.out.println("\n\n\n*******search by per character******");
        if (list.size() < 1) {
            int len = key.length();
            for (int i = 0; i < len; i++) {
                System.out.println(key.charAt(i) + "");
                list = galleryImageByKeyword(key.charAt(i) + "", type);
                if (list.size() > 0) {
                    break;
                }
            }
        }
        System.out.println("\n*******Not found search end******\n\n\n");

        return list;
    }

    public static List getImageByType(String type_name, int limit_number, boolean asc) throws SQLException {
        List list;
        list = new ArrayList();

        Connection con;
        PreparedStatement ps;
        ResultSet rs, rs2;
        con = MysqlDBConnection.getConnection();
        String sql;
        if (asc) {
            sql = "SELECT * FROM `image` WHERE `type` = ? order by `image_id` asc limit ?";
        } else {
            sql = "SELECT * FROM `image` WHERE `type` = ? order by `image_id` desc limit ?";
        }
        System.out.println(sql);
        ps = con.prepareStatement(sql);
        ps.setString(1, type_name);
        ps.setInt(2, limit_number);
        rs = ps.executeQuery();
        while (rs.next()) {
            Map map = new Hashtable<String, String>();
            map.put("name", rs.getString("name"));
            map.put("largeImage", rs.getString("largeImage"));
            map.put("image_id", rs.getInt("image_id"));
            map.put("desginer_id", rs.getInt("desginer_id"));

            sql = "SELECT * FROM `desginer` where desginer_id = " + map.get("desginer_id");
            ps = con.prepareStatement(sql);
            rs2 = ps.executeQuery();
            while (rs2.next()) {
                map.put("desginer_name", rs2.getString("first_name") + " " + rs2.getString("surname"));

            }
            list.add(map);
        }

//        Iterator it2 = (Iterator) list.iterator();
//        while (it2.hasNext()) {
//            Map map2 = (Map) it2.next();
//            System.out.println(map2.get("name"));
//            System.out.println(map2.get("largeImage"));
//            System.out.println("-----------");
//        }
        return list;
    }

    public static List getRelatedImage(int image_id, int limit_number, boolean order) throws SQLException {
        List list;
        list = new ArrayList();

        Connection con;
        PreparedStatement ps;
        ResultSet rs, rs2;
        con = MysqlDBConnection.getConnection();
        String sql;
        int category_id = 0;

        sql = "SELECT * FROM `image` WHERE `image_id` = ? ORDER BY `image_id` ASC";

        ps = con.prepareStatement(sql);
        ps.setInt(1, image_id);
        rs = ps.executeQuery();

        if (rs.next()) {
            category_id = rs.getInt("category_id");
        }

        if (order) {
            sql = "SELECT * FROM `image` WHERE `category_id` = ? ORDER BY `image_id` ASC LIMIT ?";
        } else {
            sql = "SELECT * FROM `image` WHERE `category_id` = ? ORDER BY `image_id` DESC LIMIT ?";
        }
        ps = con.prepareStatement(sql);
        ps.setInt(1, category_id);
        ps.setInt(2, limit_number);
        rs = ps.executeQuery();

        while (rs.next()) {
            Map map = new Hashtable<String, String>();
            map.put("name", rs.getString("name"));
            map.put("largeImage", rs.getString("largeImage"));
            map.put("image_id", rs.getInt("image_id"));
            map.put("desginer_id", rs.getInt("desginer_id"));
            map.put("category_id", rs.getInt("category_id"));
            map.put("type", rs.getString("type"));

            sql = "SELECT * FROM `desginer` where desginer_id = " + map.get("desginer_id");
            ps = con.prepareStatement(sql);
            rs2 = ps.executeQuery();
            while (rs2.next()) {
                map.put("desginer_name", rs2.getString("first_name") + " " + rs2.getString("surname"));

            }

            sql = "SELECT * FROM `category` where category_id = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, rs.getInt("category_id"));
            ResultSet rs3 = ps.executeQuery();
            while (rs3.next()) {
                map.put("category_name", rs3.getString("name"));
            }

            list.add(map);
        }

//        Iterator it2 = (Iterator) list.iterator();
//        while (it2.hasNext()) {
//            Map map2 = (Map) it2.next();
//            System.out.println(map2.get("name"));
//            System.out.println(map2.get("largeImage"));
//            System.out.println("-----------");
//        }
        return list;
    }

    public static List max_minPrice() throws SQLException {
        List list = new ArrayList();
        Map map = new Hashtable<String, String>();
        Connection con;
        String sql;
        con = MysqlDBConnection.getConnection();
        PreparedStatement ps;
        ResultSet rs;

        sql = "SELECT MAX(unitPrice) as max_price FROM `image`;";
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        while (rs.next()) {
            map.put("max_price", rs.getInt("max_price"));

        }

        sql = "SELECT MIN(unitPrice) as min_price FROM `image`";
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        while (rs.next()) {
            map.put("min_price", rs.getInt("min_price"));

        }

        sql = "SELECT MAX(percentRate) as max_percent_rate FROM `image`";
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        while (rs.next()) {
            map.put("max_percent_rate", rs.getInt("max_percent_rate"));

        }

        sql = "SELECT MIN(percentRate) as min_percent_rate FROM `image`";
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        while (rs.next()) {
            map.put("min_percent_rate", rs.getInt("min_percent_rate"));

        }

        list.add(map);
        return list;
    }
    
    // copy a file to another
    public void copyFile(String src, String dest) throws IOException {
        InputStream is = null;
        OutputStream os = null;
        try {
            is = new FileInputStream(new File(src));
            os = new FileOutputStream(new File(dest));

            // buffer size 1K
            byte[] buf = new byte[1024];

            int bytesRead;
            while ((bytesRead = is.read(buf)) > 0) {
                os.write(buf, 0, bytesRead);
            }
        } finally {
            is.close();
            os.close();
        }
    }
    
    public boolean moveFile(String sourcePath, String targetPath) {
      File fileToMove = new File(sourcePath);
    return fileToMove.renameTo(new File(targetPath));
   }
    
    
    

    public static void main(String[] args) throws SQLException, IOException {
        Image p = new Image();
//      p.moveFile("/home/shoumitro/Documents/html_ex/PhotoStock/web/asset/images/work/image_12.jpg", "/home/shoumitro/Documents/html_ex/PhotoStock/web/asset/images/work2/image_12.jpg");
        p.copyFile("/home/shoumitro/Documents/html_ex/PhotoStock/web/asset/images/work/image_12.jpg", "/home/shoumitro/Documents/html_ex/PhotoStock/web/asset/images/work2/image_12.jpg");
            
        String filePath = "/home/shoumitro/Documents/html_ex/PhotoStock/web/asset/images/work2/";
        int image_id=12;

        String[] fileNames = {"image_" + image_id + "." +"jpg"};
        String zipFileName = "product_" + image_id;
        String cwd_path = filePath ;
        CreateZip.createZipFile(fileNames, zipFileName, cwd_path);
            
//        Image.getBestSellerImage();

//        Map map = (Map) Image.max_minPrice().get(0);
//
//        int min_price = (int) map.get("min_price");
//        int max_price = (int) map.get("max_price");
//        int max_percent_rate = (int) map.get("max_percent_rate");
//        int min_percent_rate = (int) map.get("min_percent_rate");
//
//        Image.getRelatedImage(1292, 2, true);
//        String type_name = "house";
//        int limit_number = 9;
//        Image.getImageByType(type_name, limit_number, true);
//        String key = "w224";
//        String key = "w234";
//        String key = "what";
//        String key = "";
//        String type = "3d";
//
//        List list = Image.getSubstringSearch(key, type);
//
//        Iterator it = (Iterator) list.iterator();
//        while (it.hasNext()) {
//            Map map = (Map) it.next();
//            System.out.println(map.get("name"));
//            System.out.println(map.get("largeImage"));
//            System.out.println(map.get("image_id"));
//            System.out.println(map.get("desginer_id"));
//            System.out.println("-----------");
//        }
//        Image p = new Image();
//        p.getImageItem(1108);
////        List list = p.galleryImage();
//
//        //1st way  
//        Pattern p = Pattern.compile(".s");//. represents single character  
//        Matcher m = p.matcher("as");
//        boolean b = m.matches();
//
//        //2nd way  
//        boolean b2 = Pattern.compile(".s").matcher("as").matches();
//
//        //3rd way  
//        boolean b3 = Pattern.matches("\\s\\s", " as hel");
//
//        System.out.println(b + " " + b2 + " " + b3);
//
//        String s = "abc hello";
//        Pattern whitespace = Pattern.compile("\\s");
//        Matcher matcher = whitespace.matcher(s);
//        String result = "";
//        if (matcher.find()) {
//            result = matcher.replaceAll("*");
//        }
//
//        System.out.println(result);
    }

}
