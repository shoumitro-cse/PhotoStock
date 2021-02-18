package com.admin;

import com.db_connect.MysqlDBConnection;
import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
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
public class AdminAccount {

    public static List checkAdminAccount(String email, String password) throws SQLException {

        List list = new ArrayList();

        boolean bool = false;
        int admin_id = 0;

        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        con = MysqlDBConnection.getConnection();
        String sql;

        sql = "SELECT * FROM `admin` where email = ? and password=? ;";
        ps = con.prepareStatement(sql);
        ps.setString(1, email);
        ps.setString(2, password);
        rs = ps.executeQuery();
        if (rs.next()) {
            admin_id = rs.getInt("admin_id");
            String ck_email = rs.getString("email");
            String ck_password = rs.getString("password");
            if (ck_email.contentEquals(email) && ck_password.contentEquals(password)) {
                bool = true;

                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("E, dd MMMM YYYY hh:mm:ss a");
                String dateString = LocalDateTime.now().format(formatter).toString();

                sql = " UPDATE `admin` SET `last_login` = ? WHERE `admin`.`admin_id` = ?; ";
                ps = con.prepareStatement(sql);
                ps.setString(1, dateString);
                ps.setInt(2, admin_id);
                ps.executeUpdate();

                AdminAccount.setIsActive(bool, admin_id);

            }
        }

        list.add(bool);
        list.add(admin_id);

        return list;
    }

    public static void setIsActive(boolean bool, int admin_id) throws SQLException {

        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        con = MysqlDBConnection.getConnection();
        String sql;

        sql = "UPDATE `admin` SET `isActive` = ? WHERE `admin`.`admin_id` = ?;  ";
        ps = con.prepareStatement(sql);
        ps.setBoolean(1, bool);
        ps.setInt(2, admin_id);
        ps.executeUpdate();
    }

    public static List getAllAdminAccount() throws SQLException {
        List list;
        list = new ArrayList();

        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        con = MysqlDBConnection.getConnection();

        String sql = "SELECT * FROM `admin`";
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        while (rs.next()) {
            Map map = new Hashtable<String, String>();
            map.put("admin_id", rs.getInt("admin_id"));
            map.put("name", rs.getString("name"));
            map.put("email", rs.getString("email"));
            map.put("password", rs.getString("password"));
            map.put("last_login", rs.getString("last_login"));
            map.put("isActive", rs.getBoolean("isActive"));
            map.put("picture_url", rs.getString("picture_url"));

            list.add(map);
        }
//
//        Iterator it = (Iterator) list.iterator();
//        while (it.hasNext()) {
//            Map map = (Map) it.next();
//            System.out.println(map.get("admin_id"));
//            System.out.println(map.get("email"));
//            System.out.println(map.get("last_login"));
//            System.out.println(map.get("isActive"));
//            System.out.println("-----------");
//        }
        return list;
    }

    public static List getAdminAccountById(int admin_id) throws SQLException {
        List list;
        list = new ArrayList();

        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        con = MysqlDBConnection.getConnection();

        String sql = "SELECT * FROM `admin` where admin_id = ?";
        ps = con.prepareStatement(sql);
        ps.setInt(1, admin_id);
        rs = ps.executeQuery();
        while (rs.next()) {
            Map map = new Hashtable<String, String>();
            map.put("admin_id", rs.getInt("admin_id"));
            map.put("name", rs.getString("name"));
            map.put("email", rs.getString("email"));
            map.put("password", rs.getString("password"));
            map.put("last_login", rs.getString("last_login"));
            map.put("isActive", rs.getBoolean("isActive"));
            map.put("picture_url", rs.getString("picture_url"));

            list.add(map);
        }

//        Iterator it = (Iterator) list.iterator();
//        while (it.hasNext()) {
//            Map map = (Map) it.next();
//            System.out.println(map.get("admin_id"));
//            System.out.println(map.get("email"));
//            System.out.println(map.get("last_login"));
//            System.out.println(map.get("isActive"));
//            System.out.println("-----------");
//        }
        con.close();
        return list;
    }

