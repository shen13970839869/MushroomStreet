package com.jju.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jju.bean.Admin;
import com.jju.bean.User;
import com.jju.dao.AdminDao;
import com.jju.dao.UserDao;
import com.jju.factory.DAOFactory;


public class AdminLoginServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public AdminLoginServlet() {
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
		Admin admin = new Admin();
		String adminname = request.getParameter("userCode");
		String passwd = request.getParameter("userPassword");
		admin.setUname(adminname);
		admin.setUpassword(passwd);
		/* PrintWriter out=response.getWriter();*/
		System.out.println(adminname+"=="+passwd);
//		String path = "/MushroomStreet/jsp/individuals/login.jsp";
		try {
			AdminDao dao = DAOFactory.getAdminServiceInstance();
			if(adminname!=""&passwd!="") {
				int row = dao.adminLogin(admin);
				if(row!=0) {
					request.getSession().setAttribute("admin", adminname);
					request.setAttribute("admin", adminname);
					request.getRequestDispatcher("jsp/admin/frame.jsp").forward(request, response);
				}else {
					response.sendRedirect("jsp/admin/login.jsp");
				}
			}else {
				response.sendRedirect("jsp/admin/login.jsp");
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
