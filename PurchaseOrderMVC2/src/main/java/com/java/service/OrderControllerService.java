package com.java.service;

import javax.validation.Valid;

import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import com.java.model.Order;

public interface OrderControllerService {

		public String viewOrder(Model m);

		public String editOrder(@PathVariable("orderId") Integer orderId, Model m);

		public String orderForm(Model m);

	    public String submitForm( @Valid @ModelAttribute("order") Order order, BindingResult br);
	    
		public String success(Model m);
		
	    public String submitUpdate( @Valid @ModelAttribute("order") Order order, BindingResult br);
	    
		public String deleteOrder(@PathVariable("orderId") Integer orderId, Model m);
	
}
