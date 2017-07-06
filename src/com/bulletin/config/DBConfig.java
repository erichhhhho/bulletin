package com.bulletin.config;

/**
 * @Project：${project_name}
 * @File：${type_name}
 * @Author：何唯 （Erichhhhho）
 * @Date：1:04 2017/7/6
 * @Description：
 */
import java.sql.Connection;
import java.sql.DriverManager;

public class DBConfig {
    static final String url = "jdbc:mysql://localhost:3306/test?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull";
    static final String user = "root";
    static final String password = "root";

    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url, user, password);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
}