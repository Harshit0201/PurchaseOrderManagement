package com.java.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.springframework.format.annotation.DateTimeFormat;


@Table(name = "purchaseorder")																												
@Entity
public class Order {

	@Id
    @NotNull(message = "Order Id cannot be null")
	private Integer orderId;

    @Pattern(regexp="[a-zA-Z][a-zA-Z]*",message="Vendor Name write Correctly")  
	private String vendorName;

    @Pattern(regexp="[a-zA-Z0-9].*",message="Shipping Address write Correctly")  
	private String shippingAddress;

	private String status;

	@NotEmpty(message = "Delivery Date cannot be null")
	@DateTimeFormat(pattern = "MM-dd-yyyy")
	private String deliveryDate;

	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public String getVendorName() {
		return vendorName;
	}

	public void setVendorName(String vendorName) {
		this.vendorName = vendorName;
	}

	public String getShippingAddress() {
		return shippingAddress;
	}

	public void setShippingAddress(String shippingAddress) {
		this.shippingAddress = shippingAddress;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getDeliveryDate() {
		return deliveryDate;
	}

	public void setDeliveryDate(String deliveryDate) {
		this.deliveryDate = deliveryDate;
	}

	@Override
	public String toString() {
		return "Order [orderId=" + orderId + ", vendorName=" + vendorName + ", shippingAddress=" + shippingAddress
				+ ", status=" + status + ", deliveryDate=" + deliveryDate + "]";
	}
}