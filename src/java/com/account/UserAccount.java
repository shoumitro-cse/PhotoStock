package com.account;

import com.db_connect.MysqlDBConnection;
import java.sql.*;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.Month;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import oracle.net.aso.m;
import org.json.simple.JSONObject;

/**
 *
 * @author shoumitro
 */
public class UserAccount {

    String u;
    Connection con = null;

    public static LocalDateTime millsToLocalDateTime(long millis) {
        Instant instant = Instant.ofEpochMilli(millis);
        LocalDateTime date = instant.atZone(ZoneId.systemDefault()).toLocalDateTime();
        return date;
    }

    public int user(String first_name, String surname, String email, String password, String re_type_password, String user_type) throws SQLException {
        Connection con = MysqlDBConnection.getConnection();
        int user_id = -1;
        PreparedStatement ps = con.prepareStatement("insert into user(user_type, first_name, surname, email, password, re_type_password) values (?,?,?,?,?,?)");
        ps.setString(1, user_type);
        ps.setString(2, first_name);
        ps.setString(3, surname);
        ps.setString(4, email);
        ps.setString(5, password);
        ps.setString(6, re_type_password);
        ps.executeUpdate();

        ps = con.prepareStatement("select user_id from user ORDER by user_id DESC LIMIT 1");
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            user_id = rs.getInt("user_id");
        }

