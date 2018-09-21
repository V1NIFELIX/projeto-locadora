package br.com.locadora.DAO;

import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Field;

import br.com.locadora.DataBase;
import br.com.locadora.VO.FilmeVO;
import br.com.locadora.VO.LocacaoVO;
import br.com.locadora.controller.LocacaoController;

public class LocacaoDAO {

	public List<LocacaoVO> listarLocacao() {

		Connection connection;
		List<LocacaoVO> locacao = new ArrayList<LocacaoVO>();
		try {
			connection = DataBase.getConnection();

			Statement statement = connection.createStatement();

			StringBuffer query = new StringBuffer();
			query.append(" SELECT * FROM locacao loc ")
					.append(" INNER JOIN rellocfilmes rel ON rel.idRelLocFilmes = loc.Cliente_idCliente ")
					.append(" INNER JOIN cliente c ON c.idCliente = loc.Cliente_idCliente ")
					.append(" WHERE situacao >0 ");
			boolean resultado = statement.execute(query.toString());
			ResultSet resultSet = statement.getResultSet();
			while (resultSet.next()) {
				LocacaoVO locacaoVO = new LocacaoVO();

				locacaoVO.setDataDeLocacao(resultSet.getDate("dataDeLocacao"));
				locacaoVO.setDataDeDevolucao(resultSet.getDate("dataDeDevolucao"));
				locacaoVO.setDataDeVencimento(resultSet.getDate("DataDeVencimento"));
				locacaoVO.setValorReal(resultSet.getLong("valorReal"));
				locacaoVO.setValorBase(resultSet.getDouble("valorBase"));
				locacaoVO.setSituacao(resultSet.getBoolean("situacao"));
				locacaoVO.setIdLocacao(Integer.parseInt(resultSet.getString("idLocacao")));
				locacaoVO.getCliente().setNomeC(resultSet.getString("nomeC"));
				locacaoVO.getCliente().setCpfC(resultSet.getString("cpfC"));
				locacaoVO.getCliente().setIdCliente(resultSet.getInt("Cliente_idCliente"));
				locacao.add(locacaoVO);

			}
			statement.close();
			connection.close();
			resultSet.close();

		} catch (Exception e) {
			System.out.println("erro ao executar Metodo ListarCliente");
		}
		System.out.println("Metodo ListarCliente executado");
		return locacao;

	}

