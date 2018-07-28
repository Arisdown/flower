package com.flower.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.flower.domain.Cart;
import com.flower.domain.CartItem;
import com.flower.domain.Order;
import com.flower.domain.OrderItem;
import com.flower.domain.PageBean;
import com.flower.domain.UserInfo;
import com.flower.service.OrderService;
import com.flower.service.impl.OrderServiceImpl;
import com.flower.utils.UUIDUtils;

/**
 * Servlet implementation class OrderServlet
 */
@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private OrderService orderService=new OrderServiceImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

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
		System.out.println(action);
		if(action.equals("add")){
			try {
	                                    add(request, response);
                                    } catch (SQLException e) {
	                                    e.printStackTrace();
                                    }
		}else if(action.equals("findAllByPage")){
			try {
	                                    findAllByPage(request, response);
                                    } catch (Exception e) {
	                                    e.printStackTrace();
                                    }
		}
	}
	public void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
		UserInfo userInfo=(UserInfo)request.getSession().getAttribute("user");
		if(userInfo==null){
			request.setAttribute("msg", "请先登录");
			System.out.println("未登录");
			//response.sendRedirect(request.getContextPath()+"/msg.jsp");
			request.getRequestDispatcher("msg.jsp").forward(request, response);
		}
		if(userInfo!=null){
		//封装数据
		Order order=new Order();
		//工具生成订单id
		order.setOid(UUIDUtils.getId());
		order.setOrdertime(new Date());
		//获取总净额
		Cart cart=(Cart)request.getSession().getAttribute("cart");
		order.setTotal(cart.getTotal());
		//封装订单项
		for(CartItem cartItem:cart.getItmes()){
			OrderItem oi=new OrderItem();
			oi.setItemid(UUIDUtils.getId());
			oi.setCount(cartItem.getCount());
			oi.setSubtotal(cartItem.getSubtotal());
			oi.setFlower(cartItem.getFlower());
			oi.setOrder(order);
			order.getItems().add(oi);
		}
		order.setUser(userInfo);
		orderService.add(order);
		request.setAttribute("bean",order);
		//清空购物车
	            request.getSession().removeAttribute("cart");
		request.getRequestDispatcher("order_info.jsp").forward(request, response);
		}
	}
	public void findAllByPage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//1.获取当前页
		int currPage=Integer.parseInt(request.getParameter("currentPage"));
		System.out.println(currPage);
		int pageSize=3;
		
		//2.获取用户
		UserInfo user=(UserInfo) request.getSession().getAttribute("user");
		if(user == null){
			request.setAttribute("msg", "你还没有登录,请登录!");
			request.getRequestDispatcher("msg.jsp").forward(request, response);
		}
		
		//3.调用service 分页查询  参数:currpage pagesize user  返回值:PageBean
		if(user!=null){//没有的话有几次出现空指针异常
		PageBean<Order> bean=orderService.findAllByPage(currPage,pageSize,user);
		
		//4.将PageBean放入request域中
		request.setAttribute("pb", bean);
		
		request.getRequestDispatcher("order_list.jsp").forward(request, response);
		}
	}

}
