package br.com.locadora.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.locadora.DAO.ClienteDAO;
import br.com.locadora.DAO.FilmeDAO;
import br.com.locadora.VO.FilmeVO;

@WebServlet(urlPatterns = "/filmes")
public class FilmeController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String acao = req.getParameter("acao");

		if ("listarFilmes".equals(acao)) {
			listarFilmes(req, resp);

		}
		if ("iniciaAlterar".equals(acao)) {
			inciaAlterar(req, resp);
		}
		if ("alterar".equals(acao)) {
			try{
				alterarFilme(req, resp);
			}catch (Exception e) {
				
			}

		}
		if ("delete".equals(acao)) {
			delete(req, resp);

		}
		if ("cadastro".equals(acao)) {
			cadastroFilme(req, resp);
		}
		if ("inicioCadastro".equals(acao)) {
			inicioCadastro(req, resp);
		}
	
	}
	
	
	private void cadastroFilme(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			String nomeF = req.getParameter("nomeF");
			String sinopseF = req.getParameter("sinopseF");
			String quantidadeF1 = req.getParameter("quantidadeF");
			Integer quantidadeF = Integer.parseInt(quantidadeF1);
			
			FilmeDAO filmeDAO = new FilmeDAO();
			
			filmeDAO.cadastro(nomeF, sinopseF, quantidadeF);

			FilmeVO filmeVO = new FilmeVO();
			filmeVO.setNomeF(nomeF);
			filmeVO.setSinopseF(sinopseF);
			filmeVO.setQuantidadeF(quantidadeF);
		
			

		} catch (ClassNotFoundException | SQLException e) {

			e.printStackTrace();
		}
		listarFilmes(req, resp);
	}
	
	
	private void inicioCadastro(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/pages/cadastroFilme.jsp");
		dispatcher.forward(req, resp);
	}
	
	
	
	public void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String idFilmes = req.getParameter("idFilmes");
			FilmeDAO.delete(idFilmes);

		} catch (Exception e) {
			System.out.println("Erro ao executar o metodo delete");
		}
		listarFilmes(req, resp);
	}

	public void alterarFilme(HttpServletRequest req, HttpServletResponse resp)
			throws ClassNotFoundException, ServletException, IOException {
		try {

			Integer idFilmes = Integer.parseInt(req.getParameter("idFilme"));
			String nomeF = req.getParameter("nomeF");
			String sinopseF = req.getParameter("sinopseF");
			Integer quantidadeF = Integer.parseInt(req.getParameter("quantidadeF"));

			FilmeDAO filmeDAO = new FilmeDAO();
			filmeDAO.alterarFilmes(idFilmes, nomeF, sinopseF, quantidadeF);

			FilmeVO filmeVO = new FilmeVO();
			filmeVO.setNomeF(nomeF);
			filmeVO.setQuantidadeF(quantidadeF);
			filmeVO.setSinopseF(sinopseF);
			filmeVO.setIdFilmes(idFilmes);

		} catch (Exception e) {
			System.out.println("Erro ao executar metodo alterarFilme");
		}
		listarFilmes(req, resp);
	}

	private void listarFilmes(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		FilmeDAO filmeDAO = new FilmeDAO();

		List<FilmeVO> listaFilmes = filmeDAO.listarFilmes(false);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/pages/filmes.jsp");

		req.setAttribute("listaFilmes", listaFilmes);

		dispatcher.forward(req, resp);

	}
	
	

	private void inciaAlterar(HttpServletRequest req, HttpServletResponse resp) {
		try {
			String idFilmes = req.getParameter("idFilmes");
			FilmeVO filmeTela = FilmeDAO.iniciaAlterar(idFilmes);

			req.setAttribute("filmeTela", filmeTela);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/pages/alterarFilme.jsp");
			dispatcher.forward(req, resp);

		} catch (Exception e) {
			System.out.println("Erro ao executar o metodo 'IniciaAlterar'");

		}

	}

}
