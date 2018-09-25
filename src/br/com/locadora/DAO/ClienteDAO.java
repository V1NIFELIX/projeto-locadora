package br.com.locadora.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.concurrent.SynchronousQueue;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.fabric.xmlrpc.base.Data;

import br.com.locadora.DataBase;
import br.com.locadora.VO.ClienteVO;
import br.com.locadora.controller.ClienteController;

public class ClienteDAO {

	public List<ClienteVO> listarCliente() {

		Connection connection;
		List<ClienteVO> cliente = new ArrayList<ClienteVO>();
		try {
			connection = DataBase.getConnection();

			Statement statement = connection.createStatement();
			boolean resultado = statement.execute("select * from cliente");
			ResultSet resultSet = statement.getResultSet();
			while (resultSet.next()) {
				ClienteVO clienteVO = new ClienteVO();
				String nomeC = resultSet.getString("NomeC");
				String emailC = resultSet.getString("EmailC");
				String senhasC = resultSet.getString("SenhaC");
				String dataNascC1 = resultSet.getString("DataNascC");
				DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
				Date dataNascC = new Date(df.parse(dataNascC1).getTime());
				String endC = resultSet.getString("EndC");
				String cpfC = resultSet.getString("CpfC");
				String cep = resultSet.getString("cep");
				String numero = resultSet.getString("numeroCasa");
				String cidade = resultSet.getString("cidade");
				String estado = resultSet.getString("estado");
				String bairro = resultSet.getString("bairro");
				Integer telefone = resultSet.getInt("telefone");
				Integer telefone1 = resultSet.getInt("telefone1");
				Integer idCliente = resultSet.getInt("idCliente");

				clienteVO.setNomeC(nomeC);
				clienteVO.setCpfC(cpfC);
				clienteVO.setDataNascC(dataNascC);
				clienteVO.setEmailC(emailC);
				clienteVO.setEndC(endC);
				clienteVO.setIdCliente(idCliente);
				clienteVO.setSenhaC(senhasC);
				clienteVO.setCep(cep);
				clienteVO.setNumero(numero);
				clienteVO.setCidade(cidade);
				clienteVO.setEstado(estado);
				clienteVO.setBairro(bairro);
				clienteVO.setTelefone(telefone);
				clienteVO.setTelefone1(telefone1);
				cliente.add(clienteVO);
			}
			statement.close();
			connection.close();
			resultSet.close();

		} catch (Exception e) {
			System.out.println("erro ao executar Metodo ListarCliente");
		}
		System.out.println("Metodo ListarCliente executado");
		return cliente;

	}

	public static void cadastro(String nomeC, String cpfC, Date dataNascC, String senhaC, String emailC, String endC,
			String cep, String bairro, String cidade, String estado, String numero, Integer telefone, Integer telefone1)
			throws ClassNotFoundException, SQLException {
		Connection connection = DataBase.getConnection();
		try {
			connection = DataBase.getConnection();
			PreparedStatement stmt = connection.prepareStatement(
					"INSERT INTO cliente (nomeC, cpfC, dataNascC, senhaC, emailC, endC, cep, bairro, cidade, estado, numeroCasa, telefone, telefone1) VALUES (?, ?, ?, ?, ?, ?,?,?,?,?,?,?,?)");
			stmt.setObject(1, nomeC);
			stmt.setObject(2, cpfC);
			stmt.setObject(3, dataNascC);
			stmt.setObject(4, senhaC);
			stmt.setObject(5, emailC);
			stmt.setString(6, endC);
			stmt.setObject(7, cep);
			stmt.setObject(8, bairro);
			stmt.setObject(9, cidade);
			stmt.setObject(10, estado);
			stmt.setObject(11, numero);
			stmt.setObject(12, telefone);
			stmt.setObject(13, telefone1);
			stmt.execute();
			stmt.close();

		} catch (Exception e) {
			System.out.println("erro ao executar o metodo cadastro");
		}

	}

