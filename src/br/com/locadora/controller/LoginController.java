package br.com.locadora.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialException;

import br.com.locadora.DAO.LoginDAO;
import br.com.locadora.VO.LoginVO;

@WebServlet(urlPatterns = "/login")
public class LoginController extends HttpServlet {
	
	
	
	
	
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String acao = req.getParameter("acao");

		if ("login".equals(acao)) {
			try {
				loginController(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
	

	}

	protected void loginController(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException, ClassNotFoundException, SQLException {
		try {
			PrintWriter printw = resp.getWriter();
			String email = req.getParameter("email");
			Integer senha = Integer.parseInt(req.getParameter("senha"));

			LoginDAO loginDAO = new LoginDAO();

			if (loginDAO.BuscarPorEmailESenha(email, senha) == false || (email) == null) {
				printw.println("<html><body>Usuário ou senha inválida</body></html>");

			} else {
				HttpSession session = req.getSession();
				session.setAttribute("usuario.logado", email);
				RequestDispatcher dispatcher = req.getRequestDispatcher("WEB-INF/pages/index.jsp");
				dispatcher.forward(req, resp);
			}

		} catch (Exception e) {

		}

	}

}