    public static void insertAdmin(String fullname, String email, String password) throws SQLException {

        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        con = MysqlDBConnection.getConnection();

        String sql = "INSERT INTO `admin` (`name`, `email`, `password`) VALUES (?, ?, ?); ";
        ps = con.prepareStatement(sql);
        ps.setString(1, fullname);
        ps.setString(2, email);
        ps.setString(3, password);
        ps.executeUpdate();

        con.close();

    }

    public static void updateAdminName(int admin_id, String fullname) throws SQLException {

        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        con = MysqlDBConnection.getConnection();

        String sql = "UPDATE `admin` SET `name` = ? WHERE `admin`.`admin_id` = ?;";
        ps = con.prepareStatement(sql);
        ps.setString(1, fullname);
        ps.setInt(2, admin_id);
        ps.executeUpdate();

        con.close();

    }

    public static boolean checkAdminEmail(String email) throws SQLException {

        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        con = MysqlDBConnection.getConnection();
        String admin_email = "";
        boolean bool = true;

        String sql = "SELECT * FROM `admin` WHERE `email` = ?";
        ps = con.prepareStatement(sql);
        ps.setString(1, email);
        rs = ps.executeQuery();

        if (rs.next()) {
            admin_email = rs.getString("email");
            if (admin_email.contentEquals(email)) {
                bool = false;
                System.out.println(email);
            }
        }

        con.close();
        return bool;
    }

    public static void updateAdminEmail(int admin_id, String email) throws SQLException {

        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        con = MysqlDBConnection.getConnection();

        String sql = "UPDATE `admin` SET `email` = ? WHERE `admin`.`admin_id` = ?;";
        ps = con.prepareStatement(sql);
        ps.setString(1, email);
        ps.setInt(2, admin_id);
        ps.executeUpdate();

        con.close();

    }

    public static void updateAdminPicture(String picture_url, int admin_id) throws SQLException {
        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        con = MysqlDBConnection.getConnection();
        String sql;

        sql = "UPDATE `admin` SET `picture_url` = ? WHERE `admin`.`admin_id` = ?; ";
        ps = con.prepareStatement(sql);
        ps.setString(1, picture_url);
        ps.setInt(2, admin_id);
        ps.executeUpdate();

        con.close();

    }

    public static void updateAdminPassword(int admin_id, String password, String new_pw, String confirm_pw) throws SQLException {

        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        con = MysqlDBConnection.getConnection();
        String sql;
        String currentPassword = "";

        sql = "SELECT * FROM `admin` WHERE `admin_id` = ? AND `password` = ? ";
        ps = con.prepareStatement(sql);
        ps.setInt(1, admin_id);
        ps.setString(2, password);
        rs = ps.executeQuery();
        if (rs.next()) {
            currentPassword = rs.getString("password");
            if (currentPassword.contentEquals(password) && new_pw.contentEquals(confirm_pw)) {
                sql = "UPDATE `admin` SET `password` = ? WHERE `admin`.`admin_id` = ?;";
                ps = con.prepareStatement(sql);
                ps.setString(1, new_pw);
                ps.setInt(2, admin_id);
                ps.executeUpdate();

            }
        }

        con.close();
    }

    public static void deleteRecord(int admin_id) throws SQLException {
        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        con = MysqlDBConnection.getConnection();
        String sql;

        sql = "DELETE FROM `admin` WHERE `admin`.`admin_id` = ?";
        ps = con.prepareStatement(sql);
        ps.setInt(1, admin_id);
        ps.executeUpdate();

        con.close();
    }

    public static void deleteFolder(int admin_id, String images_dir) {
        File folder = new File(images_dir + "admin_account/" + admin_id);
        if (folder.exists()) {
            deleteFile(folder);
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
//        AdminAccount.getAllAdminAccount();
        AdminAccount.getAdminAccountById(6000);
    }

}
