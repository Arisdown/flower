package com.flower.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import com.flower.domain.Flower;
import com.flower.domain.PageBean;
import com.flower.service.FlowerService;

import com.flower.service.impl.FlowerServiceImpl;

/**
 * Servlet implementation class FlowerServlet
 */
@WebServlet("/FlowerServlet")
public class FlowerServlet extends HttpServlet {
	private FlowerService flowerService=new FlowerServiceImpl();
	private static final long serialVersionUID = 1L;

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
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String action=request.getParameter("action");
		if(action.equals("findByPage")){
			findByPage(request, response);	
		}else if(action.equals("getFlowerById")){
			getFlowerById(request, response);
		}
	}
	
	public void findByPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		int currentPage=getCurrentPage(request);
		int pageSize=8;
		PageBean<Flower> pb=flowerService.findPageBean(currentPage, pageSize);
		request.setAttribute("pb", pb);
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}
	private int getCurrentPage(HttpServletRequest request){
		String value=request.getParameter("pc");
		if(value==null||value.trim().isEmpty()){
			return 0;
		}
		return Integer.parseInt(value);
	}
	public void getFlowerById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String id=request.getParameter("flowerid");
		Flower flower=flowerService.getFlowerById(id);
		
			request.setAttribute("flower", flower);
			request.getRequestDispatcher("flower_details.jsp").forward(request, response);
		
	}

}
