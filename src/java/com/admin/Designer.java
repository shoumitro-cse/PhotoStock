package com.admin;

import com.db_connect.MysqlDBConnection;
import java.io.File;
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
public class Designer {

    public static List getDesignerList() throws SQLException {
        List list;
        list = new ArrayList();

        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        con = MysqlDBConnection.getConnection();

        String sql = "SELECT * FROM `desginer`";
//        String sql = "SELECT * FROM `desginer` order by type";
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();

        while (rs.next()) {
            Map map = new Hashtable<String, String>();
            map.put("desginer_id", rs.getInt("desginer_id"));
            map.put("first_name", rs.getString("first_name"));
            map.put("surname", rs.getString("surname"));
            map.put("fullname", rs.getString("first_name") + " " + rs.getString("surname"));
            map.put("type", rs.getString("type"));
            map.put("msg", rs.getString("msg"));
            map.put("phone", rs.getString("phone"));
            map.put("linkedin", rs.getString("linkedin"));
            map.put("facebook", rs.getString("facebook"));
            map.put("email", rs.getString("email"));
            map.put("picture_url", rs.getString("picture_url"));

            list.add(map);
        }

        return list;
    }
    public static List getDesignerTypeList() throws SQLException {
        List list;
        list = new ArrayList();

        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        con = MysqlDBConnection.getConnection();

        String sql = "SELECT DISTINCT type FROM `desginer` order by type asc limit 8;";
//        String sql = "SELECT * FROM `desginer` order by type";
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();

        while (rs.next()) {
            Map map = new Hashtable<String, String>();
            map.put("type", rs.getString("type"));
            list.add(map);
        }

        return list;
    }

    public static List getDesignerListById(int desginer_id) throws SQLException {
        List list;
        list = new ArrayList();

        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        con = MysqlDBConnection.getConnection();

        String sql = "SELECT * FROM `desginer` where desginer_id = ?";
        ps = con.prepareStatement(sql);
        ps.setInt(1, desginer_id);
        rs = ps.executeQuery();

        while (rs.next()) {
            Map map = new Hashtable<String, String>();
            map.put("desginer_id", rs.getInt("desginer_id"));
            map.put("first_name", rs.getString("first_name"));
            map.put("surname", rs.getString("surname"));
            map.put("fullname", rs.getString("first_name") + " " + rs.getString("surname"));
            map.put("type", rs.getString("type"));
            map.put("msg", rs.getString("msg"));
            map.put("phone", rs.getString("phone"));
            map.put("linkedin", rs.getString("linkedin"));
            map.put("facebook", rs.getString("facebook"));
            map.put("email", rs.getString("email"));
            map.put("picture_url", rs.getString("picture_url"));

            list.add(map);
        }

        return list;
    }

    public static int insertDesigner(String first_name, String surname, String type, String msg, String phone, String email, String linkedin, String facebook) throws SQLException {

        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        con = MysqlDBConnection.getConnection();
        String sql;
        int desginer_id = 0;

        sql = "INSERT INTO `desginer` (`first_name`, `surname`, `type`, `msg`, `phone`, `linkedin`, `facebook`, `email`) VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
        ps = con.prepareStatement(sql);
        ps.setString(1, first_name);
        ps.setString(2, surname);
        ps.setString(3, type);
        ps.setString(4, msg);
        ps.setString(5, phone);
        ps.setString(6, linkedin);
        ps.setString(7, facebook);
        ps.setString(8, email);
        ps.executeUpdate();

        sql = "SELECT * FROM `desginer` ORDER BY `desginer_id`  DESC LIMIT 1;";
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();

        if (rs.last()) {
            desginer_id = rs.getInt("desginer_id");
        }
//        System.out.println("insertDesigner");

        return desginer_id;
    }

    public static void updateDesignerPicture(String picture_url, int desginer_id) throws SQLException {
        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        con = MysqlDBConnection.getConnection();
        String sql;

        sql = "UPDATE `desginer` SET `picture_url` = ? WHERE `desginer`.`desginer_id` = ?; ";
        ps = con.prepareStatement(sql);
        ps.setString(1, picture_url);
        ps.setInt(2, desginer_id);
        ps.executeUpdate();

    }

    public static void updateDesigner(int desginer_id, String first_name, String surname, String type, String msg, String phone, String email, String linkedin, String facebook) throws SQLException {

        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        con = MysqlDBConnection.getConnection();

        String sql = "UPDATE `desginer` SET `first_name` = ?, `surname` = ?, `type` = ?, `msg` = ?, `phone` = ?, `linkedin` = ?, `facebook` = ?, `email` = ? WHERE `desginer`.`desginer_id` = ?;";
        ps = con.prepareStatement(sql);
        ps.setString(1, first_name);
        ps.setString(2, surname);
        ps.setString(3, type);
        ps.setString(4, msg);
        ps.setString(5, phone);
        ps.setString(6, linkedin);
        ps.setString(7, facebook);
        ps.setString(8, email);
        ps.setInt(9, desginer_id);
        ps.executeUpdate();

//        System.out.println("SuccessFull");
    }

    public static void deleteRecord(int designer_id) throws SQLException {
        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        con = MysqlDBConnection.getConnection();
        String sql;

        sql = "DELETE FROM `desginer` WHERE `desginer`.`desginer_id` = ?";
        ps = con.prepareStatement(sql);
        ps.setInt(1, designer_id);
        ps.executeUpdate();

        con.close();
    }

    public static void deleteFolder(int desginer_id, String images_dir) {
        File folder = new File(images_dir+"designer_account/" + desginer_id);
        if (folder.exists()) {
            Designer.deleteFile(folder);
            boolean b = folder.delete();
           // System.out.println("folder delete successfull : " +b );
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
    
    
    

    public static void main(String[] args) throws SQLException {



    }

}
