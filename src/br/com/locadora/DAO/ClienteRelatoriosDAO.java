package br.com.locadora.DAO;

import java.awt.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.apache.jasper.tagplugins.jstl.core.Catch;

import br.com.locadora.DataBase;
import br.com.locadora.VO.ClienteVO;

public class ClienteRelatoriosDAO {

	public ArrayList<ClienteVO> listarRelatorioCliente() {

		Connection connection;
		ArrayList<ClienteVO> cliente = new ArrayList<ClienteVO>();
		try {
			connection = DataBase.getConnection();

			PreparedStatement stmt = connection
					.prepareStatement("select nomeC, cpfC, telefone, telefone1, endC, numeroCasa from cliente");
			stmt.execute();
			ResultSet resultSet = stmt.getResultSet();
			while (resultSet.next()) {
				ClienteVO clienteVO = new ClienteVO();
				String nomeC = resultSet.getString("nomeC");
				String cpfC = resultSet.getString("cpfC");
				String endC = resultSet.getString("endC");
				String numero = resultSet.getString("numeroCasa");
				Integer telefone = resultSet.getInt("telefone");
				Integer telefone1 = resultSet.getInt("telefone1");

				clienteVO.setNomeC(nomeC);
				clienteVO.setCpfC(cpfC);
				clienteVO.setEndC(endC);
				clienteVO.setNumero(numero);
				clienteVO.setTelefone(telefone);
				clienteVO.setTelefone1(telefone1);
				cliente.add(clienteVO);

			}
			stmt.close();
			resultSet.close();
			stmt.close();
		} catch (Exception e) {
			System.out.println("erro ao executar o metodo listarRelatorioCliente");
		}
		return cliente;

	}
}
