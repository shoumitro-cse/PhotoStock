package com.admin;

import com.db_connect.MysqlDBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 *
 * @author shoumitro
 */
public class Category {

    public static List getImageCategory() throws SQLException {
        List list;
        list = new ArrayList();

        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        con = MysqlDBConnection.getConnection();

        String sql = "SELECT * FROM `category`";
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        while (rs.next()) {
            Map map = new Hashtable<String, String>();
            map.put("category_id", rs.getInt("category_id"));
            map.put("name", rs.getString("name"));
            list.add(map);
        }

//        Iterator it = (Iterator) list.iterator();
//        while (it.hasNext()) {
//            Map map = (Map) it.next();
//            System.out.println(map.get("category_id"));
//            System.out.println(map.get("name"));
//            System.out.println("-----------");
//        }
        return list;
    }

    public static List getImageCategoryById(int category_id) throws SQLException {
        List list;
        list = new ArrayList();

        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        con = MysqlDBConnection.getConnection();

        String sql = "SELECT * FROM `category` where category_id = ?";
        ps = con.prepareStatement(sql);
        ps.setInt(1, category_id);
        rs = ps.executeQuery();
        while (rs.next()) {
            Map map = new Hashtable<String, String>();
            map.put("category_id", rs.getInt("category_id"));
            map.put("name", rs.getString("name"));
            list.add(map);
        }

//        Iterator it = (Iterator) list.iterator();
//        while (it.hasNext()) {
//            Map map = (Map) it.next();
//            System.out.println(map.get("category_id"));
//            System.out.println(map.get("name"));
//            System.out.println("-----------");
//        }
        return list;
    }

    public static void insertCategory(String category_name) throws SQLException {

        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        con = MysqlDBConnection.getConnection();

        String sql = "INSERT INTO `category` (`name`) VALUES (?)";
        ps = con.prepareStatement(sql);
        ps.setString(1, category_name);
        ps.executeUpdate();

    }

    public static void updateCategory(String category_id, String category_name) throws SQLException {

        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        con = MysqlDBConnection.getConnection();

        String sql = "UPDATE `category` SET `name` = ? WHERE `category`.`category_id` = ?; ";
        ps = con.prepareStatement(sql);
        ps.setString(1, category_name);
        ps.setInt(2, Integer.parseInt(category_id));
        ps.executeUpdate();

        con.close();
    }

    public static void deleteCategory(String category_id) throws SQLException {

        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        con = MysqlDBConnection.getConnection();

        String sql = "DELETE FROM `category` WHERE `category`.`category_id` = ?";
        ps = con.prepareStatement(sql);
        ps.setInt(1, Integer.parseInt(category_id));
        ps.executeUpdate();

    }

    public static List getLimitedCategory(int offset, int row_count) throws SQLException {
        List list;
        list = new ArrayList();

        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        con = MysqlDBConnection.getConnection();

        String sql = "SELECT * FROM `category` order by category_id limit ?, ?";
        ps = con.prepareStatement(sql);
        ps.setInt(1, offset);
        ps.setInt(2, row_count);
        rs = ps.executeQuery();
        while (rs.next()) {
            Map map = new Hashtable<String, String>();
            map.put("category_id", rs.getInt("category_id"));
            map.put("name", rs.getString("name"));
            list.add(map);
        }

//        Iterator it = (Iterator) list.iterator();
//        while (it.hasNext()) {
//            Map map = (Map) it.next();
//            System.out.println(map.get("category_id"));
//            System.out.println(map.get("name"));
//            System.out.println("-----------");
//        }
        return list;
    }

    public static List getImageByCategoryType(String category_name) throws SQLException {
        List list;
        list = new ArrayList();

        Connection con;
        PreparedStatement ps;
        ResultSet rs, rs2;
        con = MysqlDBConnection.getConnection();
        int category_id = 0;

        String sql = "SELECT * FROM `category` WHERE `name` = ?";
        ps = con.prepareStatement(sql);
        ps.setString(1, category_name.trim().toLowerCase());
        rs = ps.executeQuery();
        if (rs.next()) {
            category_id = rs.getInt("category_id");
        }

        sql = "SELECT * FROM `image` where category_id = ?";
        ps = con.prepareStatement(sql);
        ps.setInt(1, category_id);
        rs = ps.executeQuery();
        while (rs.next()) {
            Map map = new Hashtable<String, String>();
            map.put("name", rs.getString("name"));
            map.put("largeImage", rs.getString("largeImage"));
            map.put("image_id", rs.getInt("image_id"));
            map.put("desginer_id", rs.getInt("desginer_id"));

            map.put("category_id", category_id);
            map.put("category_name", category_name);

            sql = "SELECT * FROM `desginer` where desginer_id = " + map.get("desginer_id");
            ps = con.prepareStatement(sql);
            rs2 = ps.executeQuery();
            while (rs2.next()) {
                map.put("desginer_name", rs2.getString("first_name") + " " + rs2.getString("surname"));

            }
            list.add(map);
        }

//        Iterator it = (Iterator) list.iterator();
//        while (it.hasNext()) {
//            Map map = (Map) it.next();
//            System.out.println(map.get("category_id"));
//            System.out.println(map.get("desginer_name"));
//            System.out.println(map.get("name"));
//            System.out.println("-----------");
//        }
        return list;

    }

    public static void main(String[] args) throws SQLException {
//        Category.getImageCategoryById(1110);

//        Category.getImageByCategoryType("house");
         Category.getLimitedCategory(0,4);

    }

}
