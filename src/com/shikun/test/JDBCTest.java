package com.shikun.test;

import java.sql.*;

/**
 * Created by SHIKUN on 2016/8/5.
 */
public class JDBCTest {
    public static void main(String[] args) {
        Connection conn = null;
        String sql;
        String url = "jdbc:mysql://123.206.213.14:3306/sampledb?user=root&password=110292";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("成功加载驱动");
            conn = DriverManager.getConnection(url);
            Statement stmt = conn.createStatement();
            sql = "select * from t_user";
            ResultSet resultSet = stmt.executeQuery(sql);
            while (resultSet.next()) {
                System.out.println(resultSet.getString(1) + "\t" + resultSet.getString(2)+"\t"+resultSet.getString(4));
            }
        } catch (SQLException e) {
            System.out.print("sql操作错误");
            e.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } finally {
            try {
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
