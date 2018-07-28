package com.flower.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.flower.domain.Flower;
import com.flower.service.FlowerService;
import com.flower.service.impl.FlowerServiceImpl;
import com.flower.utils.CookieUtils;

/**
 * Servlet implementation class HistoryServlet
 */
@WebServlet("/HistoryServlet")
public class HistoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private FlowerService flowerService=new FlowerServiceImpl();
  

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("text/html;charset=utf-8");
		String action=request.getParameter("action");
		System.out.println(action);
		if(action.equals("addcollection")){
			String flowerid=request.getParameter("flowerid");
			CookieUtils.addCookie(response, "collection", builderString(request, flowerid),30 * 24 * 60 * 60);
			request.setAttribute("msg","收藏成功<a href='FlowerServlet?action=findByPage'>返回首页继续浏览信息</a>");
			request.getRequestDispatcher( "msg.jsp")
			                        .forward(request,
			                                                response);
		}else if(action.equals("browseCollection")){
			Cookie[] cookies=request.getCookies();
			Cookie cookie=CookieUtils.getCookieByName("collection", cookies);
			List<Flower> list=new ArrayList<Flower>();
			//System.out.println(cookie.getValue());
			if(cookie!=null){
			      if(cookie.getValue()==null && "".equals(cookie.getValue().trim())){
				     request.setAttribute("msg","您还未收藏有关信息哦");
			                 request.getRequestDispatcher("msg.jsp") .forward(request,  response);
		                    }
			      String ids=cookie.getValue();
			      System.out.println(ids);
				String[] arr=ids.split("-");
				for(String str:arr){
					Flower flower=flowerService.getFlowerById(str);
					System.out.println(flower);
					list.add(flower);
				}
				request.setAttribute("list", list);
				request.getRequestDispatcher("mycollection.jsp").forward(request, response);
			}else{
				   request.setAttribute("msg","您还未收藏有关信息哦!<a href='FlowerServlet?action=findByPage'>返回首页继续浏览信息</a>");
			               request.getRequestDispatcher("msg.jsp") .forward(request,  response);
			}
			
		}else if(action.equals("clear")){
			clear(request,response);
		}
	         
	        
	}
	public String builderString(HttpServletRequest request,String currentflowerId) {
		Cookie[] cookies = request.getCookies();
		StringBuffer out = new StringBuffer();
		LinkedList<String> flowerids = new LinkedList<String>();
		Cookie cookie = CookieUtils.getCookieByName("collection",cookies);
		if (cookie != null) {
			String cookieValue = cookie.getValue();
			if (cookieValue != null
			                        && !"".equals(cookieValue
			                                                .trim())) {
				String[] ids = cookieValue
				                        .split("-");
				for (String id : ids) {
					flowerids.offer(new String(
					                        id.trim()));
				}
				if (flowerids.contains(currentflowerId))
					flowerids.remove(currentflowerId);
				if (flowerids.size() >= 10)
					flowerids.poll();
			}
		} 
		flowerids.offer(currentflowerId);
		for (String id : flowerids) {
			out.append(id).append('-');
		}
		
		out.deleteCharAt(out.length() - 1);
		return out.toString();
	}
	
	public void clear(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		Cookie[] cookies=request.getCookies();
		Cookie cookie=CookieUtils.getCookieByName("collection", cookies);
		if(cookie.getName().equals("collection")){
			System.out.println(cookie.getValue());
			if(cookie.getValue()==null
			                        && "".equals(cookie.getValue().trim())){
					request.setAttribute("msg","您还未收藏有关信息哦");
				            request.getRequestDispatcher("msg.jsp") .forward(request,  response);
			}else{
				cookie.setValue(null);
				cookie.setPath("/");
				cookie.setMaxAge(0);
				//collection.setValue(null);
				response.addCookie(cookie);
				System.out.println(cookie.getValue());
				response.sendRedirect(request.getContextPath()+"/HistoryServlet?action=browseCollection");
				}
			}
		}
		//request.getRequestDispatcher("HistoryServlet?action=browseCollection").forward(request, response);
		
		

}
