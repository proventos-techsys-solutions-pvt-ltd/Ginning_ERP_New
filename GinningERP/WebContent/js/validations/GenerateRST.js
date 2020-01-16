/*$.fn.validateRstForm = function(){
	var status = false;
	if($("input[type=checkbox]").is(":checked")){
		if($.fn.validateData($("#rst").val().trim(),/^[0-9]+$/)){
			if($.fn.validateData($("#date").val().trim(),/^[0-9]{4}[-][0-9]{2}[-][0-9]{2}$/)){
				if($.fn.validateData($("#vehicleNo").val().trim(), /^[A-Z]{2}[ -][0-9]{1,2}(?: [A-Z])?(?: [A-Z]*)? [0-9]{4}$/)){
					if($("#vehicleType").val().trim()==="Select"){
						if($.fn.validateData($("#customer").val().trim(),/^[A-Z_ ]*$/,)){
							if($.fn.validateData($("#mobile").val().trim(),/^[0-9]{10}$/)){
								if($("#address").val().trim()===""){
									if($.fn.validateData($("#material").val().trim()==="")){
										if($("#gross").val().trim()<=0){
											status = true;
										}else{
											$.fn.checkStatus(1,"Gross weight should be greater than zero");
										}
									}else{
										$.fn.checkStatus(1,"Material cannot be blank");
									}
								}else{
									$.fn.checkStatus(1,"Address cannot be blank");
								}
							}else{
								$.fn.checkStatus(1,"Invalid mobile number");
							}
						}else{
							$.fn.checkStatus(1,"Invalid Customer name");
						}
					}else{
						$.fn.checkStatus(1,"Select correct vehicle type");
					}
				}else{
					$.fn.checkStatus(1,"Invalid Vehicle Number");
				}
			}else{
				$.fn.checkStatus(1,"Invalid Date");
			}
		}else{
			$.fn.checkStatus(1,"Invalid RST No");
		}
	}else{
		if($.fn.validateData($("#rst").val().trim(),/^[0-9]+$/)){
			if($.fn.validateData($("#date").val().trim(),/^[0-9]{4}[-][0-9]{2}[-][0-9]{2}$/)){
					if($("#vehicleType").val().trim()==="Select"){
						if($.fn.validateData($("#customer").val().trim(),/^[A-Z_ ]*$/,)){
							if($.fn.validateData($("#mobile").val().trim(),/^[0-9]{10}$/)){
								if($("#address").val().trim()===""){
									if($.fn.validateData($("#material").val().trim()==="")){
										if($("#gross").val().trim()<=0){
											status = true;
										}else{
											$.fn.checkStatus(1,"Gross weight should be greater than zero");
										}
									}else{
										$.fn.checkStatus(1,"Material cannot be blank");
									}
								}else{
									$.fn.checkStatus(1,"Address cannot be blank");
								}
							}else{
								$.fn.checkStatus(1,"Invalid mobile number");
							}
						}else{
							$.fn.checkStatus(1,"Invalid Customer name");
						}
					}else{
						$.fn.checkStatus(1,"Select correct vehicle type");
					}
				$.fn.checkStatus(1,"Invalid Date");
			}
		}else{
			$.fn.checkStatus(1,"Invalid RST No");
		}
	}
	return status;
}

*/