	public static void delete(String idCliente) throws ClassNotFoundException, SQLException {

		Connection connection = DataBase.getConnection();

		try {
			connection = DataBase.getConnection();
			PreparedStatement stmt = connection.prepareStatement("DELETE FROM cliente WHERE idCliente = ?");
			stmt.setString(1, String.valueOf(idCliente));
			stmt.execute();
			stmt.close();

		} catch (Exception e) {
			System.out.println("erro ao executar o metodo 'delete'");
		}

		connection.close();

	}

	public static void alterarCliente(Integer idCliente, String nomeC, String emailC, String cpfC, String senhaC,
			String endC, Date dataNascC, Integer telefone, Integer telefone1, String cep, String bairro, String cidade,
			String estado, String numero) throws ClassNotFoundException, SQLException {

		Connection connection = DataBase.getConnection();
		try {
			String sql = "UPDATE cliente set nomeC=?, emailC=?, cpfC=?, senhaC=?, endC=?, dataNascC=?, telefone=?, telefone1=?, cep=?, bairro=?, cidade=?, estado=?, numeroCasa=? where idCliente=?";
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setObject(1, nomeC);
			stmt.setObject(2, emailC);
			stmt.setObject(3, cpfC);
			stmt.setObject(4, senhaC);
			stmt.setObject(5, endC);
			stmt.setObject(6, dataNascC);
			stmt.setObject(7, telefone);
			stmt.setObject(8, telefone1);
			stmt.setObject(9, cep);
			stmt.setObject(10, bairro);
			stmt.setObject(11, cidade);
			stmt.setObject(12, estado);
			stmt.setObject(13, numero);
			stmt.setString(14, String.valueOf(idCliente));
			stmt.execute();
			stmt.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

	}

	public static ClienteVO iniciaAlterar(String idCliente) throws SQLException, ClassNotFoundException {

		Connection connection = DataBase.getConnection();

		List<ClienteVO> cliente = new ArrayList<ClienteVO>();

		try {
			String sql = "SELECT * FROM cliente WHERE idCliente = ?";
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, String.valueOf(idCliente));
			stmt.execute();
			ResultSet resultSet = stmt.getResultSet();
			while (resultSet.next()) {
				ClienteVO clienteVO = new ClienteVO();
				String nomeC = resultSet.getString("NomeC");
				String emailC = resultSet.getString("EmailC");
				String senhaC = resultSet.getString("SenhaC");
				String dataNascC1 = resultSet.getString("dataNascC");
				DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
				Date dataNascC = new Date(df.parse(dataNascC1).getTime());
				String cep = resultSet.getString("cep");
				String numero = resultSet.getString("numeroCasa");
				String cidade = resultSet.getString("cidade");
				String estado = resultSet.getString("estado");
				String bairro = resultSet.getString("bairro");
				Integer telefone = resultSet.getInt("telefone");
				Integer telefone1 = resultSet.getInt("telefone1");
				String endC = resultSet.getString("EndC");
				String cpfC = resultSet.getString("CpfC");
				Integer idCliente1 = resultSet.getInt("idCliente");

				clienteVO.setNomeC(nomeC);
				clienteVO.setEmailC(emailC);
				clienteVO.setSenhaC(senhaC);
				clienteVO.setDataNascC(dataNascC);
				clienteVO.setEndC(endC);
				clienteVO.setCpfC(cpfC);
				clienteVO.setIdCliente(idCliente1);
				clienteVO.setCep(cep);
				clienteVO.setNumero(numero);
				clienteVO.setCidade(cidade);
				clienteVO.setEstado(estado);
				clienteVO.setBairro(bairro);
				clienteVO.setTelefone(telefone);
				clienteVO.setTelefone1(telefone1);
				cliente.add(clienteVO);

			}
			stmt.close();
			connection.close();
			resultSet.close();

		} catch (Exception e) {
			System.out.println("erro ao executar o metodo iniciaAlterar");
		}
		return cliente.get(0);
	}
}
