<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	  <!-- Bootstrap CSS -->
	  <link rel="stylesheet" href="../styles/bootstrap.min.css">	
	  <link rel="stylesheet" href="../styles/WBStyle.css">
        <title>Final Purchase</title>
    </head>
<body>
      <%@include file="../views/NavBar.html" %>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-8 col-md-margintop border">
                        <form action="">
                            <div class="form-row">
                                <div class="col-md-6">
                                    <label for="">RST No :</label>
                                    <div class="input-group">
                                    <input id="rst" type="text" class="form-control form-control-sm" placeholder="Search RST">
                                	<div class="input-group-append">
				    				<button class="btn btn-outline-secondary btn-sm" type="button" onclick="fetchData(document.getElementById('rst').value)">Get RST</button>
				    				</div>
                                </div>
                                </div>
                                <div class="col-md-6">
                                    <label for="">Record No :</label>
                                    <input type="text" class="form-control form-control-sm" placeholder="Record No">
                                </div>
                                <div class="col-md-6">
                                    <label for="">Company Name :</label>
                                    <select name="" id="" class="form-control form-control-sm">
                                        <option value="">Company 1</option>
                                        <option value="">Company 2</option>
                                        <option value="">Company 3</option>
                                    </select>
                                </div>
                                <div class="col-md-6">
                                    <label for="">Date :</label>
                                    <input type="date" class="form-control form-control-sm" placeholder="Record No">
                                </div>
                                <div class="col-md-6">
                                    <label>Customer Name & Address</label>
                                    <textarea class="form-control form-control-lg"></textarea>
                                    </div>
                                <div class="col-md-6">
                                    <label>Authorized Grader</label>
                                    <input type="text" class="form-control form-control-sm" placeholder="">
                                    <label>Authorizer</label>
                                    <input type="text" class="form-control form-control-sm" placeholder="">
                                </div>
                                <div class="col-md-12 col-md-margintop">
                                    <table class="table table-bordered custom-table">
                                        <thead>
                                        <tr>
                                            <th>RST No</th>
                                            <th>Material</th>
                                            <th>Quantity</th>
                                            <th>Grade</th>
                                            <th>Rate</th>
                                            <th align="right">Amount</th> 
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td>01</td>
                                            <td>Cotton</td>
                                            <td>100 Qtl</td>
                                            <td>
                                            <select name="" id="" class="form-control form-control-sm">
                                                <option value="">Grade A</option>
                                                <option value="">Grade B</option>
                                                <option value="">Grade C</option>
                                            </select>
                                            </td>
                                            <td><input type="text" class="form-control form-control-sm"></td>
                                            <td align="right">15000</td>
                                        </tr>
                                        <tr>
                                            <td>01</td>
                                            <td>Cotton</td>
                                            <td>100 Qtl</td>
                                            <td>
                                            <select name="" id="" class="form-control form-control-sm">
                                                <option value="">Grade A</option>
                                                <option value="">Grade B</option>
                                                <option value="">Grade C</option>
                                            </select>
                                            </td>
                                            <td><input type="text" class="form-control form-control-sm"></td>
                                            <td align="right">15000</td>
                                        </tr>
                                        <tr>
                                            <td>01</td>
                                            <td>Cotton</td>
                                            <td>100 Qtl</td>
                                            <td>
                                            <select name="" id="" class="form-control form-control-sm">
                                                <option value="">Grade A</option>
                                                <option value="">Grade B</option>
                                                <option value="">Grade C</option>
                                            </select>
                                            </td>
                                            <td><input type="text" class="form-control form-control-sm"></td>
                                            <td align="right">15000</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="col-md-12 ">
                                   <table class="table">
                                    <tbody>
                                        <tr>
                                            <td rowspan="2">
                                                <label>Note :</label>
                                                <textarea class="form-control form-control-sm"></textarea>
                                            </td>
                                            <td align="right">
                                                <label for="">Advance :</label> 
                                                <input type="text" class="custom-noborder-input" value="10000">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <label for="">Net Payable :</label> 
                                                <input type="text" class="custom-noborder-input" value="35000">
                                            </td>
                                        </tr>
                                    </tbody>
                                   </table>
                                </div>
                                <div class="col-md-12">
                                    <div class="d-flex justify-content-around custom-checkbox">
                                        <div class="custom-control">
                                            <input type="checkbox" class="custom-control-input" id="customCheck1">
                                            <label class="custom-control-label" for="customCheck1">Cash</label>
                                        </div>
                                        <div class="custom-control">
                                            <input type="checkbox" class="custom-control-input" id="customCheck2">
                                            <label class="custom-control-label" for="customCheck2">RTGS/NEFT</label>
                                        </div>
                                        <div class="custom-control">
                                                <input type="checkbox" class="custom-control-input" id="customCheck3">
                                                <label class="custom-control-label" for="customCheck3">Cheque</label>
                                        </div>
                                        <div class="custom-control">
                                            <input type="checkbox" class="custom-control-input" id="customCheck4">
                                            <label class="custom-control-label" for="customCheck4">Other</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12 border-top">
                                    <div class="d-flex justify-content-end">
                                        <button style="margin-bottom:8px;" type="button" class="btn btn-primary btn-sm btn-mr-rt btn-mr-tp">Amanat</button>
                                        <button style="margin-bottom:8px;" type="button" class="btn btn-primary btn-sm btn-mr-rt btn-mr-tp">Approve</button>
                                    </div>
                                </div>
                            </div> 
                        </form>
                    </div>
                    <div class="col-md-4 col-md-margintop border">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Token No</th>
                                    <th>RST No</th>
                                    <th>Amount</th>
                                    <th>Call</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>01</td>
                                    <td>2541</td>
                                    <td>0451</td>
                                    <td>10000</td>
                                    <td>
                                        <button type="button" class="btn btn-primary btn-sm custom-button-submit">Call</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>02</td>
                                    <td>2542</td>
                                    <td>0452</td>
                                    <td>10500</td>
                                    <td>
                                        <button type="button" class="btn btn-primary btn-sm custom-button-submit">Call</button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
			<nav class="navbar navbar-default navbar-static-bottom footer border-top">
    
    		</nav>
	<script src="../js/jquery-3.3.1.slim.min.js" ></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
		<script>
	
	function fetchData(rst){
		console.log(rst);
		url = "../processing/adminApproval.jsp?rst="+rst;
		
		if(window.XMLHttpRequest){  
			fetchRequest=new XMLHttpRequest();  
		}  
		else if(window.ActiveXObject){  
			fetchRequest=new ActiveXObject("Microsoft.XMLHTTP");  
		}  
	  
		try{  
			fetchRequest.onreadystatechange=getData;  
			console.log("AJAX Req sent");
			fetchRequest.open("GET",url,true);  
			fetchRequest.send();  
		}catch(e){alert("Unable to connect to server");}
	}
	
	function getData(){
		
		if(fetchRequest.readyState == 4){
			var response = this.response.trim();
			console.log(response);
		}
	}
	
	</script>
</body>