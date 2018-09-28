package br.com.locadora.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.locadora.DAO.ClienteRelatoriosDAO;
import br.com.locadora.VO.ClienteVO;

@WebServlet(urlPatterns = "/index")
public class IndexController extends HttpServlet {
	
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String acao = req.getParameter("acao");
		
		if("relatorioCliente".equals(acao)){
			relatoriosClientes(req, resp);
		}
	}

	
	
public void relatoriosClientes(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		
		ClienteRelatoriosDAO clienteRelatoriosDAO = new ClienteRelatoriosDAO();
		ArrayList<ClienteVO> listaRelatorio = clienteRelatoriosDAO.listarRelatorioCliente();
		RequestDispatcher dispatcher = req.getRequestDispatcher("index.jsp");
		req.setAttribute("listaRelatorio", listaRelatorio);
		dispatcher.forward(req, resp);
		
		
	}
	
}
