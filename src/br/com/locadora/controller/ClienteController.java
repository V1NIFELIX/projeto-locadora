package br.com.locadora.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.locadora.DAO.ClienteDAO;
import br.com.locadora.VO.ClienteVO;

@WebServlet(urlPatterns = "/cliente")
public class ClienteController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String acao = req.getParameter("acao");

		if ("delete".equals(acao)) {
			delete(req, resp);

		}
		if ("listar".equals(acao)) {
			listarClientes(req, resp);

		}
		if ("iniciarAlterar".equals(acao)) {
			iniciaAlterar(req, resp);

		}
		if ("alterar".equals(acao)) {
			alterar(req, resp);

		}
		if ("inicioCadastro".equals(acao)) {
			inicioCadastro(req, resp);
		}
		if ("cadastro".equals(acao)) {
			try {
				cadastro(req, resp);
			} catch (ParseException e) {

				e.printStackTrace();
			}
		}
		if ("logout".equals(acao)) {
			logoutController(req, resp);

		}

	}

	protected void logoutController(HttpServletRequest req, HttpServletResponse resp) throws IOException {

		req.getSession().removeAttribute("usuario.logado");
		resp.sendRedirect("http://localhost:8080/projeto-locadora/");

	}

	private void cadastro(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException, ParseException {

		try {

			String nomeC = req.getParameter("nomeC");
			String cpfC = req.getParameter("cpfC");
			String dataNascC1 = req.getParameter("dataNascC");
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");			
			int telefone = Integer.parseInt(req.getParameter("telefone"));
			int telefone1 = Integer.parseInt(req.getParameter("telefone1"));			
			Date dataNascC = new Date(df.parse(dataNascC1).getTime());
			String senhaC = req.getParameter("senhaC");
			String emailC = req.getParameter("emailC");			
			
			String cep = req.getParameter("cep");
			String bairro = req.getParameter("bairro");
			String cidade = req.getParameter("cidade");
			String estado = req.getParameter("estado");
			String numero = req.getParameter("numero");			
			String endC = req.getParameter("endC");
			
			ClienteDAO clienteDAO = new ClienteDAO();
			clienteDAO.cadastro(nomeC, cpfC, dataNascC, senhaC, emailC, endC, cep, bairro, cidade, estado, numero, telefone, telefone1);
			ClienteVO clienteVO = new ClienteVO();
			clienteVO.setNomeC(nomeC);
			clienteVO.setCpfC(cpfC);
			clienteVO.setDataNascC(dataNascC);
			clienteVO.setSenhaC(senhaC);
			clienteVO.setEmailC(emailC);
			clienteVO.setEndC(endC);
			clienteVO.setCep(cep);
			clienteVO.setBairro(bairro);
			clienteVO.setCidade(cidade);
			clienteVO.setEstado(estado);
			clienteVO.setNumero(numero);
			clienteVO.setTelefone(telefone);
			clienteVO.setTelefone1(telefone1);

		} catch (ClassNotFoundException | SQLException e) {

			e.printStackTrace();
		}
		listarClientes(req, resp);
	}

	private void inicioCadastro(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/pages/cadastroCliente.jsp");
		dispatcher.forward(req, resp);
	}

	public void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			String idCliente = req.getParameter("idCliente");
			ClienteDAO.delete(idCliente);

		} catch (ClassNotFoundException | SQLException e) {
			System.out.println("ocorreu um erro ao executar o metodo delete");
		}
		listarClientes(req, resp);

	}

	public void iniciaAlterar(HttpServletRequest req, HttpServletResponse resp) {
		try {

			String idCliente = req.getParameter("idCliente");
			ClienteVO clienteTela = ClienteDAO.iniciaAlterar(idCliente);
			req.setAttribute("clienteTela", clienteTela);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/pages/alterar.jsp");
			dispatcher.forward(req, resp);

		} catch (Exception e) {

			System.out.println("deu ruim no metodo do Controller");

		}
	}

	public void alterar(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			Integer idCliente = Integer.parseInt(req.getParameter("idCliente"));
			String nomeC = req.getParameter("nomeC");
			String emailC = req.getParameter("emailC");
			String cpfC = req.getParameter("cpfC");
			String senhaC = req.getParameter("senhaC");
			String endC = req.getParameter("endC");
			String dataNascC1 = req.getParameter("dataNascC");
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Integer telefone = Integer.parseInt(req.getParameter("telefone"));
			Integer telefone1 = Integer.parseInt(req.getParameter("telefone1"));
			String cep = req.getParameter("cep");
			String bairro = req.getParameter("bairro");
			String cidade = req.getParameter("cidade");
			String estado = req.getParameter("estado");
			String numero = req.getParameter("numeroCasa");
			
			
			
			Date dataNascC = new Date(df.parse(dataNascC1).getTime());
			ClienteDAO clienteDAO = new ClienteDAO();
			clienteDAO.alterarCliente(idCliente, nomeC, emailC, cpfC, senhaC, endC, dataNascC, telefone, telefone1, cep, bairro, cidade, estado, numero);
			ClienteVO clienteVO = new ClienteVO();
			clienteVO.setNomeC(nomeC);
			clienteVO.setEmailC(emailC);
			clienteVO.setCpfC(cpfC);
			clienteVO.setSenhaC(senhaC);
			clienteVO.setEndC(endC);
			clienteVO.setIdCliente(idCliente);
			clienteVO.setDataNascC(dataNascC);
			clienteVO.setCep(cep);
			clienteVO.setBairro(bairro);
			clienteVO.setCidade(cidade);
			clienteVO.setEstado(estado);
			clienteVO.setNumero(numero);
			clienteVO.setTelefone(telefone);
			clienteVO.setTelefone1(telefone1);

		} catch (Exception e) {
			System.out.println("erro ao executar o metodo alterar");

		}

		listarClientes(req, resp);

	}

	public void listarClientes(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		ClienteDAO clienteDAO = new ClienteDAO();
		List<ClienteVO> listaClientes = clienteDAO.listarCliente();
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/pages/cliente.jsp");
		req.setAttribute("listaClientes", listaClientes);
		dispatcher.forward(req, resp);
	}

}
