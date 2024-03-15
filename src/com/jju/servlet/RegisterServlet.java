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


public class RegisterServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public RegisterServlet() {
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
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        
        PrintWriter out = response.getWriter();   //µ¯³ö¶ÔÏó
		String path="/jsp/individuals/login.jsp";
		String uname = request.getParameter("Rusername");
		String password = request.getParameter("Rpassword");
		String email = request.getParameter("email");
		String Rpassword2=request.getParameter("Rpassword2");
		System.out.println("RegisterServlet-"+uname+"=="+password+"=="+email+"=="+Rpassword2);
		User user = null;
		try {
			UserDao dao = DAOFactory.getUserServiceInstance();
			//user = dao.queryByName(uname);
			if(uname!=""&password!=""&email!=""&Rpassword2!="") {
				System.out.println(111);
				user = dao.queryByName(uname);
				if (user.getUname()==null &&password.equals(Rpassword2)) {
					System.out.println(113);
					int result = dao.register(uname, password, email);
				//	request.setAttribute("uname", uname);
					out.print("{\"result\":\"true\"}");
					 out.close();
				}else {
					out.print("{\"result\":\"false\"}");
					 out.close();
				}
			}else {
				System.out.println(112);
				out.print("{\"result\":\"faile\"}");
				 out.close();
			}
				
				
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	/*	if (!"".equals(message)) {
			request.setAttribute("msg1", message);
			request.setAttribute("msg", "");
		}
		
		request.getRequestDispatcher(path).forward(request, response);*/
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
