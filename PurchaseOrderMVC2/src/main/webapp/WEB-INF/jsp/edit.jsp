<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Edit Order</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>	
    <style>
    	<%@ include file='/CSS/purchase-order-style.css' %>
	</style>
</head>
<body onload="hideFormAfterDelay()">
<div class="alert alert-danger m-auto mt-3 mb-3 p-0 w-50" id="formError" style="margin:10px;border:0px;">
    <form:form action="validAdd" modelAttribute="order" name="form" method="post">
        <p class="invalid-input errorInput h-6 text-start ml-0"><form:errors path="orderId" /></p>
        <p class="invalid-input errorInput h-6 "><form:errors path="vendorName" cssClass="error"/></p>
        <p class="invalid-input errorInput h-6 "><form:errors path="shippingAddress" cssClass="error" /></p>
        <p class="invalid-input errorInput h-6 "><form:errors path="deliveryDate" cssClass="error" /></p>
    </form:form>
</div>

	<h2 class="text-center mt-3 mb-4 " id="titleOrder">Update PurchaseOrder</h2>
	<div id="orderContainer" class="ml-3 mb-3 mr-3 mt-3  d-flex justify-content-center ">
	
		<form:form action="/PurchaseOrderMVC2/validUpdate" modelAttribute="order" name="form" id="orderForm" class="form-group text-center border border-5 border-darker rounded-4 shadow-lg mb-0 bg-white" method="post">
			
			<div class="text-center rounded-5 p-4">
								
				<form:label path="orderId" class="order-label col-sm-4 text-left mt-4 mb-0 h6">Order Id :</form:label> 
				<form:input path="orderId" type="number" name="orderId" id="orderId"  class="order-input col-sm-4 mb-0 form-control d-inline-block h6" min="1" placeholder="Order Id" readOnly="true" />
				<div id="orderIdError" class="invalid-input text-danger m-auto "><form:errors path="orderId" cssClass="error" /></div>
		
				<form:label path="vendorName" class="order-label col-sm-4 text-left mt-3 mb-0 h6">Vendor Name :</form:label> 
				<form:input path="vendorName" type="text" id="vendorName" name="vendorName"  class="order-input col-sm-4 form-control mb-0 d-inline-block  h6" placeholder="Vendor Name" />
				<div id="vendorNameError" class="invalid-input text-danger m-auto "><form:errors path="vendorName" cssClass="error"/></div>
				
				<form:label path="shippingAddress" class="order-label col-sm-4 text-left mt-3 mb-0 h6">Shipping Address :</form:label> 
				<form:input path="shippingAddress" type="text" name="shippingAddress" id="shippingAddress"  class="order-input col-sm-4 form-control mb-0 d-inline-block  h6" placeholder="Shipping Address" rows="2" col="4" />
				<div id="shippingAddressError" class="invalid-input text-danger  m-auto"><form:errors path="shippingAddress" cssClass="error" /></div>
				
				<form:label path="deliveryDate" class="order-label col-sm-4 text-left mt-3 mb-0 h6">Delivery Date :</form:label> 
				<form:input path="deliveryDate" type="date" id="deliveryDate" name="deliveryDate" class="order-input col-sm-4 form-control mb-0 d-inline-block h6" placeholder="Delivery Date"/>
				<div id="deliveryDateError" class="invalid-input text-danger m-auto "><form:errors path="deliveryDate" cssClass="error" /></div>
				
				<form:label path="status" class="order-label col-sm-4 text-left mt-3 mb-0  h6">Status:</form:label>
				<form:select  path="status" id="status" name="status" class="order-input col-sm-4 form-select  d-inline-block m-xl">
						<form:option value="In Process" label="In Process"/>
                        <form:option value="Approved" label="Approved" />
                       	<form:option value="Delivered" label="Delivered" />
				</form:select>
				
				<div class="text-right">
					<button type="submit" id="btnUpdate" class="btn btnForm btn-success h6"> Update <i class="fa-solid fa-plus"></i></button>
					<a href="/PurchaseOrderMVC2/orderForm" style="text-decoration: none;">
						<button type="button" id="btnReset" class="btn btnForm btn-secondary h6">Reset <i class="fa-solid fa-rotate-right"></i></button>
					</a>
				</div>
			</div>
			
			<a href="/PurchaseOrderMVC2/">
				<button class='btn  btn-link btn-sm  mb-2' type="button">View All Orders <i class='fa-solid fa-eye'></i></button>			
			</a>
		</form:form>
	</div>
	<script>
		/* setTimeout(function() {
			document.getElementsById('formError').style.display="none";
		}, 4000); */
		 function hideFormAfterDelay() {
     	    setTimeout(function() {
     	        document.getElementById('formError').style.display = "none";
      	   }, 4000);
   	 	 }
	</script>
	
</body>
</html>