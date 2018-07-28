package com.flower.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.flower.domain.Cart;
import com.flower.domain.CartItem;
import com.flower.domain.Flower;
import com.flower.service.FlowerService;
import com.flower.service.impl.FlowerServiceImpl;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet{
	private FlowerService flowerService=new FlowerServiceImpl();

	/**
	 * 
	 */
            private static final long serialVersionUID = 1L;

	@Override
            protected void doGet(HttpServletRequest request,
                                    HttpServletResponse response)
                                    throws ServletException, IOException {
	            // TODO Auto-generated method stub
	          doPost(request, response);
            }

	@Override
            protected void doPost(HttpServletRequest request,
                                    HttpServletResponse response)
                                    throws ServletException, IOException {
	            // TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
	            String action=request.getParameter("action");
	            System.out.println(action);
	            if(action.equals("add2Cart")){
	            	add2Cart(request, response);
	            }else if(action.equals("remove")){
	            	try {
	                                    remove(request, response);
                                    } catch (Exception e) {
	                                    e.printStackTrace();
                                    }
	            }else if(action.equals("clear")){
	            	try {
	                                    clear(request, response);
                                    } catch (Exception e) {
	                                    e.printStackTrace();
                                    }
	            }else if(action.equals("carts")){
	            	carts(request, response);
	            }
            }
	
	public Cart findCart(HttpServletRequest request,
                                    HttpServletResponse response){
		Cart cart=(Cart)request.getSession().getAttribute("cart");
		if(cart==null){
			cart=new Cart();
			request.getSession().setAttribute("cart", cart);
		}
		return cart;
	}
	public void add2Cart(HttpServletRequest request,
                                    HttpServletResponse response) throws IOException, ServletException{
		String flowerid=request.getParameter("flowerid");
		int count=Integer.parseInt(request.getParameter("count"));
		Flower flower=flowerService.getFlowerById(flowerid);
		
		CartItem cartItem=new CartItem(flower,count);
		Cart cart=findCart(request, response);
		cart.add2Cart(cartItem);
		request.getRequestDispatcher("cart.jsp").forward(request, response);
		//response.sendRedirect(request.getContentType()+"cart.jsp");
	}
	public void remove(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//1.获取香花的
		String flowerid= request.getParameter("flowerid");
		
		//2.调用购物车的remove方法
		findCart(request, response).deleteById(flowerid);
		
		//3.请求转发
		request.getRequestDispatcher("cart.jsp").forward(request, response);
	}
	public void clear(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//获取购物车 清空
		findCart(request, response).clear();
		request.getRequestDispatcher("cart.jsp").forward(request, response);
	}
            public void carts(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
            	findCart(request, response);
            	request.getRequestDispatcher("cart.jsp").forward(request, response);
            }


}
