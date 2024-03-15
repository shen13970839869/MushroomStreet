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


public class ShoppingCartServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public ShoppingCartServlet() {
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
		ObjectMapper mapper = new ObjectMapper();
		int result=-1;
		String uname = (String) request.getSession().getAttribute("uname");
		System.out.println("ShoppingCartServlet-uname="+uname);
		if(uname!=null) {
			int gid = Integer.parseInt(request.getParameter("gid")) ;
			int number = Integer.parseInt(request.getParameter("number")) ;
			try {
				ShoppingDao dao = DAOFactory.getShoppingServiceInstance();
				int row = dao.selectByGid(gid, uname);    //返回number
				System.out.println("ShoppingCartServlet-number="+number);
				if(row==0) {
					System.out.println("addGoodToCart1(gid, uname,number)");
					 result = dao.addGoodToCart1(gid, uname,number);
				}else {
					System.out.println("addGoodToCart(gid, uname, number)");
					 result = dao.addGoodToCart(gid, uname, number);
				}
				
				//System.out.println("ShoppingCartServlet-添加购物车成功==");
				//response.sendRedirect("/MushroomStreet/jsp/individuals/shopping.jsp");
				
		        response.setContentType("application/json;charset=utf-8");
		        mapper.writeValue(response.getOutputStream(),"");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
//			response.sendRedirect("/MushroomStreet/ToLoginServlet");
			String path = "/html/login.jsp";
	        response.setContentType("application/json;charset=utf-8");
	        mapper.writeValue(response.getOutputStream(),path);
//			response.sendRedirect("ToLoginServlet");
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