        return user_id;
    }

    public int getEnterUserId(String login_email, String login_password) throws SQLException {
        int user_id = 0;
        Connection con = MysqlDBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement("SELECT * FROM `user` WHERE email = '" + login_email + "' and password = '" + login_password + "' ");
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            user_id = rs.getInt("user_id");
        }
        return user_id;
    }

    public void exitUser(int user_id, int active_id) throws SQLException {
        Connection con = MysqlDBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement("update user_active set active=?, exit_datetime=? where user_id=? and active_id=?");
        ps.setBoolean(1, false);
        ps.setString(2, LocalDateTime.now().toString());
        ps.setInt(3, user_id);
        ps.setInt(4, active_id);
        ps.executeUpdate();
    }

    public void userStayAmountOfTime(int user_id, int active_id) throws SQLException {
        Connection con = MysqlDBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement("update user_active set stay_amount_time=? where user_id=? and active_id=?");
        ps.setString(1, userStayTimeCalculate(user_id, active_id));
        ps.setInt(2, user_id);
        ps.setInt(3, active_id);
        ps.executeUpdate();
    }

    public String userStayTimeCalculate(int user_id, int active_id) throws SQLException {
        String st = "", et = "";

        Connection con = MysqlDBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement("select * from user_active where user_id=? and active_id=?");
        ps.setInt(1, user_id);
        ps.setInt(2, active_id);

        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            st = rs.getString("enter_datetime");
            et = rs.getString("exit_datetime");
        }

        LocalDateTime startTime = LocalDateTime.parse(st);
        LocalDateTime endTime = LocalDateTime.parse(et);

        int h = endTime.getHour() - startTime.getHour();
        int m = endTime.getMinute() - startTime.getMinute();
        int s = endTime.getSecond() - startTime.getSecond();

        if (h < 0) {
            h = 0;
        }
        if (m < 0) {
            m = 0;
        }
        if (s < 0) {
            s = 0;
        }

        String duration = h + " hours " + m + " min " + s + " s";
        //System.out.println(h + " hours " + m + " min " + s + " s");

        return duration;
    }

    public int userEnter(int user_id) throws SQLException {
        Connection con = MysqlDBConnection.getConnection();
//        PreparedStatement ps = con.prepareStatement("update user_active set active=?, enter_datetime=? where user_id=?");
        PreparedStatement ps;
        int user_active = 0;
        ps = con.prepareStatement("insert into user_active(active, enter_datetime, user_id) values(?,?,?)");
        ps.setBoolean(1, true);
        ps.setString(2, LocalDateTime.now().toString());
        ps.setInt(3, user_id);
        ps.executeUpdate();

        user_active = findUserActiveId();
        return user_active;
    }

    public int findUserActiveId() throws SQLException {
        Connection con = MysqlDBConnection.getConnection();
        PreparedStatement ps;
        int user_active = 0, find_id = 0;
        ps = con.prepareStatement("select * from  user_active order by active_id desc limit 1;");
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            find_id = rs.getInt("active_id");
        }
        if (find_id != 0) {
            user_active = find_id;
        }
        return user_active;
    }

    public String account(String first_name, String surname, String email, String password,
            String re_type_password, String user_type, String company_name, String company_country,
            String company_city, String company_addr, String company_type, String business_license_no,
            String business_decr, String website_url, String person_name, String person_designation,
            String person_email, String person_mobile) throws SQLException {
        if (user_type != null) {
            if (user_type.equalsIgnoreCase("company")) {
                u = "company user";
                int user_id = user(first_name, surname, email, password, re_type_password, user_type);
                if (user_id != -1) {
                    companyUserAccount(company_name, company_country, company_city, company_addr, company_type, business_license_no, business_decr, website_url, person_name, person_designation, person_email, person_mobile, user_id);
                }
            } else if (user_type.equalsIgnoreCase("simple")) {
                u = "simple user";
                int user_id = user(first_name, surname, email, password, re_type_password, user_type);
                if (user_id != -1) {
                    simpleUserAccount(user_id);
                }
            } else {
                u = "not user";
            }
        }
        return u;
    }

    public void simpleUserAccount(int user_id) throws SQLException {
        Connection con = MysqlDBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement("insert into simple_user(user_id) values (?)");
        ps.setInt(1, user_id);
        ps.executeUpdate();
    }

    public void companyUserAccount(String company_name, String company_country,
            String company_city, String company_addr, String company_type, String business_license_no,
            String business_decr, String website_url, String person_name, String person_designation,
            String person_email, String person_mobile, int user_id) throws SQLException {

        Connection con = MysqlDBConnection.getConnection();
        int company_user_id = -1;
        PreparedStatement ps = con.prepareStatement("insert into company_user(company_name, country, city,company_address,company_type , business_license_no, business_descr, website_url, user_id) values (?,?,?,?,?,?,?,?,?)");
        ps.setString(1, company_name);
        ps.setString(2, company_country);
        ps.setString(3, company_city);
        ps.setString(4, company_addr);
        ps.setString(5, company_type);
        ps.setString(6, business_license_no);
        ps.setString(7, business_decr);
        ps.setString(8, website_url);
        ps.setInt(9, user_id);
        ps.executeUpdate();

        ps = con.prepareStatement("select company_user_id from company_user ORDER by company_user_id DESC LIMIT 1");
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            company_user_id = rs.getInt("company_user_id");
        }
        if (company_user_id != -1) {
            companyUserPersonAccount(person_name, person_designation, person_email, person_mobile, company_user_id);
        }
    }

    public void companyUserPersonAccount(String person_name, String person_designation,
            String person_email, String person_mobile, Integer company_user_id) throws SQLException {
        Connection con = MysqlDBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement("insert into company_contact_person(person_name, person_email, person_designation,person_mobile,company_user_id) values (?,?,?,?,?)");
        ps.setString(1, person_name);
        ps.setString(2, person_email);
        ps.setString(3, person_designation);
        ps.setString(4, person_mobile);
        ps.setInt(5, company_user_id);
        ps.executeUpdate();
    }

    public int emailCheck(String email) throws SQLException {
        int ck = -1;
        String email_ck = "";
        Connection con = MysqlDBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement("select email from user where email = '" + email + "';");
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            email_ck = rs.getString("email");
            //System.out.println("email addr : "+email_ck);
        }
        if (email_ck != "") {
            ck = 1;
        }
        return ck;
    }

    public boolean accountCheck(String login_email, String login_password) throws SQLException {
        boolean ck = false;
        String pw_ck = "", email = "";
        Connection con = MysqlDBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement("SELECT * FROM `user` WHERE email = '" + login_email + "' and password = '" + login_password + "' ");
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            pw_ck = rs.getString("password");
            email = rs.getString("email");
            //System.out.println("email : " + email);
            // System.out.println("password : " + pw_ck);
        }
        if (pw_ck != "" && email != "") {
            if (pw_ck.contentEquals(login_password) && email.contentEquals(login_email)) {
                ck = true;
            }

        }
        return ck;
    }

    public static void enterVisitedUser(int user_id) throws SQLException {

        Connection con = MysqlDBConnection.getConnection();
        PreparedStatement ps;
        ResultSet rs, rs2, rs3, rs4;
        String sql;

        sql = "SELECT * FROM `visited_users_count` WHERE `user_id` = ? ";
        ps = con.prepareStatement(sql);
        ps.setInt(1, user_id);
        rs = ps.executeQuery();

        if (!rs.next()) {

            int visited_users_chart_id = 0;
            int visited_users_count = 0;

            sql = "INSERT INTO `visited_users_count` (`user_id`) VALUES (?); ";
            ps = con.prepareStatement(sql);
            ps.setInt(1, user_id);
            ps.executeUpdate();

            sql = "SELECT count(*) as count FROM `visited_users_count` ";
            ps = con.prepareStatement(sql);
            rs2 = ps.executeQuery();

            while (rs2.next()) {
                visited_users_count = rs2.getInt("count");
            }

            sql = "SELECT * FROM `visited_users_chart` ";
            ps = con.prepareStatement(sql);
            rs4 = ps.executeQuery();

            if (!rs4.next()) {

                sql = "INSERT INTO `visited_users_chart` (`visited_users_count`, `date_day`) VALUES (?, ?); ";
                ps = con.prepareStatement(sql);
                ps.setInt(1, visited_users_count);
                ps.setString(2, LocalDateTime.now().toString());
                ps.executeUpdate();
            } else {

                sql = "SELECT * FROM `visited_users_chart` order by visited_users_chart_id desc limit 1 ";
                ps = con.prepareStatement(sql);
                rs3 = ps.executeQuery();

                if (rs3.last()) {
                    visited_users_chart_id = rs3.getInt("visited_users_chart_id");
                }

                sql = "UPDATE `visited_users_chart` SET `visited_users_count` = ? WHERE `visited_users_chart`.`visited_users_chart_id` = ?; ";
                ps = con.prepareStatement(sql);
                ps.setInt(1, visited_users_count);
                ps.setInt(2, visited_users_chart_id);
                ps.executeUpdate();
            }

        }

    }

    public static boolean dayChange() throws SQLException {
        boolean bool = false;

       String date_day = UserAccount.getVisitedUsersDate();
        
        if(date_day != "") {
            LocalDateTime startTime = LocalDateTime.parse(date_day);
            LocalDateTime endTime = LocalDateTime.now();

            int old_day = startTime.getDayOfMonth();
            int old_month = startTime.getMonthValue();
            int old_year = startTime.getYear();

            int new_day = endTime.getDayOfMonth();
            int new_month = endTime.getMonthValue();
            int new_year = endTime.getYear();

            if (new_day != old_day || new_month != old_month || new_year != old_year) {
                bool = true;
            } else {
                bool = false;
            }
        }

        return bool;
    }

    public static String getVisitedUsersDate() throws SQLException {
        Connection con = MysqlDBConnection.getConnection();
        PreparedStatement ps;
        ResultSet rs, rs2, rs3, rs4;
        String sql;

        String date_day = "";

        sql = "SELECT * FROM `visited_users_chart` order by visited_users_chart_id desc limit 1 ";
        ps = con.prepareStatement(sql);
        rs3 = ps.executeQuery();

        if (rs3.last()) {
            date_day = rs3.getString("date_day");
        }

        return date_day;
    }

    public static void enterNewChartRecord() throws SQLException {
        Connection con = MysqlDBConnection.getConnection();
        PreparedStatement ps;
        String sql;

        sql = "INSERT INTO `visited_users_chart` (`date_day`) VALUES (?); ";
        ps = con.prepareStatement(sql);
        ps.setString(1, LocalDateTime.now().toString());
        ps.executeUpdate();
    }
    
    public static void deleteVisitedUserRecord() throws SQLException {
        Connection con = MysqlDBConnection.getConnection();
        PreparedStatement ps;
        String sql;

        sql = "DELETE FROM `visited_users_count`";
        ps = con.prepareStatement(sql);
        ps.executeUpdate();
    }

    //    json example
    public static void main(String[] args) throws SQLException {
        
        UserAccount uc = new UserAccount();
        System.out.println(uc.getEnterUserId("shoumitro26@gmail.com", "shoumitro26@gmail.com"));
        
        
//        JSONObject obj = new JSONObject();
//        obj.put("name", "foo");
//        obj.put("num", new Integer(100));
//        obj.put("balance", new Double(1000.21));
//        obj.put("is_vip", new Boolean(true));
//        System.out.println(obj);
//
//        LocalDateTime startTime = LocalDateTime.parse("2018-01-06T03:20:25");
//        LocalDateTime endTime = LocalDateTime.parse("2019-05-05T23:50:55");
//
//        int h = endTime.getHour() - startTime.getHour();
//        int m = endTime.getMinute() - startTime.getMinute();
//        int s = endTime.getSecond() - startTime.getSecond();
//        System.out.println(h + " hours " + m + " min " + s + " s");
//
//        UserAccount uc = new UserAccount();

//        System.out.println(uc.userStayTimeCalculate(100,204));
//        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd MMM yyyy ");
//        String dateString = LocalDateTime.parse("2020-07-29T18:42:47.467").format(formatter);



//        int user_id = 101;
//        boolean bool = UserAccount.dayChange();
//        if (bool) {
//            UserAccount.deleteVisitedUserRecord();
//            UserAccount.enterNewChartRecord();
//            UserAccount.enterVisitedUser(user_id);
//            System.out.println("New Day");
//        } else {
//            UserAccount.enterVisitedUser(user_id);
//            System.out.println("Same Day");
//        }

    }

}
