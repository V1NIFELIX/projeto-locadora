package br.com.locadora.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;

import br.com.locadora.DataBase;
import br.com.locadora.VO.FilmeVO;

public class FilmeDAO {

	public List<FilmeVO> listarFilmes(boolean disponivel) {

		Connection connection;
		List<FilmeVO> filmes = new ArrayList<FilmeVO>();
		try {
			connection = DataBase.getConnection();

			Statement statement = connection.createStatement();
			String sql = "select * from filmes ";
			if(disponivel) {
				sql += " WHERE quantidadeF > 0 ";
			}
			boolean resultado = statement.execute(sql);
			ResultSet resultSet = statement.getResultSet();
			while (resultSet.next()) {
				FilmeVO filmeVO = new FilmeVO();				
				String nomeF = resultSet.getString("nomeF");
				String sinopseF = resultSet.getString("sinopseF");
				Integer quantidadeF = resultSet.getInt("quantidadeF");
				Integer idFilmes = resultSet.getInt("idFilmes");
				
				filmeVO.setNomeF(nomeF);
				filmeVO.setSinopseF(sinopseF);
				filmeVO.setQuantidadeF(quantidadeF);
				filmeVO.setIdFilmes(idFilmes);
				filmes.add(filmeVO);

			}

			resultSet.close();
			connection.close();
			statement.close();
		} catch (Exception ex) {
			System.out.println("erro ao executar o metodo listarFilmes");
		}
		System.out.println("metodo listarFilmes executado");
		return filmes;

	}
	
	public List<FilmeVO> listarFilmesLocacao(String idLocacao) {

		Connection connection;
		List<FilmeVO> filmes = new ArrayList<FilmeVO>();
		try {
			connection = DataBase.getConnection();

			Statement statement = connection.createStatement();
			StringBuffer query = new StringBuffer();
			query.append(" SELECT r.Locacao_idLocacao, f.NomeF, f.sinopseF, f.idFilmes, c.nomeC ")
			.append(" FROM rellocfilmes r INNER JOIN filmes f ")
			.append(" ON r.Filmes_idFilmes = f.idFilmes ")
			.append(" INNER JOIN locacao l ")
			.append(" ON r.Locacao_idLocacao = l.idLocacao ")
			.append(" INNER JOIN cliente c on l.Cliente_idCliente = c.idCliente ")
			.append(" WHERE r.Locacao_idLocacao= ")
			.append(idLocacao);
		 	
			
			boolean resultado = statement.execute(query.toString());
			ResultSet resultSet = statement.getResultSet();
			while (resultSet.next()) {
				FilmeVO filmeVO = new FilmeVO();
				String nomeF = resultSet.getString("nomeF");
				String sinopseF = resultSet.getString("sinopseF");
				Integer idFilmes = resultSet.getInt("idFilmes");
				filmeVO.setNomeF(nomeF);
				filmeVO.setSinopseF(sinopseF);
				filmeVO.setIdFilmes(idFilmes);
				filmes.add(filmeVO);

			}

			resultSet.close();
			connection.close();
			statement.close();
		} catch (Exception ex) {
			System.out.println("erro ao executar o metodo listarFilmes");
		}
		System.out.println("metodo listarFilmes executado");
		return filmes;

	}
	
	public static void cadastro(String nomeF, String sinopseF, Integer quantidadeF) throws ClassNotFoundException, SQLException {
		Connection connection = DataBase.getConnection();
		try {
			connection = DataBase.getConnection();
			PreparedStatement stmt = connection.prepareStatement("INSERT INTO filmes (nomeF, sinopseF, quantidadeF) VALUES (?, ?, ?)");
			stmt.setObject(1, nomeF);
			stmt.setObject(2, sinopseF);
			stmt.setObject(3, quantidadeF);
			stmt.execute();
			stmt.close();
			
		}catch (Exception e) {
			System.out.println("erro ao executar o metodo cadastro");
		}
		
	}
	
	

	public static void delete(String idFilmes) throws ClassNotFoundException, SQLException {
		Connection connection = DataBase.getConnection();
		try {
			connection = DataBase.getConnection();
			PreparedStatement stmt = connection.prepareStatement("DELETE FROM filmes WHERE idFilmes=?");
			stmt.setString(1, idFilmes);
			stmt.execute();
			stmt.close();
		} catch (Exception e) {
			System.out.println("Erro ao executar o metodo delete");

		}
		connection.close();

	}

	public static FilmeVO iniciaAlterar(String idFilmes) throws SQLException, ClassNotFoundException {

		Connection connection = DataBase.getConnection();

		List<FilmeVO> filme = new ArrayList<FilmeVO>();

		try {
			String sql = "SELECT * FROM filmes WHERE idFilmes = ?";
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, String.valueOf(idFilmes));
			stmt.execute();
			ResultSet resultSet = stmt.getResultSet();
			while (resultSet.next()) {
				FilmeVO filmeVO = new FilmeVO();
				String nomeF = resultSet.getString("NomeF");
				String sinopseF = resultSet.getString("SinopseF");
				Integer idFilmes1 = resultSet.getInt("idFilmes");
				Integer quantidadeF = resultSet.getInt("quantidadeF");

				filmeVO.setNomeF(nomeF);
				filmeVO.setSinopseF(sinopseF);
				filmeVO.setQuantidadeF(quantidadeF);
				filmeVO.setIdFilmes(idFilmes1);
				filme.add(filmeVO);

			}
			
			stmt.close();
			connection.close();
			resultSet.close();

		} catch (Exception e) {
			System.out.println("erro ao executar o metodo iniciaAlterar");
		}
		return filme.get(0);
	}

	public static void alterarFilmes(Integer idFilmes, String nomeF, String sinopseF, Integer quantidadeF)
			throws ClassNotFoundException, SQLException {
		Connection connection = DataBase.getConnection();

		try {
			String sql = "UPDATE filmes set nomeF=?, sinopseF=?, quantidadeF=? where idFilmes=?";
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setObject(1, nomeF);
			stmt.setObject(2, sinopseF);
			stmt.setObject(3, quantidadeF);
			stmt.setObject(4, idFilmes);
			stmt.execute();
			stmt.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

}
