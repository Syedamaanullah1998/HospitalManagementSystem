package com.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionManager {
	private static Connection conn;
	public static Connection getDBConn() {
		try {
			Class.forName("org.sqlite.JDBC");
			conn = DriverManager.getConnection("jdbc:sqlite:D:\\PracticeProjectResources\\hospital.db","root","hospitaldb");
		}catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
}
