package br.com.locadora.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import br.com.locadora.DataBase;
import br.com.locadora.VO.LoginVO;

public class LoginDAO {

	public boolean BuscarPorEmailESenha(String email, Integer senha) throws ClassNotFoundException, SQLException {
		Connection connection = DataBase.getConnection();

		try {
			String sql = "SELECT * FROM conta WHERE email=? AND senha=?";
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, email);
			stmt.setInt(2, senha);
			ResultSet resultSet = stmt.executeQuery();
			if (resultSet.next()) {

				LoginVO loginVO = new LoginVO();
				loginVO.setEmail(resultSet.getString("email"));
				loginVO.setSenha(senha);
				return true;

			} else {
				
			}

		} catch (Exception e) {
			System.out.println("ERRO ao executar BuscarPorEmailESenha");

		}
		return false;

	}
}
