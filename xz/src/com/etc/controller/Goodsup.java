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
    
	
	//�洢�����ݵ�����
	
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
		   // ����Ƿ�Ϊ��ý���ϴ�
	    //�õ�һ��	DiskFileItemFactory��������
		List list=new ArrayList();
	    DiskFileItemFactory factory=new DiskFileItemFactory();
	    
	    //�õ�һ���ļ��ϴ��������ʱ�ļ�
	    ServletContext servletContext =this.getServletConfig().getServletContext();
	    
	    File repository=(File) servletContext.getAttribute("javax.servlet.context.tempdir");
	    
	    factory.setRepository(repository);
	    
	    //�ļ��ϴ�����
	    ServletFileUpload upload=new ServletFileUpload(factory);
	    
	    try {
	    	//����request(��)���� //һ����Ԫ�أ��������ı����ı����ļ���ɶ��
			List<FileItem> items=upload.parseRequest(request);
			//����������
		Iterator<FileItem> iter	=items.iterator();
			
		while(iter.hasNext()) {
			FileItem item=iter.next();
			
			//isFormField()�жϱ�Ԫ��Ϊ���򣨷��ļ��ϴ����֣�
			if(item.isFormField()) {
				String name=item.getFieldName();
				String value=item.getString();
				String valuee=new String(value.getBytes("iso8859-1"),"utf-8");
				
				String list1=valuee;
				list.add(list1);
			}else {
				//�����ļ��ϴ�����
				String filedname=item.getFieldName();
				String filename=item.getName();//�ļ���
				
				
				int i=(int)(Math.ceil((Math.random()*1000)));
				
				String filenamee=i+filename;
				
				
				
				String contenType=item.getContentType();
				boolean ismo=item.isInMemory();
				long sizefile=item.getSize();//�ļ���С
				
				//д�Լ����Եľ���·�� �� �������벿����ķè���رջ����
				String path=request.getRealPath("/goodsimg/"+filenamee);
				
				//��Ĺ����ռ�·��
				//String path="E:\\javaee\\web\\textfile\\WebContent\\img\\"+filename;
				String list1="http://192.168.9.224:8080/xz/goodsimg/"+filenamee;
				list.add(list1);
				
				//����һ��File����
				File uploadeFile=new File(path);
				try {
					//�ļ����Ԫ��д�뵽File·��
					item.write(uploadeFile);
					
					
					//���ļ����Ƶ������ռ�
				   //�����ռ�	E:\javaee\web\.metadata\.plugins\org.eclipse.wst.server.core\tmp1\wtpwebapps\textfile\img\
					//��ķè����·��
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
		//��ӡһ���ű���ȥ����Ӻ���ܹ��ĵ���
		response.setCharacterEncoding("gbk");
		response.getWriter().println("<script>alert('��ӳɹ�');location.href='accountgoodsup.jsp'</script>");
		
		
		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
