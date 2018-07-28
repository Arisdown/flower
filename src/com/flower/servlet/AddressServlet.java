package com.flower.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.connector.Request;
import org.apache.commons.beanutils.BeanUtils;

import com.flower.domain.Address;
import com.flower.domain.UserInfo;
import com.flower.service.AddressService;
import com.flower.service.impl.AddressServiceImpl;
import com.flower.utils.UUIDUtils;
import com.mchange.v2.beans.BeansUtils;

@WebServlet("/AddressServlet")
public class AddressServlet extends HttpServlet{
            private static final long serialVersionUID = 1L;
	private AddressService addressService=new AddressServiceImpl();

	@Override
            protected void doGet(HttpServletRequest request,
                                    HttpServletResponse response)
                                    throws ServletException, IOException {
	          doPost(request, response);
            }

	@Override
            protected void doPost(HttpServletRequest request,
                                    HttpServletResponse response)
                                    throws ServletException, IOException {
	           request.setCharacterEncoding("utf-8");
	           response.setContentType("text/html;charset=utf-8");
	           UserInfo  userInfo=(UserInfo)request.getSession().getAttribute("user");
	           System.out.println(userInfo);
	           String uid=userInfo.getUserId();
	          //判断该用户地址详情是否已经存在，如果存在执行更新，否则增加
	           Address address=addressService.getAddressInfo(uid);
	           if(address!=null){
			try {
				update(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
	           }else{
			try {
				insert(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
	           }
	   
	      
            }
	public void insert(HttpServletRequest request,
                                    HttpServletResponse response) throws Exception{
		Address address=new Address();
	           address.setAid(UUIDUtils.getId());
	           UserInfo  userInfo=(UserInfo)request.getSession().getAttribute("user");
	           address.setUid(userInfo.getUserId());
	           BeanUtils.populate(address, request.getParameterMap());
	           int count=addressService.addAddressInfo(address);
	           if(count>0){
		           request.setAttribute("error", "保存成功");
			request.getRequestDispatcher("action=getMyInfo") .forward(request,response);
	           }else{
		           request.setAttribute("error", "保存失败");
			request.getRequestDispatcher("UserServlet?action=getMyInfo") .forward(request,response);
	           }
	}
	public void update(HttpServletRequest request,
                                    HttpServletResponse response) throws Exception{
//		String country=request.getParameter("country");
//		String province=request.getParameter("province");
//		String city=request.getParameter("city");
//		String address=request.getParameter("address");
//		String telephone=request.getParameter("telephone");
//		String phone=request.getParameter("phone");
		//封装数据
		Address addressInfo=new Address();
	            UserInfo  userInfo=(UserInfo)request.getSession().getAttribute("user");
	            addressInfo.setUid(userInfo.getUserId());
	            BeanUtils.populate(addressInfo, request.getParameterMap());
	           int count=addressService.updateAddressInfo(addressInfo);
	           //提示更新结果
	           if(count>0){
		           request.setAttribute("msg", "更新收获地址成功");

			//response.sendRedirect(request.getContextPath()+"/msg.jsp");
		           request.getRequestDispatcher("msg.jsp").forward(request, response);
	           }else{
		           request.setAttribute("msg", "更新失败");
		           request.getRequestDispatcher("msg.jsp").forward(request, response);
	           }
		
		
	}
	
	

}
