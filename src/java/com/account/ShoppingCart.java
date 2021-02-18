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
public class ShoppingCart {

    public List getShoppingCartList(int user_id) throws SQLException {

        Connection con, con2, con3, con4;
        con = MysqlDBConnection.getConnection();
        con2 = MysqlDBConnection.getConnection();
        con3 = MysqlDBConnection.getConnection();
        con4 = MysqlDBConnection.getConnection();

        PreparedStatement ps, ps2, ps3, ps4;
        ResultSet rs, rs2, rs3, rs4;

        List list = new ArrayList();
        List list1 = new ArrayList();
        List list2 = new ArrayList();

        String sql = "SELECT * FROM `shopping` where user_id = ?";
        ps = con.prepareStatement(sql);
        ps.setInt(1, user_id);
        rs = ps.executeQuery();

        if (rs.last()) {
            Map shoppingMap = new Hashtable<String, String>();
            int shopping_id = rs.getInt("shopping_id");
            int item_count = rs.getInt("item_count");
            double totalPrice = rs.getDouble("totalPrice");
            double totalSaveMony = rs.getDouble("totalSaveMony");
            shoppingMap.put("item_count", item_count);
            shoppingMap.put("totalPrice", totalPrice);
            shoppingMap.put("totalSaveMony", totalSaveMony);
            list1.add(shoppingMap);

            String sql2 = "SELECT * FROM `shopping_cart` where shopping_id = " + shopping_id;
            ps2 = con2.prepareStatement(sql2);
            rs2 = ps2.executeQuery();
            while (rs2.next()) {
                int image_id = rs2.getInt("image_id");
                int quantity = rs2.getInt("quantity");

                String sql3 = "SELECT * FROM `image` where image_id = " + image_id;
                ps3 = con3.prepareStatement(sql3);
                rs3 = ps3.executeQuery();
                while (rs3.next()) {
                    Map map = new Hashtable<String, String>();
                    map.put("name", rs3.getString("name"));
                    map.put("uploadDate", rs3.getString("uploadDate"));
                    map.put("header", rs3.getString("header"));
                    map.put("category_id", rs3.getString("category_id"));
                    map.put("type", rs3.getString("type"));
                    map.put("unitPrice", rs3.getDouble("unitPrice"));
                    map.put("alternatePrice", rs3.getDouble("alternatePrice"));
                    map.put("saveMoney", rs3.getDouble("saveMoney"));
                    map.put("percentRate", rs3.getString("percentRate"));
                    map.put("longDescription", rs3.getString("longDescription"));
                    map.put("largeImage", rs3.getString("largeImage"));
                    map.put("total_stock", rs3.getInt("total_stock"));
                    map.put("current_stock", rs3.getInt("current_stock"));
                    map.put("image_id", rs3.getInt("image_id"));
                    map.put("desginer_id", rs3.getInt("desginer_id"));

                    map.put("quantity", quantity);

                    String sql4 = "SELECT * FROM `desginer` where desginer_id = " + rs3.getInt("desginer_id");
                    ps4 = con4.prepareStatement(sql4);
                    rs4 = ps4.executeQuery();
                    while (rs4.next()) {
                        map.put("desginer_name", rs4.getString("first_name") + " " + rs4.getString("surname"));
                    }

                    list2.add(map);

                }

            }
        }

        list.add(list1);
        list.add(list2);

        return list;
    }

