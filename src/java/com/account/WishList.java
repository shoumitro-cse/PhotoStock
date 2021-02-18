package com.account;

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
public class WishList {

    public void insert(int image_id, int user_id) throws SQLException {
        Connection con;
        String sql;
        con = MysqlDBConnection.getConnection();
        PreparedStatement ps;
        ResultSet rs;

        sql = "select * from wishlist where image_id=? and user_id=?";
        ps = con.prepareStatement(sql);
        ps.setInt(1, image_id);
        ps.setInt(2, user_id);
        rs = ps.executeQuery();
        if (!rs.last()) {
            sql = "insert into wishlist(image_id, user_id) values(?,?)";
            ps = con.prepareStatement(sql);
            ps.setInt(1, image_id);
            ps.setInt(2, user_id);
            ps.executeUpdate();
        }
    }

    public void exit(int image_id, int user_id) throws SQLException {
        Connection con;
        String sql;
        con = MysqlDBConnection.getConnection();
        PreparedStatement ps;
        ResultSet rs;

        sql = "delete from wishlist where image_id = ? and user_id = ?";
        ps = con.prepareStatement(sql);
        ps.setInt(1, image_id);
        ps.setInt(2, user_id);
        ps.executeUpdate();
    }

    public List getWishlistImage(int user_id) throws SQLException {
        List imageList = new ArrayList();
        Connection con;
        String sql;
        con = MysqlDBConnection.getConnection();
        PreparedStatement ps;
        ResultSet rs;

        sql = "SELECT * FROM `wishlist` where user_id = ?";
        ps = con.prepareStatement(sql);
        ps.setInt(1, user_id);
        rs = ps.executeQuery();
        while (rs.next()) {
            imageList.add(rs.getInt("image_id"));
        }

        return imageList;
    }

    public List getWishlistCartImage(int user_id) throws SQLException {
        List list = new ArrayList();
        List imageList = new ArrayList();
        List imageCount = new ArrayList();
        Connection con, con2, con3, con4;
        String sql, sql2, sql3, sql4;
        con = MysqlDBConnection.getConnection();
        con2 = MysqlDBConnection.getConnection();
        con3 = MysqlDBConnection.getConnection();
        con4 = MysqlDBConnection.getConnection();
        PreparedStatement ps, ps2, ps3, ps4;
        ResultSet rs, rs2, rs3, rs4;
        int count = 0;

        sql = "SELECT * FROM `wishlist` where user_id = ?";
        ps = con.prepareStatement(sql);
        ps.setInt(1, user_id);
        rs = ps.executeQuery();
        while (rs.next()) {
            int image_id = rs.getInt("image_id");
            sql2 = "SELECT * FROM `image` where image_id = " + image_id;
            ps2 = con2.prepareStatement(sql2);
            rs2 = ps2.executeQuery();
            while (rs2.next()) {
                Map map = new Hashtable<String, String>();
                map.put("name", rs2.getString("name"));
                map.put("uploadDate", rs2.getString("uploadDate"));
                map.put("header", rs2.getString("header"));
                map.put("category_id", rs2.getString("category_id"));
                map.put("type", rs2.getString("type"));
                map.put("unitPrice", rs2.getDouble("unitPrice"));
                map.put("alternatePrice", rs2.getDouble("alternatePrice"));
                map.put("saveMoney", rs2.getDouble("saveMoney"));
                map.put("percentRate", rs2.getString("percentRate"));
//                map.put("shortDescription", rs2.getString("shortDescription"));
//                map.put("longDescription", rs2.getString("longDescription"));
                map.put("largeImage", rs2.getString("largeImage"));
                map.put("image_id", rs2.getInt("image_id"));
                map.put("desginer_id", rs2.getInt("desginer_id"));

                sql3 = "SELECT * FROM `desginer` where desginer_id = " + rs2.getInt("desginer_id");
                ps3 = con3.prepareStatement(sql3);
                rs3 = ps3.executeQuery();
                while (rs3.next()) {
                    map.put("desginer_name", rs3.getString("first_name") + " " + rs3.getString("surname"));
                }

                sql4 = "SELECT * FROM `image_rating_review` where image_id = " + rs2.getInt("image_id");
                ps4 = con4.prepareStatement(sql4);
                rs4 = ps4.executeQuery();
                while (rs4.next()) {
                    map.put("ratings", rs4.getInt("ratings"));
                    map.put("reviews", rs4.getInt("reviews"));
                }

                imageList.add(map);
                count += 1;

            }
        }
        imageCount.add(count);
        list.add(imageList);
        list.add(imageCount);

        return list;
    }

    public static void main(String[] args) throws SQLException {

        WishList wishList = new WishList();
        List list = wishList.getWishlistCartImage(103);

    }
}
