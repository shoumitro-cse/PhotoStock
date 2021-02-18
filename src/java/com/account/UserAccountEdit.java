package com.account;

import com.db_connect.MysqlDBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

/**
 *
 * @author shoumitro
 */
public class UserAccountEdit extends UserAccount {

    public List getUserInfo(int user_id) throws SQLException {
        List list = new ArrayList();
        List list2 = new ArrayList();
        Connection con = MysqlDBConnection.getConnection();
        PreparedStatement ps;
        ResultSet rs, rs2, rs3, rs4;
        String sql;

        sql = "SELECT * FROM `user` where user_id = ? ";
        ps = con.prepareStatement(sql);
        ps.setInt(1, user_id);
        rs = ps.executeQuery();
        if (rs.next()) {
            Map map = new Hashtable<String, String>();
            map.put("user_id", rs.getInt("user_id"));
            map.put("user_type", rs.getString("user_type"));
            map.put("full_name", rs.getString("first_name") + " " + rs.getString("surname"));
            map.put("first_name", rs.getString("first_name"));
            map.put("surname", rs.getString("surname"));
            map.put("email", rs.getString("email"));
            map.put("password", rs.getString("password"));
            map.put("re_type_password", rs.getString("re_type_password"));
            map.put("picture_url", rs.getString("picture_url") + "");

            sql = "SELECT * FROM `simple_user` where user_id = ? ";
            ps = con.prepareStatement(sql);
            ps.setInt(1, user_id);
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
            ps.setInt(1, user_id);
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

    public void updateSimpleUserPersonalInfo(int user_id, String first_name, String surname, String dob, String gender) throws SQLException {
        Connection con = MysqlDBConnection.getConnection();
        PreparedStatement ps;
        ResultSet rs;
        String sql;

        sql = "UPDATE `user` SET `first_name` = ?, `surname` = ? WHERE `user`.`user_id` = ?;  ";
        ps = con.prepareStatement(sql);
        ps.setString(1, first_name);
        ps.setString(2, surname);
        ps.setInt(3, user_id);
        ps.executeUpdate();

        sql = "UPDATE `simple_user` SET `dob` = ?, `gender` = ? WHERE `simple_user`.`user_id` = ?;  ";
        ps = con.prepareStatement(sql);
        ps.setString(1, dob);
        ps.setString(2, gender);
        ps.setInt(3, user_id);
        ps.executeUpdate();

        con.close();
    }

    public void updateSimpleUserContactInfo(int user_id, String country, String city, String state, String permanent_addr, String current_addr, String zip) throws SQLException {
        Connection con = MysqlDBConnection.getConnection();
        PreparedStatement ps;
        ResultSet rs;
        String sql;

        sql = "UPDATE `simple_user` SET `country` = ?, `city` = ?, `state` =  ?, `permanent_addr` = ?, `current_addr` = ?, `zip` = ? WHERE `simple_user`.`user_id` = ?;   ";
        ps = con.prepareStatement(sql);
        ps.setString(1, country);
        ps.setString(2, city);
        ps.setString(3, state);
        ps.setString(4, permanent_addr);
        ps.setString(5, current_addr);
        ps.setString(6, zip);
        ps.setInt(7, user_id);
        ps.executeUpdate();

        con.close();

    }

    public void updateCompanyUserPersonalAndContactInfo(int user_id, String first_name, String surname, String company_name, String country, String city, String company_address, String company_type, String business_license_no, String business_descr, String website_url) throws SQLException {
        Connection con = MysqlDBConnection.getConnection();
        PreparedStatement ps;
        String sql;

        sql = "UPDATE `user` SET `first_name` = ?, `surname` = ? WHERE `user`.`user_id` = ?;  ";
        ps = con.prepareStatement(sql);
        ps.setString(1, first_name);
        ps.setString(2, surname);
        ps.setInt(3, user_id);
        ps.executeUpdate();

        sql = "UPDATE `company_user` SET `company_name` = ?, `country` = ?, `city` = ?, `company_address` = ?, `company_type` = ?, `business_license_no` = ?, `business_descr` = ?, `website_url` = ? WHERE `company_user`.`user_id` = ?;";
        ps = con.prepareStatement(sql);
        ps.setString(1, company_name);
        ps.setString(2, country);
        ps.setString(3, city);
        ps.setString(4, company_address);
        ps.setString(5, company_type);
        ps.setString(6, business_license_no);
        ps.setString(7, business_descr);
        ps.setString(8, website_url);
        ps.setInt(9, user_id);
        ps.executeUpdate();

        con.close();
    }

    public void updateCompanyUserContactPersonInfo(int person_id, String person_name, String person_designation, String person_email, String person_mobile) throws SQLException {
        Connection con = MysqlDBConnection.getConnection();
        PreparedStatement ps;
        String sql;

        sql = "UPDATE `company_contact_person` SET `person_name` = ?, `person_email` = ?, `person_designation` = ?, `person_mobile` = ? WHERE `company_contact_person`.`person_id` = ?; ";
        ps = con.prepareStatement(sql);
        ps.setString(1, person_name);
        ps.setString(2, person_email);
        ps.setString(3, person_designation);
        ps.setString(4, person_mobile);
        ps.setInt(5, person_id);
        ps.executeUpdate();

        con.close();

    }

    public void userPictureChange(int user_id, String picture_url) throws SQLException {
        Connection con = MysqlDBConnection.getConnection();
        PreparedStatement ps;
        ResultSet rs;
        String sql;

        sql = "UPDATE `user` SET `picture_url` = ? WHERE `user`.`user_id` = ?;";
        ps = con.prepareStatement(sql);
        ps.setString(1, picture_url);
        ps.setInt(2, user_id);
        ps.executeUpdate();
        
        con.close();
    }

    public void userEmailChange(int user_id, String email) throws SQLException {
        Connection con = MysqlDBConnection.getConnection();
        PreparedStatement ps;
        ResultSet rs;
        String sql;

        sql = "UPDATE `user` SET `email` = ? WHERE `user`.`user_id` = ?;";
        ps = con.prepareStatement(sql);
        ps.setString(1, email);
        ps.setInt(2, user_id);
        ps.executeUpdate();
        
        con.close();
    }

    public void userPasswordChange(int user_id, String re_type_password, String password, String current_pw) throws SQLException {
        Connection con = MysqlDBConnection.getConnection();
        PreparedStatement ps;
        ResultSet rs;
        String sql;

        sql = "UPDATE `user` SET `password` = ?, `re_type_password` = ? WHERE `user`.`user_id` = ? and password = ?; ";
        ps = con.prepareStatement(sql);
        ps.setString(1, re_type_password);
        ps.setString(2, password);
        ps.setInt(3, user_id);
        ps.setString(4, current_pw);
        ps.executeUpdate();
        
        con.close();
    }

    public static void main(String[] args) throws SQLException {
        UserAccountEdit userAccountEdit = new UserAccountEdit();

//        for company user
        List userInfoList = userAccountEdit.getUserInfo(105);

//        for simple user
//        List userInfoList = userAccountEdit.getUserInfo(106);
        if (userInfoList.size() > 0) {

            Map map = (Map) userInfoList.get(0);

            if (map.get("user_id") != null) {

                if (map.get("user_id") != null && map.get("simple_user_id") != null) {
                    System.out.println("user_id : " + map.get("user_id"));
                    System.out.println("simple_user_id : " + map.get("simple_user_id"));
                }

                if (map.get("user_id") != null && map.get("company_user_id") != null) {
                    System.out.println("user_id : " + map.get("user_id"));
                    System.out.println("company_user_id : " + map.get("company_user_id"));
                }

                if (map.get("user_id") != null && map.get("person_id") != null && map.get("company_user_id") != null) {
                    System.out.println("person_id : " + map.get("person_id"));
                }

            }
        }
    }

}
