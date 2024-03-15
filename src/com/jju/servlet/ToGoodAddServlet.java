package com.jju.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jju.bean.Category;
import com.jju.bean.Type;
import com.jju.dao.FindAllDao;
import com.jju.factory.DAOFactory;

/**
 * Servlet implementation class ToBilllistServlet
 */
@WebServlet("/ToGoodAddServlet")
public class ToGoodAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ToGoodAddServlet() {
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
		String gid= request.getParameter("goodId");
		try {
			FindAllDao dao = DAOFactory.getFindAllServiceInstance();
			List<Category> list1 = dao.findAll();
			List<Type> list2 = dao.findAllType();
			request.setAttribute("list1", list1);
			request.setAttribute("list2", list2);
			request.getRequestDispatcher("/jsp/admin/good/shoppingadd.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
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
