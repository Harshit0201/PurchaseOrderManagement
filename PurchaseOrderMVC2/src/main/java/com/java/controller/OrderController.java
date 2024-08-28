package com.java.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.java.dao.OrderDao;
import com.java.model.Order;
import com.java.service.OrderControllerService;

@Controller
public class OrderController implements OrderControllerService{

	@Autowired
	OrderDao orderDao;
	
	@RequestMapping(path="/",method=RequestMethod.GET)
	public String viewOrder(Model m) {
		List<Order> list = orderDao.getOrders();
		m.addAttribute("orderList", list);
		return "view";
	}
	
	@RequestMapping(path="/edit/{orderId}")
	public String editOrder(@PathVariable("orderId") Integer orderId, Model m) {
		Order order = orderDao.getOrderById(orderId);
		m.addAttribute("order", order);
		return "edit";
	}
	

	@RequestMapping(path="/orderForm",method=RequestMethod.GET)
	public String orderForm(Model m) {
		Order order = new Order();
		m.addAttribute("order", order);
		return "orderForm";
	}
	
	@RequestMapping(path="/validAdd",method=RequestMethod.POST)  
    public String submitForm( @Valid @ModelAttribute("order") Order order, BindingResult br)  
    {  
        if(br.hasErrors())  
        {  
            return "orderForm";  
        }	else {  
        			try {
        				orderDao.addOrder(order);
            			return "redirect:/success";
        			}catch(Exception e) {
        				e.printStackTrace();
        				return "orderFail";
        			}
        		}  
    }  
	
    @RequestMapping(path="/success", method=RequestMethod.GET)
	public String success(Model m) {
	    // Add any additional data needed for the success page
        List<Order> list = orderDao.getOrders();
        m.addAttribute("orderList", list);
        return "orderSuccess";
    }
	
	@RequestMapping(path="/validUpdate",method=RequestMethod.POST)  
    public String submitUpdate( @Valid @ModelAttribute("order") Order order, BindingResult br)  
    {  
        if(br.hasErrors())  
        {  
            return "edit";  
        }  else {  
        			orderDao.updateOrder(order);
        			return "redirect:/success";
        		}  
    }

	@RequestMapping(path="/delete/{orderId}",method=RequestMethod.GET)
	public String deleteOrder(@PathVariable("orderId") Integer orderId, Model m) {
		orderDao.deleteOrder(orderId);
		return "redirect:/success";
		
	} 
			
}
