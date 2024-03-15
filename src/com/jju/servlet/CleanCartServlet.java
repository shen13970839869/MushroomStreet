package com.jju.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.jju.bean.Category;
import com.jju.bean.Good;
import com.jju.bean.User;
import com.jju.dao.FindAllDao;
import com.jju.dao.ShoppingDao;
import com.jju.dao.UserDao;
import com.jju.factory.DAOFactory;


public class CleanCartServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public CleanCartServlet() {
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
		System.out.println("CleanCartServlet--------------------------------"); 
		String uname = (String) request.getSession().getAttribute("uname");
		String trueName = request.getParameter("trueName");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		int cid=0;
		try {
			ShoppingDao dao = DAOFactory.getShoppingServiceInstance();
			List<String> str = dao.selectGidByUname(uname);
			for(int i=0;i<str.size();i++) {
//				System.out.println(str.get(i));
				String[]  Str = str.get(i).split("\\+");     //+为特殊字符    使用需要转义
//				System.out.println(Str[0]+"==="+Str[1]);
				int result = dao.addGoodToOrder(uname, Integer.parseInt(Str[0]), Integer.parseInt(Str[1]),trueName,address,phone);
				int[] Counts = dao.cleanCart(uname, Integer.parseInt(Str[0]), Integer.parseInt(Str[1]));
				System.out.println(result);
			}
			ObjectMapper mapper = new ObjectMapper();
			response.setContentType("application/json;charset=utf-8");
	        mapper.writeValue(response.getOutputStream(),"");
//			request.getRequestDispatcher("jsp/individuals/success.jsp").forward(request, response);
		} catch (Exception e) {
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
