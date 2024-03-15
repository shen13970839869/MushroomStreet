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
import com.jju.bean.User;
import com.jju.dao.ShoppingDao;
import com.jju.dao.UserDao;
import com.jju.db.DBConnection;
import com.jju.factory.DAOFactory;

@WebServlet("/ModifyUserPwdServlet")
public class ModifyUserPwdServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public ModifyUserPwdServlet() {
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
		PrintWriter out=response.getWriter();
		String oldPwd = request.getParameter("oldPwd");
		String newPwd = request.getParameter("newPwd");
		String uname = (String)request.getSession().getAttribute("uname");
		System.out.println("ModifyUserPwdServlet-oldPwd"+oldPwd+"-");
		try {
			UserDao dao = DAOFactory.getUserServiceInstance();
			User user = dao.queryByName(uname);
			request.setAttribute("user", user);
			if(oldPwd.equals(user.getUpassword())) {
				int row = dao.updatePwd(newPwd, uname);
				if(row==1) {
					request.getRequestDispatcher("/ToLoginServlet").forward(request, response);
				}else {
					request.setAttribute("msg", "≥ı º√‹¬Î ß∞‹");
					request.getRequestDispatcher("/jsp/individuals/information.jsp").forward(request, response);
				}
			}else {
				request.setAttribute("msg", "≥ı º√‹¬Î¥ÌŒÛ£¨«Î÷ÿ–¬ ‰»Î");
				request.getRequestDispatcher("/jsp/individuals/information.jsp").forward(request, response);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
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
