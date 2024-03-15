package com.jju.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jju.bean.Good;
import com.jju.bean.GoodView;
import com.jju.bean.Middle;
import com.jju.dao.FindAllDao;
import com.jju.dao.ShoppingDao;
import com.jju.factory.DAOFactory;

/**
 * Servlet implementation class ToBilllistServlet
 */
@WebServlet("/ToGoodViewServlet")
public class ToGoodViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ToGoodViewServlet() {
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
			GoodView good = dao.findGoodViewByGid(gid+"");
			request.setAttribute("good", good);
			request.getRequestDispatcher("/jsp/admin/good/goodView.jsp").forward(request, response);
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
