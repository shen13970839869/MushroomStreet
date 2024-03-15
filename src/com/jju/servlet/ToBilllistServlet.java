package com.jju.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jju.bean.Middle;
import com.jju.dao.ShoppingDao;
import com.jju.factory.DAOFactory;

/**
 * Servlet implementation class ToBilllistServlet
 */
@WebServlet("/ToBilllistServlet")
public class ToBilllistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ToBilllistServlet() {
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
		 String method= request.getParameter("method");
		 if("select".equals(method)) {
			 try {
					ShoppingDao dao = DAOFactory.getShoppingServiceInstance();
					List<Middle> str = dao.selectAllOrder();
					  int recordCount=str.size();//获取所要显示数据的全部条数
						int param=recordCount/5+1;//计算需要展示的总页数
						 int page=1;
						 if (request.getParameter("page")==null){
							   str=dao.turnPages(1,5);
				           }else {
				               page= Integer.parseInt(request.getParameter("page"));
				                 str=dao.turnPages(page,5);
				            }
							   request.setAttribute("currentPage",page);
							request.setAttribute("recordCount",recordCount);
							request.setAttribute("pages",param);
					request.setAttribute("list", str);
					request.getRequestDispatcher("/jsp/admin/good/billlist.jsp").forward(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
		 }else if("modify".equals(method)) {
			 PrintWriter out=response.getWriter();
				int oid = Integer.parseInt(request.getParameter("billid"));
				try {
					ShoppingDao dao = DAOFactory.getShoppingServiceInstance();
					int row = dao.UpdateStatusByOid(oid);
					if(row==1) {
						out.print("{\"delResult\":\"true\"}");	
						System.out.println("删除成功");
					}else {
						out.print("{\"delResult\":\"false\"}");
						System.out.println("删除失败");
					}
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		 }else if ("delete".equals(method)) {
			int oid = Integer.parseInt(request.getParameter("billid"));
			try {
				ShoppingDao dao = DAOFactory.getShoppingServiceInstance();
				int result=dao.DeleteOrderByOid(oid) ;
				if (result==1) {
					System.out.println("成功");
					//response.sendRedirect("jsp/admin/billlist.jsp");
					 request.getRequestDispatcher("ToBilllistServlet?method=select&&name=${admin}").forward(request,response);
				}else {
					System.out.println("失败");
					
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println(111111);
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
