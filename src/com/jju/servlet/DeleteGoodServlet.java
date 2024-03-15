package com.jju.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.jws.WebService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.jju.bean.Good;
import com.jju.bean.User;
import com.jju.dao.FindAllDao;
import com.jju.dao.ShoppingDao;
import com.jju.dao.UserDao;
import com.jju.db.DBConnection;
import com.jju.factory.DAOFactory;

@WebServlet("/DeleteGoodServlet")
public class DeleteGoodServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public DeleteGoodServlet() {
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
		String delResult = "";
		PrintWriter out=response.getWriter();
		String method = request.getParameter("method");
		int gid = Integer.parseInt(request.getParameter("goodId"));
		ShoppingDao dao;
		try {
			dao = DAOFactory.getShoppingServiceInstance();
			if(method.equals("delprovider")) {
				System.out.println("gid-"+gid);
				int row = dao.DeleteGoodByGid(gid);
				System.out.println("DeleteGoodServlet-"+row);
				if(row==1) {
					out.print("{\"delResult\":\"true\"}");
					System.out.println("DeleteOrderByOidServlet-É¾³ýÉÌÆ·×´Ì¬³É¹¦");
				}else {
					out.print("{\"delResult\":\"false\"}");
					System.out.println("DeleteOrderByOidServlet-É¾³ýÉÌÆ·×´Ì¬Ê§°Ü");
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
			//String path = "/html/login.jsp";
//			ObjectMapper mapper = new ObjectMapper();
//	        response.setContentType("application/json;charset=utf-8");
//	        mapper.writeValue(response.getOutputStream(),path);
//			response.sendRedirect("ToLoginServlet");
		
		
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
