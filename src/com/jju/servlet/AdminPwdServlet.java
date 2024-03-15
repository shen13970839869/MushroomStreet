package com.jju.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jju.bean.Admin;
import com.jju.dao.AdminPwdDao;
import com.jju.factory.DAOFactory;

/**
 * Servlet implementation class AdminPwdServlet
 */
@WebServlet("/AdminPwdServlet")
public class AdminPwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminPwdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("text/html");
		 request.setCharacterEncoding("UTF-8");
	      String method= request.getParameter("method");
	      if ("select".equals(method)){
	            request.getRequestDispatcher("jsp/admin/user/pwdmodify.jsp").forward(request,response);
	    	  //response.sendRedirect("jsp/admin/pwdmodify.jsp");
	        }else if ("selectPwd".equals(method)) {
	        	 PrintWriter out=response.getWriter();
	             String user2 = request.getParameter("oldpassword");
	             System.out.println(user2);
	         	try {
					AdminPwdDao dao = DAOFactory.getAdminPwdServiceInstance();
					Admin admin=dao.queryByName( user2);
					System.out.println(admin.getUname());
					 if(admin.getUname()!=null){
						 out.print("{\"result\":\"true\"}");
		                   System.out.println("æ…√‹¬Î’˝»∑");
			            }else {
			            	out.print("{\"result\":\"false\"}");
		                    System.out.println("æ…√‹¬Î¥ÌŒÛ");
			            }
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	            
			}else if ("update".equals(method)) {
				 String userPassword = request.getParameter("newpassword");
		            Admin admin=new Admin();
		            admin.setUpassword(userPassword);
		            AdminPwdDao dao;
					try {
						dao = DAOFactory.getAdminPwdServiceInstance();
						 Boolean u=dao.modifyAllDate( admin);		
						 System.out.println(u);					 
				            if (u==true) {
				                //request.getRequestDispatcher("jsp/admin/login.jsp").forward(request, response);
				             response.sendRedirect("jsp/admin/login.jsp");
				            }else{
				                System.out.println("–ﬁ∏ƒ ß∞‹");
				               // response.sendRedirect("jsp/admin/pwdmodify.jsp");
				            }
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
			}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
