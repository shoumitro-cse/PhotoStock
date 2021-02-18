package com.account;

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
public class Notice {

    public static void insertNotification(String large_msg, String small_msg, String notice_date, int user_id) throws SQLException {
        Connection con;
        con = MysqlDBConnection.getConnection();
        PreparedStatement ps;
        ResultSet rs;
        String sql;

        sql = "INSERT INTO `notice` (`large_msg`, `small_msg`, `notice_date`, `user_id`) VALUES (?, ?, ?, ?); ";
        ps = con.prepareStatement(sql);
        ps.setString(1, large_msg);
        ps.setString(2, small_msg);
        ps.setString(3, notice_date);
        ps.setInt(4, user_id);
        ps.executeUpdate();

        con.close();
    }

    public List getAllNotification(int user_id) throws SQLException {
        List list = new ArrayList();
        Connection con;
        con = MysqlDBConnection.getConnection();
        PreparedStatement ps;
        ResultSet rs;
        String sql;

        sql = "SELECT * FROM `notice` where user_id = ? order by notice_id desc;";
//        sql = "SELECT * FROM `notice` where user_id = ? order by notice_id desc limit 9;";
        ps = con.prepareStatement(sql);
        ps.setInt(1, user_id);
        rs = ps.executeQuery();
        while (rs.next()) {
            Map map = new Hashtable<String, String>();
            map.put("large_msg", rs.getString("large_msg"));
            map.put("small_msg", rs.getString("small_msg"));
            map.put("notice_date", rs.getString("notice_date"));
            map.put("user_id", rs.getString("user_id"));
            map.put("notice_id", rs.getString("notice_id"));

            list.add(map);
        }
        con.close();

        return list;
    }

    public static int getActiveNotice(int user_id) throws SQLException {
        Connection con;
        con = MysqlDBConnection.getConnection();
        PreparedStatement ps;
        ResultSet rs;
        String sql;
        int count = 0;

        sql = "SELECT count(*) as count FROM `notice` where active = 1 and user_id = ? order by notice_id desc;";
        ps = con.prepareStatement(sql);
        ps.setInt(1, user_id);
        rs = ps.executeQuery();
        while (rs.next()) {
          count = rs.getInt("count");
        }
        con.close();

        return count;
    }
    
    public void deteteNotice(int notice_id, int user_id) throws SQLException {
        Connection con;
        con = MysqlDBConnection.getConnection();
        PreparedStatement ps;
        ResultSet rs;
        String sql;

        sql = "DELETE FROM `notice` WHERE `notice_id` = ? and user_id = ?";
        ps = con.prepareStatement(sql);
        ps.setInt(1, notice_id);
        ps.setInt(2, user_id);
        ps.executeUpdate();

        con.close();
        
    }
    
    
    public static boolean noticeNotActive(int user_id) throws SQLException {
        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        con = MysqlDBConnection.getConnection();

        String sql = "SELECT * FROM `notice` where active = 1 and user_id = ?;";
        ps = con.prepareStatement(sql);
        ps.setInt(1, user_id);
        rs = ps.executeQuery();
        while (rs.next()) {
            
            sql = "UPDATE `notice` SET `active` = '0' WHERE `notice`.`notice_id` = ?; ";
            ps = con.prepareStatement(sql);
            ps.setInt(1, rs.getInt("notice_id"));
            ps.executeUpdate();
        }
        
        return true;
    }

    public static void main(String[] args) throws SQLException {
        Notice notice = new Notice();
//        List noticeList = notice.getAllNotification(101);
//        System.out.println(noticeList.size());
//        Iterator itNotice = noticeList.iterator();
//        while (itNotice.hasNext()) {            
//            Map map = (Map) itNotice.next();
//            System.out.println(map.get("large_msg"));
//            System.out.println(map.get("small_msg"));
//            System.out.println(map.get("notice_date"));
//        }

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("E, dd MMMM yyyy hh:mm:ss a");
        System.out.println(LocalDateTime.now().format(formatter));
        System.out.println(LocalTime.now());
    }
}
