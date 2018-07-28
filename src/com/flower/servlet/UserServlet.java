package com.flower.servlet;

import java.io.IOException;






import java.util.Date;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.flower.domain.Address;
import com.flower.domain.UserInfo;
import com.flower.service.AddressService;
import com.flower.service.UserService;
import com.flower.service.impl.AddressServiceImpl;
import com.flower.service.impl.UserServiceImpl;
import com.flower.utils.MailUtils;
import com.flower.utils.UUIDUtils;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static UserService userService = new UserServiceImpl();
	private static AddressService addressService=new AddressServiceImpl();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request,
	 *      HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request,
	                        HttpServletResponse response)
	                        throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request,
	 *      HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request,
	                        HttpServletResponse response)
	                        throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String action=request.getParameter("action");
		System.out.println(action+"��ȡ��action��������");
		if(action.equals("login")){
			login(request, response);
		}else if(action.equals("addUserInfo")){
			try {
	                                    addUserInfo(request, response);
                                    } catch (AddressException e) {
	                               
	                                    e.printStackTrace();
                                    } catch (MessagingException e) {
	                                  
	                                    e.printStackTrace();
                                    }
		}else if(action.equals("updatePwdByUserId")){
			updatePwdByUserId(request, response);
		}else if(action.equals("logout")){
			logout(request, response);
		}else if(action.equals("editUser")){
			updateUserInfo(request, response);
		}else if(action.equals("getMyInfo")){
			UserInfo user=(UserInfo)request.getSession().getAttribute("user");
			if(user!=null){
			String userName=request.getParameter("username");
			//userName=new String(userName.getBytes("ISO-8859-1"),"UTF-8");
			UserInfo userInfo=userService.getUserInfoByuserName(userName);
			request.setAttribute("userinfo", userInfo);
			Address address=addressService.getAddressInfo(((UserInfo)request.getSession().getAttribute("user")).getUserId());
			request.getSession().setAttribute("address", address);
			request.getRequestDispatcher("userinfo.jsp") .forward(request,response);
			}else{
				request.setAttribute("msg", "����ǰ����¼ҳ���¼��������������˻���ϢŶ��");
				request.getRequestDispatcher("msg.jsp").forward(request, response);
			}
		}else if(action.equals("active")){
			try {
	                                    active(request, response);
                                    } catch (Exception e) {
	                                
	                                    e.printStackTrace();
                                    }
		}
	}

	public void login(HttpServletRequest request, HttpServletResponse response)
	                        throws ServletException, IOException {
		String userName = request.getParameter("username");
		String password = request.getParameter("password");
		String checkcode = request.getParameter("imagecode");
		System.out.println(checkcode);
		//��ȡrequest���е�����sRand����֤��
		String sRand = (String) request.getSession().getAttribute("sRand");
		System.out.print(sRand);
		if (checkcode.equals(sRand)) {
			UserInfo userInfo = userService .loginByUserNameAndPassword(userName,password);
			if (userInfo == null) {
				request.setAttribute("msg", "�û������벻ƥ��");
				request.getRequestDispatcher( "login.jsp").forward(request,response);
			} 
			if(userInfo!=null){
				if(userInfo.getState()==1){
				request.getSession() .setAttribute("user", userInfo);
				response.sendRedirect( "FlowerServlet?action=findByPage");
				}else{
					    request.setAttribute("msg", "�û�ע���ѳɹ�,��ȥ���伤��~~");
					       request.getRequestDispatcher( "msg.jsp").forward(request,response);
				}
			}
		} else {
			request.setAttribute("msg", "��֤�����");
			request.getRequestDispatcher("login.jsp") .forward(request,response);
		}

	}
	public void addUserInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, AddressException, MessagingException{
		String realName=request.getParameter("realname");
		String userName = request.getParameter("username");
		String password = request.getParameter("password");
		
		String email = request.getParameter("email");
		//�����Ҫ��֤������ǰ̨����
//		if(email.trim().length()>0||userName.trim().length()>0||realName.trim().length()>0||password.trim().length()>0){
//			  request.setAttribute("error", "����д��������Ϣ��");
//			  request.getRequestDispatcher( "rigist.jsp").forward(request,response);
//		}else{
			
		UserInfo user=userService.checkUserName(userName);
		if(user==null){
		     UserInfo userInfo=new UserInfo(UUIDUtils.getId(), realName, userName, password, new Date(), email);
		     userInfo.setCode(UUIDUtils.getCode());
		     userInfo.setState(0);
		     System.out.println(userInfo);
		      int count=userService.addUserInfo(userInfo);
		      System.out.println(count);
		      if(count<=0){
			request.setAttribute("error", "ע��ʧ��");
			request.getRequestDispatcher( "rigist.jsp").forward(request,response);
		       }  else{
			       String emailMsg="��ӭ"+userInfo.getUsername()+"�����ѳ�Ϊ���ǵ�һԱ,��<a href='http://localhost:8080/flower/UserServlet?action=active&code="+userInfo.getCode()+"'>��˼���</a>";
			       MailUtils.sendMail(userInfo.getEmail(), emailMsg);
			       request.setAttribute("msg", "�û�ע���ѳɹ�,��ȥ���伤��~~");
			       request.getRequestDispatcher( "msg.jsp").forward(request,response);
		       }
		}else{
		         request.setAttribute("error", "�û����Ѿ�����");
		         request.getRequestDispatcher( "rigist.jsp").forward(request,response);
		}
       
		
	}
	
	public void updatePwdByUserId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String username=request.getParameter("username");
		UserInfo user=userService.checkUserName(username);
		if(user!=null){
		            String password=request.getParameter("password");
				userService.updatePwdByUserId(username, password);
				request.setAttribute("msg","��������ɹ�");
				request.getRequestDispatcher("msg.jsp") .forward(request,response);
		}
		//request.setAttribute("error2","û�д��û�");
		//request.getRequestDispatcher("userinfo.jsp") .forward(request,response);
		
	}
	public void logout(HttpServletRequest request, HttpServletResponse response) throws IOException{
		request.getSession().removeAttribute("user");
		response.sendRedirect( "FlowerServlet?action=findByPage");
	}
	public void updateUserInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String uid=request.getParameter("userid");
		System.out.println(uid+"Ҫ���µ��û�");
		String username=request.getParameter("username");
		String email=request.getParameter("email");
		userService.updateUserInfoByUid(uid, username, email);
		request.setAttribute("error1","�޸ĳɹ�");
		request.getRequestDispatcher("userinfo.jsp") .forward(request,response);
	}
	public void active(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// 1.��ȡ������
		String code = request.getParameter("code");
		System.out.println(code);

		// 2.����service��ɼ���

		UserInfo user = userService.active(code);
		System.out.print(user);

		if (user == null) {
			// ͨ��������û���ҵ��û�
			request.setAttribute("msg", "�����¼���");
		} else {
			// �����Ϣ
			request.setAttribute("msg", "����ɹ�,��ǰ����¼");
		}
		// 3.����ת����msg.jsp
		request.getRequestDispatcher("msg.jsp").forward(
		                        request, response);
	}
	

}
