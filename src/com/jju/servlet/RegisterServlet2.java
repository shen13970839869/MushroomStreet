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
import com.jju.factory.DAOFactory;

/**
 * Servlet implementation class RegisterServlet2
 */
public class RegisterServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        
        PrintWriter out = response.getWriter();   //µ¯³ö¶ÔÏó
		String uname = request.getParameter("Rusername");
		String password = request.getParameter("Rpassword");
		String email = request.getParameter("email");
		System.out.println("RegisterServlet2-"+uname+"=="+password+"=="+email);
		User user = null;
		try {
			UserDao dao = DAOFactory.getUserServiceInstance();
			user = dao.queryByName(uname);
			if(uname!=""&uname.length()>6&uname.length()<20) {
				if(user.getUname()==null) {
					System.out.println(222);
					out.print("{\"result\":\"true\"}");
					 out.close();
					// response.sendRedirect("/jsp/login.jsp");
				}else if(user.getUname().equals(uname)) {
					System.out.println(333);
					out.print("{\"result\":\"faile\"}");
					 out.close();
				}
			}else {
				System.out.println(111);
				out.print("{\"result\":\"false\"}");
				 out.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}

}
