/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.admin;

import com.db_connect.MysqlDBConnection;
import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author shoumitro
 */
public class DesignerWork {
    
    public static List getDesignerWorkById(int work_id) throws SQLException {
        
        
        List list = new ArrayList();
        Connection con = MysqlDBConnection.getConnection();
        PreparedStatement ps;
        ResultSet rs;
        String sql;

        sql = "SELECT * FROM `work` where work_id=" + work_id;
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        if (rs.next()) {
            Map map = new HashMap<String, String>();
            map.put("name", rs.getString("name"));
            map.put("img_url", rs.getString("img_url"));
            map.put("stock", rs.getInt("copy"));
            map.put("desginer_id", rs.getInt("desginer_id"));
            list.add(map);
        }
//        System.out.println("Work Calling: "+work_id);

        return list;
    }
    
    
    public List desginerWorkShow(int desginer_id) throws SQLException {
        List list = new ArrayList();
        Connection con = MysqlDBConnection.getConnection();
        PreparedStatement ps;
        ResultSet rs;
        String sql;

        sql = "SELECT * FROM `work` where desginer_id=" + desginer_id;
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        while (rs.next()) {
            Map map = new HashMap<String, String>();
            map.put("work_id", rs.getInt("work_id"));
            map.put("name", rs.getString("name"));
            map.put("img_url", rs.getString("img_url"));
            map.put("stock", rs.getInt("copy"));
            map.put("desginer_id", rs.getInt("desginer_id"));
            list.add(map);
        }
//        System.out.println("Work Calling: "+work_id);

        return list;
    }
    
    public List getAllDesginerWork() throws SQLException {
        List list = new ArrayList();
        Connection con = MysqlDBConnection.getConnection();
        PreparedStatement ps;
        ResultSet rs, rs2;
        String sql, sql2;

//        sql = "SELECT * FROM `work`";
        sql = "SELECT work_id, name, copy, img_url, COUNT(desginer_id) as count, desginer_id FROM work GROUP BY desginer_id ORDER BY work_id;";
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        while (rs.next()) {
            Map map = new HashMap<String, String>();
            map.put("work_id", rs.getInt("work_id"));
            map.put("name", rs.getString("name"));
            map.put("img_url", rs.getString("img_url"));
            map.put("stock", rs.getInt("copy"));
            map.put("count", rs.getInt("count"));
            map.put("desginer_id", rs.getInt("desginer_id"));
            
            sql2 = "SELECT * FROM `desginer` WHERE desginer_id=" + map.get("desginer_id");
            ps = con.prepareStatement(sql2);
            rs2 = ps.executeQuery();
            if (rs2.next()) {
                map.put("designer_name", rs2.getString("first_name")+" "+rs2.getString("surname"));
            }
        
        
            list.add(map);
        }
//        System.out.println("Work Calling: "+work_id);

        return list;
    }
    
    public String getDesginerName(int designer_id) throws SQLException {
        Connection con = MysqlDBConnection.getConnection();
        PreparedStatement ps;
        ResultSet rs;
        String sql, name="";

        sql =  "SELECT * FROM `desginer` WHERE desginer_id=" + designer_id;
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
            
        if (rs.next()) {
           name = rs.getString("first_name")+" "+rs.getString("surname");
        }
        return name;
    }
    
    public boolean isEmployee(int designer_id, String email) throws SQLException {
        Connection con = MysqlDBConnection.getConnection();
        PreparedStatement ps;
        ResultSet rs;
        String sql, name="";
        boolean bool=false;

        sql =  "SELECT * FROM `desginer` WHERE `desginer_id` = "+designer_id+" AND `email` = '"+email+"' ORDER BY `desginer_id` ASC ";
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
            
        if (rs.next()) {
            bool = true;
        }
        return bool;
    }
    
    
    public static int inserDesignerWork(int designer_id , String img_name, int copy) throws SQLException {
           
        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        con = MysqlDBConnection.getConnection();
        String sql;

        sql = "INSERT INTO `work` (`name`, `copy`, `desginer_id`) VALUES (?, ?, ?); ";
        ps = con.prepareStatement(sql);
        ps.setString(1, img_name);
        ps.setInt(2, copy);
        ps.setInt(3, designer_id);

        ps.executeUpdate();

        sql = "SELECT * FROM `work` ORDER BY `work_id`  DESC LIMIT 1;";
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        
        int work_id = 0;
        if (rs.last()) {
            work_id = rs.getInt("work_id");
        }
//        System.out.println("insertDesigner");

        return work_id;
    }
    
    
    public void updateImage(int work_id, String img_url) throws SQLException {
        Connection con = MysqlDBConnection.getConnection();
        PreparedStatement ps;
        ResultSet rs;
        String sql;

        sql = "UPDATE `work` SET `img_url` = ? WHERE `work`.`work_id` = ?;";
        ps = con.prepareStatement(sql);
        ps.setString(1, img_url);
        ps.setInt(2, work_id);
        ps.executeUpdate();
        
        con.close();
    }
    
    public static void deleteWork(int work_id) throws SQLException {
        Connection con = MysqlDBConnection.getConnection();
        PreparedStatement ps;
        ResultSet rs;
        String sql;

        sql = "DELETE FROM `work` WHERE `work`.`work_id` = ?";
        ps = con.prepareStatement(sql);
        ps.setInt(1, work_id);
        ps.executeUpdate();
        
        con.close();
    }
    
    public static String getImageUrl(int work_id) throws SQLException {
        Connection con = MysqlDBConnection.getConnection();
        PreparedStatement ps;
        ResultSet rs;
        String sql, name="";

        sql =  "SELECT * FROM `work` WHERE work_id=" + work_id;
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
            
        if (rs.next()) {
           name = rs.getString("img_url");
        }
        return name;
    }
        
    public static void deleteFile(int work_id, String path) throws SQLException {
//      System.out.println(path);
        File f = new File(path);
        f.delete();
    }
    
    public static void main(String[] args) {
//        File f = new File("/home/shoumitro/Documents/html_ex/PhotoStock/web/asset/images/work/work_903.jpg");
//        f.delete();
    }
    
    
}
