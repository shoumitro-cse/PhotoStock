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
public class User {

    public static List getAllUser() throws SQLException {
        List list = new ArrayList();
//        List list2 = new ArrayList();
        Connection con = MysqlDBConnection.getConnection();
        PreparedStatement ps;
        ResultSet rs, rs2, rs3, rs4;
        String sql;

        sql = "SELECT * FROM `user` ";
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        while (rs.next()) {
            Map map = new Hashtable<String, String>();
            map.put("user_id", rs.getInt("user_id"));
            map.put("user_type", rs.getString("user_type"));
            map.put("fullname", rs.getString("first_name") + " " + rs.getString("surname"));
            map.put("first_name", rs.getString("first_name"));
            map.put("surname", rs.getString("surname"));
            map.put("email", rs.getString("email"));
            map.put("password", rs.getString("password"));
            map.put("re_type_password", rs.getString("re_type_password"));
            map.put("picture_url", rs.getString("picture_url") + "");

            sql = "SELECT * FROM `simple_user` where user_id = ? ";
            ps = con.prepareStatement(sql);
            ps.setInt(1, (int) rs.getInt("user_id"));
            rs2 = ps.executeQuery();
            if (rs2.next()) {
                map.put("simple_user_id", rs2.getInt("simple_user_id"));
                map.put("dob", rs2.getString("dob") + "");
                map.put("gender", rs2.getString("gender") + "");
                map.put("country", rs2.getString("country") + "");
                map.put("city", rs2.getString("city") + "");
                map.put("state", rs2.getString("state") + "");
                map.put("permanent_addr", rs2.getString("permanent_addr") + "");
                map.put("current_addr", rs2.getString("current_addr") + "");
                map.put("zip", rs2.getString("zip") + "");
            }

            sql = "SELECT * FROM `company_user` where user_id = ? ";
            ps = con.prepareStatement(sql);
            ps.setInt(1, rs.getInt("user_id"));
            rs3 = ps.executeQuery();
            if (rs3.next()) {
                map.put("company_user_id", rs3.getInt("company_user_id"));
                map.put("company_name", rs3.getString("company_name"));
                map.put("company_country", rs3.getString("country"));
                map.put("company_city", rs3.getString("city"));
                map.put("company_address", rs3.getString("company_address"));
                map.put("company_type", rs3.getString("company_type"));
                map.put("business_license_no", rs3.getString("business_license_no"));
                map.put("business_descr", rs3.getString("business_descr"));
                map.put("website_url", rs3.getString("website_url"));

                sql = "SELECT * FROM `company_contact_person` where company_user_id = ? ";
                ps = con.prepareStatement(sql);
                ps.setInt(1, (int) rs3.getInt("company_user_id"));
                rs4 = ps.executeQuery();
                if (rs4.next()) {
                    map.put("person_id", rs4.getInt("person_id"));
                    map.put("person_name", rs4.getString("person_name"));
                    map.put("person_email", rs4.getString("person_email"));
                    map.put("person_designation", rs4.getString("person_designation"));
                    map.put("person_mobile", rs4.getString("person_mobile"));

                }
            }
            list.add(map);
        }

        return list;
    }

    public static List getAllSimpleUser() throws SQLException {

        List list = new ArrayList();
        Connection con = MysqlDBConnection.getConnection();
        PreparedStatement ps;
        ResultSet rs, rs2;
        String sql;

        sql = "SELECT * FROM `simple_user`";
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        while (rs.next()) {
            Map map = new Hashtable<String, String>();
            map.put("simple_user_id", rs.getInt("simple_user_id"));
            map.put("dob", rs.getString("dob") + "");
            map.put("gender", rs.getString("gender") + "");
            map.put("country", rs.getString("country") + "");
            map.put("city", rs.getString("city") + "");
            map.put("state", rs.getString("state") + "");
            map.put("permanent_addr", rs.getString("permanent_addr") + "");
            map.put("current_addr", rs.getString("current_addr") + "");
            map.put("zip", rs.getString("zip") + "");
            map.put("user_id", rs.getInt("user_id"));

            sql = "SELECT * FROM `user` WHERE `user_id` = ? AND `user_type` = 'simple' ORDER BY `user_id` ASC ";
            ps = con.prepareStatement(sql);
            ps.setInt(1, rs.getInt("user_id"));
            rs2 = ps.executeQuery();
            if (rs2.next()) {
                map.put("user_id", rs2.getInt("user_id"));
                map.put("user_type", rs2.getString("user_type"));
                map.put("first_name", rs2.getString("first_name"));
                map.put("surname", rs2.getString("surname"));
                map.put("fullname", rs2.getString("first_name") + " " + rs2.getString("surname"));
                map.put("email", rs2.getString("email"));
                map.put("password", rs2.getString("password"));
                map.put("re_type_password", rs2.getString("re_type_password"));
                map.put("picture_url", rs2.getString("picture_url"));

            }
            list.add(map);

        }

        return list;
    }

