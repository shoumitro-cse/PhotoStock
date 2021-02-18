package com.admin;

import com.db_connect.MysqlDBConnection;
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
import org.json.simple.JSONObject;

/**
 *
 * @author shoumitro
 */
public class Chart {

    public static List getAllVisitedUsersChart() throws SQLException {
        List list;
        list = new ArrayList();

        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        con = MysqlDBConnection.getConnection();

        String sql = "SELECT * FROM `visited_users_chart`";
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        while (rs.next()) {
            DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern("E, dd MMMM YYYY hh:mm:ss a");
            String dateTimeString = LocalDateTime.parse(rs.getString("date_day").toString().trim()).format(formatter2);
            
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd MMMM YYYY");
            String dateString = LocalDateTime.parse(rs.getString("date_day").toString().trim()).format(formatter);
           
            Map map = new Hashtable<String, String>();
            map.put("visited_users_chart_id", rs.getInt("visited_users_chart_id"));
            map.put("visited_users_count", rs.getInt("visited_users_count"));
            map.put("date_day", dateTimeString);
            map.put("date", dateString);
            list.add(map);
        }

//        Iterator it = (Iterator) list.iterator();
//        while (it.hasNext()) {
//            Map map = (Map) it.next();
//            System.out.println(map.get("visited_users_chart_id"));
//            System.out.println(map.get("visited_users_count"));
//            System.out.println(map.get("date_day"));
//            System.out.println("-----------");
//        }
        return list;
    }

    public static List getAllVisitedUserCount() throws SQLException {
        List list;
        list = new ArrayList();

        Connection con;
        PreparedStatement ps;
        ResultSet rs, rs2;
        con = MysqlDBConnection.getConnection();

        String sql = "SELECT * FROM `visited_users_count`";
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        while (rs.next()) {
            Map map = new Hashtable<String, String>();
            map.put("visited_users_count_id", rs.getInt("visited_users_count_id"));
            map.put("user_id", rs.getInt("user_id"));
            
            sql = "select * from user where user_id = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, rs.getInt("user_id"));
            rs2 = ps.executeQuery();
            while (rs2.next()) {                
               map.put("fullname", rs2.getString("first_name") + " " + rs2.getString("surname"));
               map.put("email", rs2.getString("email"));
            }
            
            list.add(map);
        }

//        Iterator it = (Iterator) list.iterator();
//        while (it.hasNext()) {
//            Map map = (Map) it.next();
//            System.out.println(map.get("visited_users_count_id"));
//            System.out.println(map.get("user_id"));
//            System.out.println("-----------");
//        }
        return list;
    }

    public static Map getAllChartData() throws SQLException {

        List userList = new ArrayList();
        List dateList = new ArrayList();

        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        con = MysqlDBConnection.getConnection();

        Map map = new Hashtable<String, String>();
        String sql = "SELECT * FROM `visited_users_chart` order by visited_users_chart_id desc limit 10;";
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();

        while (rs.next()) {

//            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd MMM yyyy");
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd MMMM");
            String dateString = LocalDateTime.parse(rs.getString("date_day").toString().trim()).format(formatter);

            userList.add(rs.getInt("visited_users_count"));
            dateList.add(dateString.trim());

        }
        map.put("users", userList);
        map.put("dates", dateList);
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("EEEE, dd MMMM YYYY");
        map.put("FullDate", LocalDateTime.now().format(formatter).toString());

        return map;
    }

    public static void main(String[] args) throws SQLException {

//        Chart.getAllVisitedUserCount();
//        Chart.getAllVisitedUsersChart();
        Map map = Chart.getAllChartData();

        JSONObject obj = new JSONObject();
        obj.put("dataSeries", map);
        System.out.println(obj);
    }

}


