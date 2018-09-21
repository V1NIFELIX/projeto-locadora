package br.com.locadora.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.bcel.classfile.ArrayElementValue;

import br.com.locadora.DAO.ClienteDAO;
import br.com.locadora.DAO.FilmeDAO;
import br.com.locadora.DAO.LocacaoDAO;
import br.com.locadora.VO.ClienteVO;
import br.com.locadora.VO.FilmeVO;
import br.com.locadora.VO.LocacaoVO;

@WebServlet(urlPatterns = "/locacao")
public class LocacaoController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String acao = req.getParameter("acao");

		if ("inicioLocacao".equals(acao)) {
			
			listaLocacao(req, resp);
		}
		if ("inicioAlterar".equals(acao)) {
			
			inicioAlterar(req, resp);
		}
		if ("inicioCadastro".equals(acao)) {
			
			inicioCadastro(req, resp);
			
		}
		if ("cadastro".equals(acao)) {
			cadastro(req, resp);
		}
		if ("populaCombosLocacao".equals(acao)) {
			populaCombosLocacao(req, resp);
		}
		if ("alterarLocacao".equals(acao)) {
			
			alterarLocacao(req, resp);	
			
		}
		if("exibirFilmesLocacao".equals(acao)) {
			listarFilmesLocacao(req, resp);
			
		}
		if("FinalizarLocacao".equals(acao)) {
			try {
				FinalizarLocacao(req, resp);
			} catch (ClassNotFoundException | SQLException e) {
				
				e.printStackTrace();
			}
		}
		

	}

	
	
	public void listarFilmesLocacao(HttpServletRequest req, HttpServletResponse resp) {

		String idLocacao = req.getParameter("idLocacao");
		
		List<FilmeVO> listaLocacaoFilmes = new FilmeDAO().listarFilmesLocacao(idLocacao);
		
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/pages/listarFilmesLocacao.jsp");

		req.setAttribute("listaLocacaoFilmes", listaLocacaoFilmes);

		try {
			dispatcher.forward(req, resp);
		} catch (ServletException e) {

			e.printStackTrace();
		} catch (IOException e) {

			e.printStackTrace();
		}

	}
	
	
	
	public void listaLocacao(HttpServletRequest req, HttpServletResponse resp) {

		LocacaoDAO locacaoDAO = new LocacaoDAO();

		List<LocacaoVO> listaLocacao = locacaoDAO.listarLocacao();

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/pages/locacao.jsp");

		req.setAttribute("listaLocacao", listaLocacao);

		try {
			dispatcher.forward(req, resp);
		} catch (ServletException e) {

			e.printStackTrace();
		} catch (IOException e) {

			e.printStackTrace();
		}

	}
	
	
	
	
	
	public void populaCombosLocacao(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		ClienteDAO clienteDAO = new ClienteDAO();
		List<ClienteVO> listaClientesLocacao = clienteDAO.listarCliente();
		req.setAttribute("listaClientesLocacao", listaClientesLocacao);	
		
		FilmeDAO filmeDAO = new FilmeDAO();
		List<FilmeVO> listaFilmesDisponiveis = filmeDAO.listarFilmes(true);
		req.setAttribute("listaFilmesDisponiveis", listaFilmesDisponiveis);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/pages/cadastroLocacao.jsp");
		dispatcher.forward(req, resp);
	}
	
	
	
	
	private void inicioCadastro(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/pages/cadastroLocacao.jsp");
		dispatcher.forward(req, resp);

	}
	
	private void cadastro(HttpServletRequest req, HttpServletResponse resp) {
		try {
			ArrayList<Integer> idFilmes = new ArrayList<Integer>();

			String[] idFilmes1 = req.getParameterValues("idFilmes");

			int[] idFilmes2 = new int[idFilmes1.length];
			for (int i = 0; i < idFilmes1.length; i++) {

				idFilmes2[i] = Integer.parseInt(idFilmes1[i]);
				
				idFilmes.add(idFilmes2[i]);

			}
			
				
			
			
			
			String idCliente1 = req.getParameter("idCliente");
			Integer idCliente = Integer.parseInt(idCliente1);
			
			String dataDeLocacao1 = req.getParameter("dataDeLocacao");
			DateFormat df = new SimpleDateFormat("dd-MM-yyyy");				
			Date dataDeLocacao = new Date(df.parse(dataDeLocacao1).getTime());
			
			
			String dataDeVencimento1 = req.getParameter("dataDeVencimento");
			DateFormat df1 = new SimpleDateFormat("yyyy-MM-dd");				
			Date dataDeVencimento = new Date(df.parse(dataDeVencimento1).getTime());
			
			String valorBase1 = req.getParameter("valorBase");
			double valorBase = Double.parseDouble(valorBase1);
			
			
			LocacaoDAO locacaoDAO = new LocacaoDAO();
			locacaoDAO.cadastro(idFilmes, idCliente, dataDeLocacao, dataDeVencimento, valorBase);
			
			LocacaoVO locacaoVO = new LocacaoVO();
/*GAMB*/	FilmeVO filmeVO = new FilmeVO();
			
			
			
			locacaoVO.getCliente().setIdCliente(idCliente);
/*GAMB*/	filmeVO.setIdFilmes(idFilmes);
			locacaoVO.setDataDeLocacao(dataDeLocacao);
			locacaoVO.setDataDeVencimento(dataDeVencimento);			
			locacaoVO.setValorBase(valorBase);
			
			
			
			
		}catch (Exception e) {
			System.out.println("ERRO ao executar o metodo cadastro");
		}
		listaLocacao(req, resp);
	}
	
	
	private void inicioLocacao(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/pages/locacao.jsp");
		dispatcher.forward(req, resp);

	}

	private void inicioAlterar(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String idLocacao = req.getParameter("idLocacao");
			LocacaoVO locacaoAlterar = LocacaoDAO.iniciaAlterar(idLocacao);

			req.setAttribute("locacaoAlterar", locacaoAlterar);
			
			FilmeDAO filmeDAO = new FilmeDAO();
			List<FilmeVO> listaFilmesDisponiveis = filmeDAO.listarFilmes(true);
			req.setAttribute("listaFilmesDisponiveis", listaFilmesDisponiveis);

			RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/pages/alterarLocacao.jsp");
			dispatcher.forward(req, resp);

		} catch (Exception e) {

		}

	}
	
	
	public void alterarLocacao(HttpServletRequest req, HttpServletResponse resp) {
		try {			
			
			String idLocacao1 = req.getParameter("idLocacao");
			Integer idLocacao = Integer.parseInt(idLocacao1);
			
			String idFilmes1 = req.getParameter("idFilmes");
			Integer idFilmes = Integer.parseInt(idFilmes1);
			
			String dataDeLocacao1 = req.getParameter("dataDeLocacao");
			DateFormat df1 = new SimpleDateFormat("dd-MM-yyyy");				
			Date dataDeLocacao = new Date(df1.parse(dataDeLocacao1).getTime());
			
			String dataDeVencimento1 = req.getParameter("dataDeVencimento");
			DateFormat df2 = new SimpleDateFormat("dd-MM-yyyy");
			Date dataDeVencimento = new Date(df2.parse(dataDeVencimento1).getTime());
			
			String dataDeDevolucao1 = req.getParameter("dataDeDevolucao");
			DateFormat df = new SimpleDateFormat("dd-MM-yyyy");				
			Date dataDeDevolucao = new Date(df.parse(dataDeDevolucao1).getTime());			
			
			String valor1 = req.getParameter("valorBase");
			double valorBase = Double.parseDouble(valor1);
			
			String valorReal1 = req.getParameter("valorReal");
			double valorReal = Double.parseDouble(valorReal1);
			
			LocacaoDAO locacaoDAO = new LocacaoDAO();
			locacaoDAO.Alterarlocacao(idLocacao, dataDeLocacao, dataDeDevolucao, dataDeVencimento, valorBase, valorReal, idFilmes);

			LocacaoVO locacaoVO = new LocacaoVO();
			locacaoVO.setDataDeLocacao(dataDeLocacao);
			locacaoVO.setDataDeDevolucao(dataDeDevolucao);
			locacaoVO.setDataDeVencimento(dataDeVencimento);
			locacaoVO.setValorBase(valorBase);
			locacaoVO.setValorReal(valorReal);

		} catch (Exception e) {
			System.out.println("erro ao executar o metodo alterar");
		}
		
		listaLocacao(req, resp);
	}
	
	public void FinalizarLocacao (HttpServletRequest req, HttpServletResponse resp) throws ClassNotFoundException, SQLException {
		try {
			String idLocacao1 = req.getParameter("idLocacao");
			Integer idLocacao = Integer.parseInt(idLocacao1);
			
			
			
			LocacaoDAO locacaoDAO = new LocacaoDAO();
			locacaoDAO.finalizarFilmes(idLocacao);
			
			LocacaoVO locacaoVO = new LocacaoVO();
			FilmeVO filmeVO = new FilmeVO();
			
			locacaoVO.setIdLocacao(idLocacao);
			
			
		}catch (Exception e) {
			System.out.println("Erro ao executar metodo FinalizarLocacao");
		}
		listaLocacao(req, resp);
	
	}
	
	
	
}