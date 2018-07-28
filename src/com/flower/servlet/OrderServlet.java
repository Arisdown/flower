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
			request.setAttribute("msg", "���ȵ�¼");
			System.out.println("δ��¼");
			//response.sendRedirect(request.getContextPath()+"/msg.jsp");
			request.getRequestDispatcher("msg.jsp").forward(request, response);
		}
		if(userInfo!=null){
		//��װ����
		Order order=new Order();
		//�������ɶ���id
		order.setOid(UUIDUtils.getId());
		order.setOrdertime(new Date());
		//��ȡ�ܾ���
		Cart cart=(Cart)request.getSession().getAttribute("cart");
		order.setTotal(cart.getTotal());
		//��װ������
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
		//��չ��ﳵ
	            request.getSession().removeAttribute("cart");
		request.getRequestDispatcher("order_info.jsp").forward(request, response);
		}
	}
	public void findAllByPage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//1.��ȡ��ǰҳ
		int currPage=Integer.parseInt(request.getParameter("currentPage"));
		System.out.println(currPage);
		int pageSize=3;
		
		//2.��ȡ�û�
		UserInfo user=(UserInfo) request.getSession().getAttribute("user");
		if(user == null){
			request.setAttribute("msg", "�㻹û�е�¼,���¼!");
			request.getRequestDispatcher("msg.jsp").forward(request, response);
		}
		
		//3.����service ��ҳ��ѯ  ����:currpage pagesize user  ����ֵ:PageBean
		if(user!=null){//û�еĻ��м��γ��ֿ�ָ���쳣
		PageBean<Order> bean=orderService.findAllByPage(currPage,pageSize,user);
		
		//4.��PageBean����request����
		request.setAttribute("pb", bean);
		
		request.getRequestDispatcher("order_list.jsp").forward(request, response);
		}
	}

}