    public int getShoppingId(int user_id) throws SQLException {
        int shopping_id = 0;
        Connection con;
        con = MysqlDBConnection.getConnection();
        PreparedStatement ps;
        ResultSet rs;

        String sql = "SELECT * FROM `shopping` where  user_id=?";
        ps = con.prepareStatement(sql);
        ps.setInt(1, user_id);
        rs = ps.executeQuery();
        if (rs.last()) {
            shopping_id = rs.getInt("shopping_id");
        } else {
            String sql2 = "INSERT INTO `shopping` (`user_id`) VALUES (?);";
            ps = con.prepareStatement(sql2);
            ps.setInt(1, user_id);
            ps.executeUpdate();
            String sql3 = "SELECT * FROM `shopping` where user_id=?";
            ps = con.prepareStatement(sql3);
            ps.setInt(1, user_id);
            rs = ps.executeQuery();
            if (rs.last()) {
                shopping_id = rs.getInt("shopping_id");
            }
        }
        //System.out.println(shopping_id);

        return shopping_id;
    }

    public void setShoppingCart(int shopping_id, int image_id, int user_id) throws SQLException {
        Connection con;
        String sql;
        con = MysqlDBConnection.getConnection();
        PreparedStatement ps;
        ResultSet rs, find_result;

        sql = "select * from shopping_cart where shopping_id=? and image_id=? and user_id=?";
        ps = con.prepareStatement(sql);
        ps.setInt(1, shopping_id);
        ps.setInt(2, image_id);
        ps.setInt(3, user_id);
        find_result = ps.executeQuery();
        if (!find_result.next()) {

            sql = "INSERT INTO `shopping_cart` (`shopping_id`, `image_id`, `user_id`) VALUES ('" + shopping_id + "', '" + image_id + "', '" + user_id + "'); ";
            ps = con.prepareStatement(sql);
            ps.executeUpdate();

            double totalPrice = 0.0, totalSaveMony = 0.0, alternatePrice = 0.0, saveMoney = 0.0;
            int item_count = 0;

            sql = "SELECT * FROM `shopping` where shopping_id =? and user_id=? ";
            ps = con.prepareStatement(sql);
            ps.setInt(1, shopping_id);
            ps.setInt(2, user_id);
            rs = ps.executeQuery();
            if (rs.next()) {
                totalPrice = rs.getDouble("totalPrice");
                totalSaveMony = rs.getDouble("totalSaveMony");
                item_count = rs.getInt("item_count");
            }

            sql = "SELECT * FROM `image` where image_id = " + image_id;
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                alternatePrice = rs.getDouble("alternatePrice");
                saveMoney = rs.getDouble("saveMoney");
            }
            totalPrice += alternatePrice;
            totalSaveMony += saveMoney;
            item_count += 1;

            sql = "UPDATE `shopping` SET `item_count` = ?, `totalPrice` = ?, `totalSaveMony` = ? WHERE `shopping`.`shopping_id` = ? and user_id=?; ";
            ps = con.prepareStatement(sql);
            ps.setInt(1, item_count);
            ps.setDouble(2, totalPrice);
            ps.setDouble(3, totalSaveMony);
            ps.setDouble(4, shopping_id);
            ps.setDouble(5, user_id);
            ps.executeUpdate();
        }
    }

    public void setShoppingCartOut(int shopping_id, int image_id, int user_id) throws SQLException {
        Connection con;
        String sql;
        con = MysqlDBConnection.getConnection();
        PreparedStatement ps;
        ResultSet rs;

//        sql= "DELETE FROM `shopping_cart` WHERE `shopping_cart`.`image_id` = ?";
        sql = "DELETE FROM shopping_cart WHERE image_id =? and shopping_id =? and user_id = ?;";
        //System.out.println(sql);
        ps = con.prepareStatement(sql);
        ps.setInt(1, image_id);
        ps.setInt(2, shopping_id);
        ps.setInt(3, user_id);
        ps.executeUpdate();

        double totalPrice = 0.0, totalSaveMony = 0.0, alternatePrice = 0.0, saveMoney = 0.0;
        int item_count = 0;

        sql = "SELECT * FROM `shopping` where shopping_id = ? and  user_id = ?";
        ps = con.prepareStatement(sql);
        ps.setInt(1, shopping_id);
        ps.setInt(2, user_id);
        rs = ps.executeQuery();
        if (rs.next()) {
            totalPrice = rs.getDouble("totalPrice");
            totalSaveMony = rs.getDouble("totalSaveMony");
            item_count = rs.getInt("item_count");
        }

        sql = "SELECT * FROM `image` where image_id = " + image_id;
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        if (rs.next()) {
            alternatePrice = rs.getDouble("alternatePrice");
            saveMoney = rs.getDouble("saveMoney");
        }
        totalPrice -= alternatePrice;
        totalSaveMony -= saveMoney;
        item_count -= 1;

        if (totalPrice < 0.0) {
            totalPrice = 0.0;
        }
        if (totalSaveMony < 0.0) {
            totalSaveMony = 0.0;
        }
        if (item_count < 0) {
            item_count = 0;
        }

        if (item_count == 0) {
            sql = "DELETE FROM  `shopping`  WHERE `shopping`.`shopping_id` = ? and user_id = ?; ";
            ps = con.prepareStatement(sql);
            ps.setInt(1, shopping_id);
            ps.setInt(2, user_id);
            ps.executeUpdate();
        } else {
            sql = "UPDATE `shopping` SET `item_count` = ?, `totalPrice` = ?, `totalSaveMony` = ? WHERE `shopping`.`shopping_id` = ? and user_id = ?; ";
            ps = con.prepareStatement(sql);
            ps.setInt(1, item_count);
            ps.setDouble(2, totalPrice);
            ps.setDouble(3, totalSaveMony);
            ps.setInt(4, shopping_id);
            ps.setInt(5, user_id);
            ps.executeUpdate();

        }

    }

    public List getShoppingCartCount(int user_id) throws SQLException {
        Connection con;
        String sql;
        con = MysqlDBConnection.getConnection();
        PreparedStatement ps;
        ResultSet rs;
        List list = new ArrayList();

        sql = "SELECT * FROM `shopping` where user_id = ?";
        ps = con.prepareStatement(sql);
        ps.setInt(1, user_id);
        rs = ps.executeQuery();
        if (rs.next()) {
            list.add(rs.getInt("item_count"));
            list.add(rs.getDouble("totalPrice"));
            list.add(rs.getDouble("totalSaveMony"));
        }

        return list;
    }

    public List getCartImage(int user_id) throws SQLException {
        List imageList = new ArrayList();
        Connection con;
        String sql;
        con = MysqlDBConnection.getConnection();
        PreparedStatement ps;
        ResultSet rs;

        sql = "SELECT * FROM `shopping_cart` where user_id = ?";
        ps = con.prepareStatement(sql);
        ps.setInt(1, user_id);
        rs = ps.executeQuery();
        while (rs.next()) {
            imageList.add(rs.getInt("image_id"));
        }

        return imageList;
    }

    public static boolean validQuantity(int image_id, int q_value) throws SQLException {
        boolean bool = false;
        Connection con;
        String sql;
        con = MysqlDBConnection.getConnection();
        PreparedStatement ps;
        ResultSet rs;

        sql = "SELECT * FROM `image` where image_id = ?";
        ps = con.prepareStatement(sql);
        ps.setInt(1, image_id);
        rs = ps.executeQuery();
        while (rs.next()) {
            int current_stock = rs.getInt("current_stock");
            if (current_stock >= q_value) {
                bool = true;
//               System.out.println(current_stock);
//               System.out.println(q_value);
            }
        }

        return bool;
    }

    public void setQuantityPlusMinus(int image_id, int user_id, int quantity_value) throws SQLException {
        Connection con;
        String sql;
        con = MysqlDBConnection.getConnection();
        PreparedStatement ps;
        ResultSet rs;

//        UPDATE `shopping_cart` SET `quantity` = '2' WHERE `shopping_cart`.`cart_id` = 2101; 
        sql = "update  shopping_cart set quantity = ? where image_id = ? and user_id = ?";
        ps = con.prepareStatement(sql);
        ps.setInt(1, quantity_value);
        ps.setInt(2, image_id);
        ps.setInt(3, user_id);
        ps.executeUpdate();

    }

    public void quantityIncrDecr(int image_id, int user_id, boolean priceSaveMoneyIncrment) throws SQLException {
        Connection con;
        String sql;
        con = MysqlDBConnection.getConnection();
        PreparedStatement ps;
        ResultSet rs;
        if (priceSaveMoneyIncrment) {
            // for quantity plus
            double totalPrice = 0.0, totalSaveMony = 0.0, alternatePrice = 0.0, saveMoney = 0.0;
            int item_count = 0;

            sql = "SELECT * FROM `shopping` where user_id = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, user_id);
            rs = ps.executeQuery();
            if (rs.next()) {
                totalPrice = rs.getDouble("totalPrice");
                totalSaveMony = rs.getDouble("totalSaveMony");
                item_count = rs.getInt("item_count");
            }

            sql = "SELECT * FROM `image` where image_id = " + image_id;
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                alternatePrice = rs.getDouble("alternatePrice");
                saveMoney = rs.getDouble("saveMoney");

            }
            totalPrice += alternatePrice;
            totalSaveMony += saveMoney;
            item_count += 1;

            if (totalPrice < 0.0) {
                totalPrice = 0.0;
            }
            if (totalSaveMony < 0.0) {
                totalSaveMony = 0.0;
            }
            if (item_count < 0) {
                item_count = 0;
            }

//            sql = "UPDATE `shopping` SET `item_count` = ?, `totalPrice` = ?, `totalSaveMony` = ? WHERE  user_id = ?; ";
            sql = "UPDATE `shopping` SET  `totalPrice` = ?, `totalSaveMony` = ? WHERE  user_id = ?; ";
            ps = con.prepareStatement(sql);
            ps.setDouble(1, totalPrice);
            ps.setDouble(2, totalSaveMony);
            ps.setInt(3, user_id);
            ps.executeUpdate();

        } else {
            // for quantity minus 
            double totalPrice = 0.0, totalSaveMony = 0.0, alternatePrice = 0.0, saveMoney = 0.0;
            int item_count = 0;

            sql = "SELECT * FROM `shopping` where user_id = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, user_id);
            rs = ps.executeQuery();
            if (rs.next()) {
                totalPrice = rs.getDouble("totalPrice");
                totalSaveMony = rs.getDouble("totalSaveMony");
                item_count = rs.getInt("item_count");
            }

            int quantity = 0;
            sql = "SELECT * FROM `shopping_cart` where user_id=? and image_id =? ";
            ps = con.prepareStatement(sql);
            ps.setInt(1, user_id);
            ps.setInt(2, image_id);
            rs = ps.executeQuery();
            if (rs.next()) {
                quantity = rs.getInt("quantity");
            }

//            System.out.println("quantity : "+quantity);
            if (quantity > 1) {

                sql = "SELECT * FROM `image` where image_id = " + image_id;
                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
                if (rs.next()) {
                    alternatePrice = rs.getDouble("alternatePrice");
                    saveMoney = rs.getDouble("saveMoney");
                }

                totalPrice -= alternatePrice;
                totalSaveMony -= saveMoney;
                item_count -= 1;

                if (totalPrice < 0.0) {
                    totalPrice = 0.0;
                }
                if (totalSaveMony < 0.0) {
                    totalSaveMony = 0.0;
                }
                if (item_count < 0) {
                    item_count = 0;
                }

//            sql = "UPDATE `shopping` SET `item_count` = ?, `totalPrice` = ?, `totalSaveMony` = ? WHERE  user_id = ?; ";
                sql = "UPDATE `shopping` SET  `totalPrice` = ?, `totalSaveMony` = ? WHERE  user_id = ?; ";
                ps = con.prepareStatement(sql);
                ps.setDouble(1, totalPrice);
                ps.setDouble(2, totalSaveMony);
                ps.setInt(3, user_id);
                ps.executeUpdate();
            }
        }
    }

    public static void updateShoppingCartRecord(int user_id) throws SQLException {
        Connection con;
        con = MysqlDBConnection.getConnection();
        PreparedStatement ps;
        ResultSet rs, rs2, rs3;
        String sql;

        sql = "select * FROM  `shopping_cart`  WHERE user_id = ?;";
        ps = con.prepareStatement(sql);
        ps.setInt(1, user_id);
        rs = ps.executeQuery();
        while (rs.next()) {
            double totalPrice = 0.0, totalSaveMony = 0.0, alternatePrice = 0.0, saveMoney = 0.0;
            int current_stock = -1, item_count = 0, shopping_id = 0;
            
            int quantity = rs.getInt("quantity");
            int image_id = rs.getInt("image_id");
            int cart_id  = rs.getInt("cart_id");

            sql = "SELECT * FROM `image` where image_id = " + image_id;
            ps = con.prepareStatement(sql);
            rs2 = ps.executeQuery();
            if (rs2.next()) {
                current_stock = rs2.getInt("current_stock");
                alternatePrice = rs2.getDouble("alternatePrice");
                saveMoney = rs2.getDouble("saveMoney");
                image_id = rs2.getInt("image_id");
            }

            if (current_stock == 0) {
                sql = "DELETE FROM `shopping_cart` WHERE `shopping_cart`.`image_id` = ? and cart_id  = ?";
                ps = con.prepareStatement(sql);
                ps.setInt(1, image_id);
                ps.setInt(2, cart_id);
                ps.executeUpdate();

                sql = "SELECT * FROM `shopping` where user_id = ?";
                ps = con.prepareStatement(sql);
                ps.setInt(1, user_id);
                rs3 = ps.executeQuery();
                if (rs3.next()) {
                    totalPrice = rs3.getDouble("totalPrice");
                    totalSaveMony = rs3.getDouble("totalSaveMony");
                    item_count = rs3.getInt("item_count");
                    shopping_id = rs3.getInt("shopping_id");
                }
                totalPrice = totalPrice - alternatePrice;
                totalSaveMony = totalSaveMony - saveMoney;
                item_count = item_count - 1;

                if (totalPrice < 0.0) {
                    totalPrice = 0.0;
                }
                if (totalSaveMony < 0.0) {
                    totalSaveMony = 0.0;
                }
                if (item_count < 0) {
                    item_count = 0;
                }

                if (item_count == 0) {
                    sql = "DELETE FROM  `shopping`  WHERE `shopping`.`shopping_id` = ? and user_id = ?; ";
                    ps = con.prepareStatement(sql);
                    ps.setInt(1, shopping_id);
                    ps.setInt(2, user_id);
                    ps.executeUpdate();
                } else {
                    sql = "UPDATE `shopping` SET `item_count` = ?, `totalPrice` = ?, `totalSaveMony` = ? WHERE  user_id = ? and shopping_id = ?; ";
                    ps = con.prepareStatement(sql);
                    ps.setDouble(1, item_count);
                    ps.setDouble(2, totalPrice);
                    ps.setDouble(3, totalSaveMony);
                    ps.setInt(4, user_id);
                    ps.setInt(5, shopping_id);
                    ps.executeUpdate();
                }

            }

        }

    }

    public static void main(String[] args) throws SQLException {
//        INSERT INTO `shopping_cart` (`cart_id`, `shopping_id`, `image_id`, `user_id`) VALUES (NULL, '2000', '1100', '100'); 
        ShoppingCart or = new ShoppingCart();
        //or.getShoppingCartList();
//        or.setShoppingCart(2000,1102,100);
        //or.setShoppingCartOut(2000, 1102, 100);

//        List list = or.getCartImage(102);
//        for (int i = 0; i < list.size(); i++) {
//            System.out.println(list.get(i));
//        }
    }
}
