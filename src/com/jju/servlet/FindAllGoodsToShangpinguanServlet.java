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
import com.jju.bean.GoodView;
import com.jju.bean.User;
import com.jju.dao.FindAllDao;
import com.jju.dao.UserDao;
import com.jju.factory.DAOFactory;


public class FindAllGoodsToShangpinguanServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public FindAllGoodsToShangpinguanServlet() {
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
		// TODO Auto-generated method stub
				//response.getWriter().append("Served at: ").append(request.getContextPath());
				 String method= request.getParameter("method");
				 response.setContentType("text/html");
					FindAllDao dao = null;
				if("select".equals(method)) {
					try {
						dao = DAOFactory.getFindAllServiceInstance();
						//1.调用service查询所有
				        List<GoodView> cs = dao.findAllGoodViewByGid();
				        int recordCount=cs.size();//获取所要显示数据的全部条数
						int param=recordCount/5+1;//计算需要展示的总页数
						 int page=1;
						   if (request.getParameter("page")==null){
							   cs=dao.turnPages(1,5);
				            }else {
				               page= Integer.parseInt(request.getParameter("page"));
				                 cs=dao.turnPages(page,5);
				            }
						request.setAttribute("recordCount",recordCount);
						request.setAttribute("pages",param);
						request.setAttribute("currentPage",page);
				        request.setAttribute("list", cs);
				        request.getRequestDispatcher("/jsp/admin/good/shangpinguan.jsp").forward(request, response);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
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
