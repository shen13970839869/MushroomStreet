package com.jju.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.Iterator;
import java.util.List;

import javax.jws.WebService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.coyote.Request;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.jju.bean.User;
import com.jju.dao.FindAllDao;
import com.jju.dao.ShoppingDao;
import com.jju.dao.UserDao;
import com.jju.db.DBConnection;
import com.jju.factory.DAOFactory;

@WebServlet("/AddShoppingServlet")
public class AddShoppingServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public AddShoppingServlet() {
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
		DiskFileItemFactory factory = new DiskFileItemFactory();//建立一个新的文件上传句柄
		//D:\eclipse-workspace\MushroomStreet\WebContent\src\img\goods
       
        ServletFileUpload upload = new ServletFileUpload(factory);// 用以上工厂实例化上传组件
        FindAllDao dao=null;
        int number=0;
        String file1="";
        String file2="";
        String file3="";
        String file4="";
        String goodName = null;
        int goodNumber = 0;
        double goodPrice =  0;
        int goodCategory = 0;
        int goodType = 0;
        List list = null;
		try {
			list = upload.parseRequest(request);
		} catch (FileUploadException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}//从request得到所有上传域的列表
		try {
			dao = DAOFactory.getFindAllServiceInstance();
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
        Iterator iter = list.iterator();// 得到所有上传的文件
        while (iter.hasNext()) {//循环处理所得到的的文件信息
            FileItem item = (FileItem)iter.next();
            File dir = null;//上传文件的存放位置
            dir=new File("D:/eclipse-workspace/MushroomStreet/WebContent/src/img/goods");
            factory.setRepository(dir);// 设置存放临时文件的目录
            if(item.isFormField()){			
            	if ("goodName".equals(item.getFieldName())) {
					//获取表单文本域数据
					String text;
					try {
						goodName = item.getString("utf-8");
						System.out.println(goodName);
						//System.out.println("goodName-"+goodName+"-goodNumber-"+goodNumber+"-goodPrice-"+goodPrice+"-goodCategory-"+goodCategory+"-goodType-"+goodType);
						//request.setAttribute("text", text);
					} catch (UnsupportedEncodingException e) {
						// TODO 自动生成的 catch 块
						e.printStackTrace();
					}
				}
            	if ("goodNumber".equals(item.getFieldName())) {
					//获取表单文本域数据
					String text;
					try {
						goodNumber = Integer.parseInt(item.getString("utf-8"));
						System.out.println(goodNumber);
						//System.out.println("goodName-"+goodName+"-goodNumber-"+goodNumber+"-goodPrice-"+goodPrice+"-goodCategory-"+goodCategory+"-goodType-"+goodType);
						//request.setAttribute("text", text);
					} catch (UnsupportedEncodingException e) {
						// TODO 自动生成的 catch 块
						e.printStackTrace();
					}
				}
            	if ("goodPrice".equals(item.getFieldName())) {
					//获取表单文本域数据
					String text;
					try {
						goodPrice = Double.parseDouble(item.getString("utf-8"));
						System.out.println(goodPrice);
						//System.out.println("goodName-"+goodName+"-goodNumber-"+goodNumber+"-goodPrice-"+goodPrice+"-goodCategory-"+goodCategory+"-goodType-"+goodType);
						//request.setAttribute("text", text);
					} catch (UnsupportedEncodingException e) {
						// TODO 自动生成的 catch 块
						e.printStackTrace();
					}
				}
            	if ("goodCategory".equals(item.getFieldName())) {
					//获取表单文本域数据
					String text;
					try {
						goodCategory = Integer.parseInt(item.getString("utf-8"));
						number = dao.queryNumberByCid(goodCategory)+1;
						
						System.out.println(dir.getName());
						
						System.out.println(goodCategory);
						//System.out.println("goodName-"+goodName+"-goodNumber-"+goodNumber+"-goodPrice-"+goodPrice+"-goodCategory-"+goodCategory+"-goodType-"+goodType);
						//request.setAttribute("text", text);
					} catch (UnsupportedEncodingException e) {
						// TODO 自动生成的 catch 块
						e.printStackTrace();
					}
				}
            	if ("goodType".equals(item.getFieldName())) {
					//获取表单文本域数据
					String text;
					try {
						goodType = Integer.parseInt(item.getString("utf-8"));
						System.out.println(goodType);
						//System.out.println("goodName-"+goodName+"-goodNumber-"+goodNumber+"-goodPrice-"+goodPrice+"-goodCategory-"+goodCategory+"-goodType-"+goodType);
						//request.setAttribute("text", text);
					} catch (UnsupportedEncodingException e) {
						// TODO 自动生成的 catch 块
						e.printStackTrace();
					}
				}
			}
			//处理文件
			else{
			   
	           String filedname = item.getFieldName();
	           String filename = item.getName();
	           if(filename=="" || filename==null) {
	        	   request.setAttribute("msg", "添加失败");
	        	   request.getRequestDispatcher("/jsp/admin/good/shoppingadd.jsp").forward(request, response);	
	           }
	           System.out.println(filename);
	           long size = item.getSize();
	           if ((filename == null || filename.equals("")) && size == 0) {
					continue;
				}
               if (filedname.equals("file1")) {
            	  String last = filename.substring(filename.length()-4);
            	  String name1 =  goodCategory+"_"+number+"_"+1;
            	  System.out.println(last);
	              System.out.println(name1);
	              //时间格式化格式
	              //SimpleDateFormat simpleDateFormat =new SimpleDateFormat("yyyyMMddHHmmssSSS");
	              //获取当前时间并作为时间戳
	              //String timeStamp=simpleDateFormat.format(new Date());
	              //拼接新的文件名
	              file1 =name1+last;/*timeStamp+/goodCategory+"_"+number+"/"+*/
	              System.out.println(file1);
                	request.setAttribute("file1", file1);
                  // session.setAttribute("file1", file1)
                  try {
					 item.write(new File(dir, file1));
				  } catch (Exception e) {
					// TODO 自动生成的 catch 块
					e.printStackTrace();
				  }
                  }
                if (filedname.equals("file2")) {
                  String last = filename.substring(filename.length()-4);
	              String name2 =  goodCategory+"_"+number+"_"+2;
	              //拼接新的文件名
	              file2 =name2+last;
	                   request.setAttribute("file2", file2);
	                try {
						item.write(new File(dir, file2));
					} catch (Exception e) {
						// TODO 自动生成的 catch 块
						e.printStackTrace();
					}
	             }
                if (filedname.equals("file3")) {
                	String last = filename.substring(filename.length()-4);
  	              String name3 =  goodCategory+"_"+number+"_"+3;
  	              //拼接新的文件名
  	              file3 =name3+last;
                          	request.setAttribute("file3", file3);
                          try {
      						item.write(new File(dir, file3));
      					} catch (Exception e) {
      						// TODO 自动生成的 catch 块
      						e.printStackTrace();
      					}
                  }
              if (filedname.equals("file4")) {
            	  String last = filename.substring(filename.length()-4);
	              String name4 =  goodCategory+"_"+number+"_"+4;
	              //拼接新的文件名
	              file4 =name4+last;
                 request.setAttribute("file4", file4);
                  try {
  					item.write(new File(dir, file4));
	  				} catch (Exception e) {
	  					// TODO 自动生成的 catch 块
	  					e.printStackTrace();
	  				}
               }
			}
        }
        String gphoto = "img/goods/"+file1+"&img/goods/"+file2+"&img/goods/"+file3+"&img/goods/"+file4;
        int row = dao.insertGood(goodName, goodNumber, gphoto, goodPrice, goodCategory, goodType);
        if(row==1) {
        	request.setAttribute("msg", "添加成功");
        }else {
        	request.setAttribute("msg", "添加失败");
        }
        request.getRequestDispatcher("/jsp/admin/good/shoppingadd.jsp").forward(request, response);	
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