	public static LocacaoVO iniciaAlterar(String idLocacao) throws SQLException, ClassNotFoundException {

		Connection connection = DataBase.getConnection();

		List<LocacaoVO> locacaoAlterar = new ArrayList<LocacaoVO>();

		try {
			String sql = "SELECT * FROM locacao l INNER JOIN rellocfilmes r ON l.Cliente_idCliente = r.idRelLocFilmes "
					+ " INNER JOIN filmes f ON r.idRelLocFilmes = f.idFilmes INNER JOIN cliente c ON c.idCliente = r.idRelLocFilmes  WHERE idLocacao = ?";
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, String.valueOf(idLocacao));
			stmt.execute();
			ResultSet resultSet = stmt.getResultSet();
			while (resultSet.next()) {

				LocacaoVO locacaoVO = new LocacaoVO();

				Date dataDeLocacao = resultSet.getDate("dataDeLocacao");
				Date dataDeVencimento = resultSet.getDate("dataDeVencimento");
				Date dataDeDevolucao = resultSet.getDate("dataDeDevolucao");

				String nomeF = resultSet.getString("nomeF");

				String valorBase1 = resultSet.getString("valorBase");
				double valorBase = Double.parseDouble(valorBase1);

				String valorReal1 = resultSet.getString("valorReal");
				double valorReal = Double.parseDouble(valorReal1);

				boolean situacao = resultSet.getBoolean("situacao");
				String idLocacao2 = resultSet.getString("idLocacao");
				Integer idLocacao1 = Integer.parseInt(idLocacao2);
				String nomeC = resultSet.getString("nomeC");
				String cpfC = resultSet.getString("cpfC");

				locacaoVO.setNomeF(nomeF);
				locacaoVO.getCliente().setNomeC(nomeC);
				locacaoVO.getCliente().setCpfC(cpfC);
				locacaoVO.setDataDeLocacao(dataDeLocacao);
				locacaoVO.setDataDeDevolucao(dataDeDevolucao);
				locacaoVO.setValorBase(valorBase);
				locacaoVO.setValorReal(valorReal);
				locacaoVO.setSituacao(situacao);
				locacaoVO.setIdLocacao(idLocacao1);
				locacaoVO.setDataDeVencimento(dataDeVencimento);
				locacaoAlterar.add(locacaoVO);

			}
			stmt.close();
			connection.close();
			resultSet.close();

		} catch (Exception e) {
			System.out.println("erro ao executar o metodo iniciaAlterar");
		}
		return locacaoAlterar.get(0);
	}

	public static void Alterarlocacao(Integer idLocacao, Date dataDeLocacao, Date dataDeDevolucao,
			Date dataDeVencimento, double valorBase, double valorReal, Integer idFilmes)
			throws ClassNotFoundException, SQLException {

		Connection connection = DataBase.getConnection();
		try {
			String sql = " UPDATE locacao set dataDeLocacao=?, dataDeDevolucao=?, dataDeVencimento=?, valorBase=?, valorReal=?  WHERE idLocacao=? ";

			PreparedStatement stmt = connection.prepareStatement(sql);

			stmt.setObject(1, dataDeLocacao);
			stmt.setObject(2, dataDeDevolucao);
			stmt.setObject(3, dataDeVencimento);
			stmt.setObject(4, valorBase);
			stmt.setObject(5, valorReal);
			stmt.setString(6, String.valueOf(idLocacao));
			stmt.execute();
			stmt.close();
			AlterarlocacaoFilmes(idFilmes, idLocacao);

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

	}

	public static void AlterarlocacaoFilmes(Integer idFilmes, Integer idLocacao)
			throws ClassNotFoundException, SQLException {
		Connection connection = DataBase.getConnection();
		try {
			String sql = " UPDATE rellocfilmes set Filmes_idFilmes=?, Locacao_idLocacao=? WHERE idRelLocFilmes=1 ";

			PreparedStatement stmt = connection.prepareStatement(sql);

			stmt.setObject(1, idFilmes);
			stmt.setObject(2, idLocacao);
			stmt.execute();
			stmt.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);

		}

	}

	public static void cadastro(ArrayList<Integer> idFilmes, Integer idCliente, Date dataDeLocacao,
			Date dataDeVencimento, double valorBase) throws ClassNotFoundException, SQLException {
		Connection connection = DataBase.getConnection();
		try {
			connection = DataBase.getConnection();
			String sql = " INSERT INTO locacao (Cliente_idCliente, dataDeLocacao, dataDeVencimento, valorBase, valorReal, Situacao) VALUES (?,?,?,?,0,1)";
			PreparedStatement stmt = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			stmt.setObject(1, idCliente);
			stmt.setObject(2, dataDeLocacao);
			stmt.setObject(3, dataDeVencimento);
			stmt.setObject(4, valorBase);
			stmt.execute();
			ResultSet rs = stmt.getGeneratedKeys();
			if (rs.next()) {
				Integer idLocacao = rs.getInt(1);
				cadastro1(idFilmes, idLocacao);
			}
			stmt.close();
			cadastroRemoverQuantidadeFilmes(idFilmes);
		} catch (Exception e) {
			System.out.println("ERRO ao executar metodo cadastro");
		}
	}

	public static void cadastroRemoverQuantidadeFilmes(List<Integer> idFilmes)
			throws ClassNotFoundException, SQLException {
		Connection connection = DataBase.getConnection();
		try {
			for (int i = 0; i < idFilmes.size(); i++) {
				connection = DataBase.getConnection();
				String sql = " UPDATE filmes SET quantidadeF = quantidadeF- 1 WHERE idFilmes=? ";
				PreparedStatement stmt = connection.prepareStatement(sql);
				stmt.setObject(1, idFilmes.get(i));
				stmt.execute();
				stmt.close();
			}
		} catch (Exception e) {
			System.out.println("ERRO ao executar o metodo cadastroRemoveQuantidadeFilmes");
		}
	}

	public static void cadastro1(List<Integer> idFilmes, Integer idLocacao)
			throws ClassNotFoundException, SQLException {
		Connection connection = DataBase.getConnection();
		try {
			for (int i = 0; i < idFilmes.size(); i++) {
				connection = DataBase.getConnection();
				PreparedStatement stmt = connection.prepareStatement(
						" INSERT INTO rellocfilmes (Filmes_idFilmes, Locacao_idLocacao) VALUES (?,?)");
				stmt.setObject(1, idFilmes.get(i));
				stmt.setObject(2, idLocacao);
				stmt.execute();
				stmt.close();
			}
		} catch (Exception e) {
			System.out.println("ERRO AO EXECUTAR CADASTRO1");
		}

	}

	public static void finalizarFilmes(Integer idLocacao) throws ClassNotFoundException, SQLException {
		Connection connection = DataBase.getConnection();
		//ArrayList<Integer> idFilmes = new ArrayList<Integer>();	
		try {
		
			connection = DataBase.getConnection();
			Statement statement = connection.createStatement();

			StringBuffer query = new StringBuffer();
			query.append(" SELECT idLocacao, Locacao_idLocacao, idFilmes ")
					.append(" FROM rellocfilmes r INNER JOIN locacao l ON r.Locacao_idLocacao = l.idLocacao  ")
					.append(" INNER JOIN filmes f ON r.Filmes_idFilmes = f.idFilmes ")
					.append(" WHERE r.Locacao_idlocacao= ").append(idLocacao);
			boolean resultado = statement.execute(query.toString());
			ResultSet resultSet = statement.getResultSet();
				while(resultSet.next()) {					
					int idFilmes = resultSet.getInt("idFilmes");
					
						
						
						finalizarLocacao(idFilmes, idLocacao);
					}
	
			statement.close();

		} catch (Exception e) {
			System.out.println("ERRO ao executar o metodo finalizarFilmes");
		}

	}

	public static void finalizarLocacao(Integer idFilmes, Integer idLocacao) 
			throws ClassNotFoundException, SQLException {
		Connection connection = DataBase.getConnection();
		try {
			
				connection = DataBase.getConnection();
				String sql = " UPDATE filmes SET quantidadeF = quantidadeF+ 1 WHERE idFilmes=?  ";
				PreparedStatement stmt = connection.prepareStatement(sql);
				stmt.setObject(1, idFilmes);
				stmt.execute();
				finalizarSituacao(idLocacao);
				stmt.close();

			
		}catch (Exception e) {
			System.out.println("erro ao executar o metodo finalizar locacao");
		}
	}

	

	public static void finalizarSituacao(Integer idLocacao) throws ClassNotFoundException, SQLException {
		Connection connection = DataBase.getConnection();
		try {
			connection = DataBase.getConnection();
			String sql1 = " UPDATE locacao set Situacao = Situacao -1 WHERE idLocacao=? ";
			PreparedStatement stmt = connection.prepareStatement(sql1);
			stmt.setObject(1, idLocacao);
			stmt.execute();
			stmt.close();

		} catch (Exception e) {
			System.out.println("erro ao executar metodo finalizarSituacao");
		}

	}

}
