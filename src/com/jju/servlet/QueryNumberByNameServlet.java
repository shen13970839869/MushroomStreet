package com.jju.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.jju.bean.User;
import com.jju.dao.ShoppingDao;
import com.jju.dao.UserDao;
import com.jju.factory.DAOFactory;


public class QueryNumberByNameServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public QueryNumberByNameServlet() {
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
		String uname = (String) request.getSession().getAttribute("uname");
//		if(uname!=null) {
			try {
				ShoppingDao dao = DAOFactory.getShoppingServiceInstance();
				int number = dao.selectCountByName(uname);
				System.out.println("QueryNumberByNameServlet-查询购物车记录成功==");
				ObjectMapper mapper = new ObjectMapper();
		        response.setContentType("application/json;charset=utf-8");
		        mapper.writeValue(response.getOutputStream(),number);
			} catch (Exception e) {
				e.printStackTrace();
			}
//		}else {
//			String path = "/html/login.jsp";
//			ObjectMapper mapper = new ObjectMapper();
//	        response.setContentType("application/json;charset=utf-8");
//	        mapper.writeValue(response.getOutputStream(),path);
//			response.sendRedirect("ToLoginServlet");
//		}
		
		
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
