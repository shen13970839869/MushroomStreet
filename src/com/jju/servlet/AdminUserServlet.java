package com.jju.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jju.bean.User;
import com.jju.dao.AdminDao;
import com.jju.dao.UserDao;
import com.jju.factory.DAOFactory;

/**
 * Servlet implementation class AdminUserServlet
 */
@WebServlet("/AdminUserServlet")
public class AdminUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminUserServlet() {
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
	      if ("select".equals(method)) {
	    	  try {
				UserDao dao = DAOFactory.getUserServiceInstance();
				List<User> list=dao.selectAllDate();
				  request.setAttribute("user",list);
				  request.getRequestDispatcher("/jsp/admin/user/userlist.jsp").forward(request, response);//转发
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if ("delete".equals(method)) {
			System.out.println("进入成功");
			PrintWriter out=response.getWriter();
			 int uid= Integer.parseInt(request.getParameter("uid"));
			 try {
				UserDao dao=DAOFactory.getUserServiceInstance();
				 User u=dao.deleteAllDate(uid);
				 System.out.println(u);
				 if (u==null) {
					 out.print("{\"delResult\":\"true\"}");
		                System.out.println("成功");
		            }else{
		                System.out.println("失败");
		                out.print("{\"delResult\":\"false\"}");
		            }
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 
		}else if ("query".equals(method)) {
			System.out.println("进入查询成功");
			String name=request.getParameter("queryname");
			UserDao dao;
			try {
				dao = DAOFactory.getUserServiceInstance();
				User u=dao.queryByName(name);
				request.setAttribute("uid",u.getUid());
				request.setAttribute("uname",u.getUname());
				request.setAttribute("email",u.getEmail());
				System.out.println(u.getUid()+"+"+u.getUname()+"+"+u.getEmail());
				request.getRequestDispatcher("jsp/admin/user/userview.jsp").forward(request, response);
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
