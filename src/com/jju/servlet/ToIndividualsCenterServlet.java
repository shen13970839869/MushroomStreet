package com.jju.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jju.bean.User;
import com.jju.dao.UserDao;
import com.jju.db.DBConnection;
import com.jju.factory.DAOFactory;

@WebServlet("/ToIndividualsCenterServlet")
public class ToIndividualsCenterServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public ToIndividualsCenterServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		String uname = (String) request.getSession().getAttribute("uname");
		try {
			UserDao dao = DAOFactory.getUserServiceInstance();
			User user = dao.queryByName(uname);
			request.setAttribute("user", user);
			request.setAttribute("msg", "");
			request.setCharacterEncoding("utf-8");
			request.getRequestDispatcher("/jsp/individuals/information.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * Initialization of the servlet. <br>
	 * 
	 * @throws ServletException
	 *             if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
