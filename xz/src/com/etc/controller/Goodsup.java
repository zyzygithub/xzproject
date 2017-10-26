package com.etc.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.etc.service.Goods_up_serives;

/**
 * Servlet implementation class Goodsup
 */
@WebServlet("/Goodsup")
public class Goodsup extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	
	//存储表单数据的数组
	
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
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		   // 检测是否为多媒体上传
	    //得到一个	DiskFileItemFactory工厂对象
		List list=new ArrayList();
	    DiskFileItemFactory factory=new DiskFileItemFactory();
	    
	    //得到一个文件上传处理的临时文件
	    ServletContext servletContext =this.getServletConfig().getServletContext();
	    
	    File repository=(File) servletContext.getAttribute("javax.servlet.context.tempdir");
	    
	    factory.setRepository(repository);
	    
	    //文件上传操作
	    ServletFileUpload upload=new ServletFileUpload(factory);
	    
	    try {
	    	//解析request(表单)对象 //一个表单元素，可能是文本框，文本域，文件与啥的
			List<FileItem> items=upload.parseRequest(request);
			//创建迭代器
		Iterator<FileItem> iter	=items.iterator();
			
		while(iter.hasNext()) {
			FileItem item=iter.next();
			
			//isFormField()判断表单元素为表单域（飞文件上传部分）
			if(item.isFormField()) {
				String name=item.getFieldName();
				String value=item.getString();
				String valuee=new String(value.getBytes("iso8859-1"),"utf-8");
				
				String list1=valuee;
				list.add(list1);
			}else {
				//处理文件上传部分
				String filedname=item.getFieldName();
				String filename=item.getName();//文件名
				
				
				int i=(int)(Math.ceil((Math.random()*1000)));
				
				String filenamee=i+filename;
				
				
				
				String contenType=item.getContentType();
				boolean ismo=item.isInMemory();
				long sizefile=item.getSize();//文件大小
				
				//写自己电脑的绝对路径 、 。。必须部署到汤姆猫，关闭会清除
				String path=request.getRealPath("/goodsimg/"+filenamee);
				
				//你的工作空间路径
				//String path="E:\\javaee\\web\\textfile\\WebContent\\img\\"+filename;
				String list1="http://192.168.9.224:8080/xz/goodsimg/"+filenamee;
				list.add(list1);
				
				//创建一个File对象
				File uploadeFile=new File(path);
				try {
					//文件与表单元素写入到File路径
					item.write(uploadeFile);
					
					
					//将文件复制到工作空间
				   //工作空间	E:\javaee\web\.metadata\.plugins\org.eclipse.wst.server.core\tmp1\wtpwebapps\textfile\img\
					//汤姆猫部署路径
					/*String src="E:/DesktopFile/Android/CSDN.jpg";  
			        String target="E:/DesktopFile/Android/test/CSDN.jpg";  
					*/
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
			}
		}
		
		
		
		String smalltype =(String) list.get(1);
		String goodsname =(String) list.get(2);
		int count =Integer.parseInt((String) list.get(3));
		int price =Integer.parseInt((String) list.get(4));
		int oldprice =Integer.parseInt((String) list.get(5));
		String remark =(String) list.get(6);
		String imgurl =(String) list.get(7);
		String username =(String) list.get(8);
		
		Goods_up_serives gus=new Goods_up_serives();
		boolean b=gus.addgoods(goodsname,smalltype,count,price,oldprice,remark,imgurl,username);
		
		/*request.setAttribute("tof",b);
		request.getRequestDispatcher("accountgoodsup.jsp").forward(request, response);
		*/
		//打印一个脚本过去，添加后才能够的弹窗
		response.setCharacterEncoding("gbk");
		response.getWriter().println("<script>alert('添加成功');location.href='accountgoodsup.jsp'</script>");
		
		
		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
