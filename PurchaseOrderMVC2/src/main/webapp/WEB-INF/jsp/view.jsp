<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.java.model.Order"%>
<%@page import="com.java.dao.OrderDao,com.java.*,java.util.*"%>

<html>
<head>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />	
	<link rel="stylesheet" href="https://cdn.datatables.net/2.0.2/css/dataTables.dataTables.css" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="https://cdn.datatables.net/2.0.2/js/dataTables.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	 <style>
    	<%@ include file='/CSS/purchase-order-style.css' %>
	</style>
</head>
<body>
	<h2 style="text-align: center; margin-top: 20px">Purchase Orders</h2>
	<div id="orderDataContainer" class="w-75 m-auto table-responsive">
		<a href="orderForm" style="margin-left: 95%;">
			<button type="button" id="btnSubmit" class="btn btnForm btn-success h6">
				<i class="fa-solid fa-plus"></i>
			</button>
		</a>
		<table id="orderData" class="table-striped ">
			<thead class="table-dark">
				<tr>
					<th class="text-center">Order Id</th>
					<th class="text-center">Vendor Name</th>
					<th class="text-center">Shipping Address</th>
					<th class="text-center">Date</th>
					<th class="text-center">Status</th>
					<th class="text-center">Action</th>
				</tr>
			</thead>
			<tbody id="orderDataBody">
				<c:forEach items="${orderList}" var="order">
					<tr>
						<td>${order.orderId}</td>
						<td>${order.vendorName}</td>
						<td>${order.shippingAddress}</td>
						<td>${order.deliveryDate}</td>
						<td>${order.status}</td>
						<td><a href="edit/${order.orderId}" style="text-decoration: none;">
								<button class='edit btn btn-primary btn-sm'>Edit</button>
							</a>
							<button id="delete/${order.orderId}" class='deletOrder btn btn-danger btn-sm ml-1  pl-2 pr-2' data-bs-toggle='modal' data-bs-target='#removeData' onclick="deleteOrder(this)">Delete</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<!-- DELETE -->
	<div class="modal fade" id="removeData">
		<div class="modal-dialog modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">Delete Order</h4>
				<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>

			<!-- Modal body -->
			<div class="modal-body" id="orderDataDelete">Are You Sure To
				Delete This Data</div>
			<div class="modal-footer">
				<a id="deleteOrderId"><button type="button"
						class="deleteDataRow btn btn-outline-danger"
						data-bs-dismiss="modal">
						Delete <i class='fa-solid fa-trash'></i>
					</button></a>
				<button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
	<script>
		function deleteOrder(orderid) {
			document.getElementById("deleteOrderId").setAttribute("href",orderid.getAttribute("id"));
			console.log(orderid.getAttribute("id"));
		}
		
		$(document).ready(function() {
			$('#orderData').DataTable();
		});
	</script>
</body>
</html>