    public static List getAllCompanyUser() throws SQLException {

        List list = new ArrayList();
        Connection con = MysqlDBConnection.getConnection();
        PreparedStatement ps;
        ResultSet rs, rs2, rs4;
        String sql;

        sql = "SELECT * FROM `company_user`";
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        while (rs.next()) {

            Map map = new Hashtable<String, String>();
            map.put("company_user_id", rs.getInt("company_user_id"));
            map.put("company_name", rs.getString("company_name"));
            map.put("country", rs.getString("country"));
            map.put("city", rs.getString("city"));
            map.put("company_address", rs.getString("company_address"));
            map.put("company_type", rs.getString("company_type"));
            map.put("business_license_no", rs.getString("business_license_no"));
            map.put("business_descr", rs.getString("business_descr"));
            map.put("website_url", rs.getString("website_url"));
            map.put("user_id", rs.getInt("user_id"));

            sql = "SELECT * FROM `user` WHERE `user_id` = ? AND `user_type` = 'company' ORDER BY `user_id` ASC ";
            ps = con.prepareStatement(sql);
            ps.setInt(1, rs.getInt("user_id"));
            rs2 = ps.executeQuery();
            if (rs2.next()) {
                map.put("user_id", rs2.getInt("user_id"));
                map.put("user_type", rs2.getString("user_type"));
                map.put("first_name", rs2.getString("first_name"));
                map.put("surname", rs2.getString("surname"));
                map.put("fullname", rs2.getString("first_name") + " " + rs2.getString("surname"));
                map.put("email", rs2.getString("email"));
                map.put("password", rs2.getString("password"));
                map.put("re_type_password", rs2.getString("re_type_password"));
                map.put("picture_url", rs2.getString("picture_url"));
            }

            sql = "SELECT * FROM `company_contact_person` where company_user_id = ? ";
            ps = con.prepareStatement(sql);
            ps.setInt(1, (int) rs.getInt("company_user_id"));
            rs4 = ps.executeQuery();
            if (rs4.next()) {
                map.put("person_id", rs4.getInt("person_id"));
                map.put("person_name", rs4.getString("person_name"));
                map.put("person_email", rs4.getString("person_email"));
                map.put("person_designation", rs4.getString("person_designation"));
                map.put("person_mobile", rs4.getString("person_mobile"));

            }

            list.add(map);
        }

        return list;
    }

    public static List getActiveUser() throws SQLException {

        List list = new ArrayList();
        Connection con = MysqlDBConnection.getConnection();
        PreparedStatement ps;
        ResultSet rs, rs2, rs4;
        String sql;

        sql = "SELECT * FROM `user_active`";
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        while (rs.next()) {
            Map map = new Hashtable<String, String>();
            map.put("active_id", rs.getInt("active_id"));
            map.put("active", rs.getBoolean("active"));
            map.put("enter_datetime", rs.getString("enter_datetime"));
            map.put("exit_datetime", rs.getString("exit_datetime")+"");
            map.put("stay_amount_time", rs.getString("stay_amount_time")+"");
            map.put("user_id", rs.getInt("user_id"));

            sql = "SELECT * FROM `user` WHERE `user_id` = ? ; ";
            ps = con.prepareStatement(sql);
            ps.setInt(1, rs.getInt("user_id"));
            rs2 = ps.executeQuery();
            if (rs2.next()) {
                map.put("user_id", rs2.getInt("user_id"));
                map.put("user_type", rs2.getString("user_type"));
                map.put("first_name", rs2.getString("first_name"));
                map.put("surname", rs2.getString("surname"));
                map.put("fullname", rs2.getString("first_name") + " " + rs2.getString("surname"));
                map.put("email", rs2.getString("email"));
                map.put("password", rs2.getString("password"));
                map.put("re_type_password", rs2.getString("re_type_password"));
                map.put("picture_url", rs2.getString("picture_url"));
            }

            list.add(map);
        }

        return list;
    }

    public static void main(String[] args) throws SQLException {

//        List list = User.getAllSimpleUser();
//        int size = list.size();
//        Iterator iterator = list.iterator();
//        while (iterator.hasNext()) {
//            Map map = (Map) iterator.next();
//            System.out.println(map.get("simple_user_id"));
//            System.out.println("*************");
//        }


//        List list = User.getAllCompanyUser();
//        int size = list.size();
//        Iterator iterator = list.iterator();
//        while (iterator.hasNext()) {
//            Map map = (Map) iterator.next();
//            System.out.println(map.get("company_user_id"));
//            System.out.println(map.get("user_id"));
//            System.out.println(map.get("person_id"));
//            System.out.println("*************");
//        }
//        List list = User.getAllUser();
//        int size = list.size();
//        Iterator iterator = list.iterator();
//        while (iterator.hasNext()) {
//            Map map = (Map) iterator.next();
//
//            System.out.println(map.get("user_id"));
//
//            System.out.println(map.get("simple_user_id"));
//
//            System.out.println(map.get("company_user_id"));
//            System.out.println(map.get("person_id"));
//            System.out.println("*************");
//        }
        List list = User.getActiveUser();
        int size = list.size();
        Iterator iterator = list.iterator();
        while (iterator.hasNext()) {
            Map map = (Map) iterator.next();

            System.out.println(map.get("active_id"));

            System.out.println(map.get("enter_datetime"));

            System.out.println(map.get("user_id"));
            System.out.println(map.get("fullname"));
            System.out.println("*************");
        }



    }
}
