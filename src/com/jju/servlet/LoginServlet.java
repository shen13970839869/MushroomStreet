package com.jju.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jju.bean.User;
import com.jju.dao.UserDao;
import com.jju.factory.DAOFactory;


public class LoginServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public LoginServlet() {
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
		String uname = request.getParameter("username");
		String passwd = request.getParameter("password");
		/* PrintWriter out=response.getWriter();*/
		System.out.println(uname+"=="+passwd);
		User user = null;
		String path = "/MushroomStreet/jsp/individuals/login.jsp";
		String message="";
		 PrintWriter out=response.getWriter();
		try {
			UserDao dao = DAOFactory.getUserServiceInstance();
			user = dao.queryByName(uname);
		/*	if (user.getUname()==null) {
				 out.print("{\"result\":\"false\"}");
				 out.close();
			} else if(user.getUname().equals(uname)&user.getUpassword().equals(passwd)){
				out.print("{\"result\":\"true\"}");
				 out.close();
			} else {
				 out.print("{\"result\":\"faile\"}");
				 out.close();
				
			}*/
			if(uname!=""&passwd!="") {
				if (user.getUname()==null) {
					 out.print("{\"result\":\"fault\"}");
					 out.close();
				} else if(user.getUname().equals(uname)&user.getUpassword().equals(passwd)){
					out.print("{\"result\":\"true\"}");
					request.setAttribute("uname", uname);
					request.getSession().setAttribute("uname", uname);
					 out.close();
				} else {
					 out.print("{\"result\":\"faile\"}");
					 out.close();
					
				}
			}else {
				 out.print("{\"result\":\"false\"}");
				 out.close();
			}
			
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