var uiController = (function(){
		var elementIds={
				rst : document.getElementById("rst"),
				date : document.getElementById("date"),
				vehicleNo : document.getElementById("vehicleNo"),// if cart then no validation and should accept null values
				vehicleType : document.getElementById("vehicleType"),
				customerName : document.getElementById("customer"),
				mobileNo : document.getElementById("mobile"),
				address : document.getElementById("address"),
				material : document.getElementById("material"),
				grossWeight : document.getElementById("gross"),
				newCustomerName : document.getElementById("newCustomerName"),
				newMobileNo : document.getElementById("newCustomerMobile"),
				newAddress : document.getElementById("newCustomerAddress"),
				noCart : document.getElementById("cartCheck")
		}
		
		var expressions={
				rstNo : /^[0-9]+$/,
				vehicleNo : /^[A-Z]{2}[ -][0-9]{1,2}(?: [A-Z])?(?: [A-Z]*)? [0-9]{4}$/,
				customerName : 	/^[A-Z_ ]*$/,
				mobileNo : /^[0-9]{10}$/		
		}
		
	
	return{
			
		validate:function(){
			//validations on RST no
			if(expressions.rstNo.test(elementIds.rst.value.trim())){
				elementIds.rst.style.borderColor ="#ced4da";
				elementIds.rst.title ="";
				//validation on date
					if(elementIds.date.value!==""){
						elementIds.date.style.borderColor ="#ced4da";
						elementIds.date.title ="Date cannot be blank";
						if(( document.getElementById("cartCheck").checked === true)){//checking if the vehicle is not a  cart
							//validation on vehicle no
							if(expressions.vehicleNo.test(elementIds.vehicleNo.value.trim())){//vehicle number validation starts here
								elementIds.vehicleNo.style.borderColor ="#ced4da";
								elementIds.vehicleNo.title ="";
								//validation on Vehicle Type
								if(elementIds.vehicleType.value.trim() !=="Select"){
									elementIds.vehicleType.style.borderColor ="#ced4da";
									elementIds.vehicleType.title ="";
									//Validating customer name
									if(expressions.customerName.test(elementIds.customerName.value.trim())){
										elementIds.customerName.style.borderColor ="#ced4da";
										elementIds.customerName.title ="";
										//validating mobile number
										if(expressions.mobileNo.test(elementIds.mobileNo.value.trim())){
											elementIds.mobileNo.style.borderColor ="#ced4da";
											elementIds.mobileNo.title ="";
											//validating address
											if(elementIds.address.value.trim() !==""){
												elementIds.address.style.borderColor ="#ced4da";
												elementIds.address.title ="";
												//validating material
												if(elementIds.material.value.trim()!==""){
													elementIds.material.style.borderColor ="#ced4da";
													elementIds.material.title ="";
													//validate gross weight
													if(Number(elementIds.grossWeight.value.trim())>0){
														return true
													}else{
														alert("Gross weight should be more than Zero");
													}
												}else{
													elementIds.material.style.border ="1px red solid";
													elementIds.material.title ="Should not be blank";
													return false;
												}
											}else{
												elementIds.address.style.border ="1px red solid";
												elementIds.address.title ="Should not be blank";
												return false;
											}
										}else{
											elementIds.mobileNo.style.border ="1px red solid";
											elementIds.mobileNo.title ="Should be number only and must be 10";
											return false;
										}
									}else{
										elementIds.customerName.style.border ="1px red solid";
										elementIds.customerName.title ="Cannot be blank and should be in capital letters only";
										return false;
									}
									
								}else{
									elementIds.vehicleType.style.border ="1px red solid";
									elementIds.vehicleType.title ="Vehicle Type cannot be blank";
									return false;
								}
								}else{
								elementIds.vehicleNo.style.border ="1px red solid";
								elementIds.vehicleNo.title ="Vehicle number format 'AA 31 MA 4444'";
								return false;
							}//vehicle number validation ends here*/
							
						}else{
							//elementIds.vehicleNo.value = null;
							//validation on Vehicle Type
							if(elementIds.vehicleType.value.trim() !=="Select"){
								elementIds.vehicleType.style.borderColor ="#ced4da";
								elementIds.vehicleType.title ="";
								//Validating customer name
								if(expressions.customerName.test(elementIds.customerName.value.trim())){
									elementIds.customerName.style.borderColor ="#ced4da";
									elementIds.customerName.title ="";
									//validating mobile number
									if(expressions.mobileNo.test(elementIds.mobileNo.value.trim())){
										elementIds.mobileNo.style.borderColor ="#ced4da";
										elementIds.mobileNo.title ="";
										//validating address
										if(elementIds.address.value.trim() !==""){
											elementIds.address.style.borderColor ="#ced4da";
											elementIds.address.title ="";
											//validating material
											if(elementIds.material.value.trim()!==""){
												elementIds.material.style.borderColor ="#ced4da";
												elementIds.material.title ="";
												//validate gross weight
												if(Number(elementIds.grossWeight.value.trim())>0){
													return true
												}else{
													alert("Gross weight should be more than Zero");
												}
											}else{
												elementIds.material.style.border ="1px red solid";
												elementIds.material.title ="Should not be blank";
												return false;
											}
										}else{
											elementIds.address.style.border ="1px red solid";
											elementIds.address.title ="Should not be blank";
											return false;
										}
									}else{
										elementIds.mobileNo.style.border ="1px red solid";
										elementIds.mobileNo.title ="Should be number only and must be 10";
										return false;
									}
								}else{
									elementIds.customerName.style.border ="1px red solid";
									elementIds.customerName.title ="Cannot be blank and should be in capital letters only";
									return false;
								}
								
							}else{
								elementIds.vehicleType.style.border ="1px red solid";
								elementIds.vehicleType.title ="Vehicle Type cannot be blank";
								return false;
							}
							
						}// cart checking ends here
					
					}else{
						elementIds.date.style.border ="1px red solid";
						elementIds.date.title ="Date cannot be blank";
						return false;
					}
				}else{
					elementIds.rst.style.border ="1px red solid";
					elementIds.rst.title ="Only Numbers are acceptable";
					return false;
				}
			},
			
			validateNewForm:function(){
				if(expressions.customerName.test(elementIds.newCustomerName.value.trim())){
					elementIds.newCustomerName.style.borderColor ="#ced4da";
					elementIds.newCustomerName.title ="";
					if(expressions.mobileNo.test(elementIds.newMobileNo.value.trim())){
						elementIds.newMobileNo.style.borderColor ="#ced4da";
						elementIds.newMobileNo.title ="";
						if(elementIds.newAddress.value.trim()!==""){
							elementIds.newAddress.style.borderColor ="#ced4da";
							elementIds.newAddress.title ="";
						}else{
							elementIds.newAddress.style.border ="1px red solid";
							elementIds.newAddress.title ="Cannot be blank";
							return false;
						}
					}else{
						elementIds.newMobileNo.style.border ="1px red solid";
						elementIds.newMobileNo.title ="Should be number only and must be 10";
						return false;
					}
				}else{
					elementIds.newCustomerName.style.border ="1px red solid";
					elementIds.newCustomerName.title ="Cannot be blank and should be in capital letters only";
					return false;
				}
			}
		}
})();

