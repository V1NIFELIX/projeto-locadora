package br.com.locadora;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DataBase {

	public static Connection getConnection() throws SQLException, ClassNotFoundException {
		Class.forName("com.mysql.jdbc.Driver");
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/locadoradsv", "root", "root");
		System.out.println("Conexão com o banco de dados executada!");
		return connection;

	}
}
