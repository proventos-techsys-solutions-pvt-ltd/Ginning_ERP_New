<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../styles/bootstrap.min.css">
<link rel="stylesheet" href="../styles/admin/sidenav.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<title>New User Registration</title>
</head>

<body>

<%@include file="../admin/Top_Nav.jsp" %>
<div class="container-fluid container-mr-t">
	 <%@include file="../admin/Side_bar.html" %>
		<div class="row row-background border-bottom">
			<div class="col-md-12">
					<h4>Manage User's</h4>
			</div>
		</div>
		<%session.getAttribute("userId");
		session.removeAttribute("userId");%>
		<div class=" row row-background">
			<div class="col-md-12">
					<form action="../processing/addUser.jsp" id="registrationForm">
					<input type="hidden" name="id" id="id" />
						<div class="form-row">
							<div class="col-md-6">
								<label>Name</label>
								<input type="text" class="form-control form-control-sm" name="name" id="name">
							</div>
						</div>
						<div class="form-row">
							<div class="col-md-2">
								<label>Username</label>
								<input type="text" class="form-control form-control-sm" name="username" id="username">
							</div>
							<div class="col-md-2">
								<label>Password</label>
								<input type="password" class="form-control form-control-sm" name="password" id="password">
							</div>
							<div class="col-md-2">
								<label>Role</label>
								<select class="form-control form-control-sm" name="role" id="role">
									<option value="1">Admin</option>
									<option value="2">Weigh Bridge Operator</option>
									<option value="3">Cashier</option>
								</select>
							</div>
						</div>
					</form>
					</div>
					</div>
					<div class=" row row-background border-top">
					<div class="col-md-12">
						<div class="form-row">
							<div class="col-md-12">
								<div class="d-flex justify-content-end align-items-center">
									<button type="button" class="btn btn-success btn-sm btn_width" id="submit">Add</button>
									<button type="button" class="btn btn-success btn-sm btn_width ml-1" id="update" disabled="disabled">Update</button>
									<button type="button" class="btn btn-success btn-sm btn_width ml-1" id="reset">Reset</button>
								</div>
							</div>
						</div>
					</div>
					</div>
					 <div class="row row-background border-top">
					<div class="col-md-12 mt-2">
						<h4>Users</h4>
					</div>
					<div class="col-md-12 mt-2">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th hidden>ID</th>
									<th>Sr. No.</th>
									<th>Name</th>
									<th>Role</th>
									<th>Username</th>
									<th>Status</th>
									<th hidden>Role Value</th>
									<th hidden>Password</th>
									<th width="5%" align="center">Delete</th>
								</tr>
							</thead>
							<tbody id='usersTable'>
							</tbody>
						</table>
					</div>
				</div>
</div>
<script>
function submitForm(){
	document.getElementById('registrationForm').submit();
}

function usersData(){
	var url="${pageContext.request.contextPath}/processing/getUserReport.jsp";
	if(window.XMLHttpRequest){  
		fetchUsersReport=new XMLHttpRequest();  
	}  
	else if(window.ActiveXObject){  
		fetchUsersReport=new ActiveXObject("Microsoft.XMLHTTP");  
	}  
	try{  
		fetchUsersReport.onreadystatechange=getUsersData;  
		console.log("AJAX Req sent");
		fetchUsersReport.open("GET",url,true);  
		fetchUsersReport.send();  
	}catch(e){alert("Unable to connect to server");}
}

function getUsersData(){
	if(fetchUsersReport.readyState == 4){
		var response = this.response.trim();
		var data = JSON.parse(response);
		setUsersData(data);
	}
}

function setUsersData(data){
	var table = document.getElementById('usersTable');
	
	for(i=0; i<data.length; i++){
		
		var noOfRows = table.rows.length;
		
		var row = table.insertRow(noOfRows);
		
		var cell1 = row.insertCell(0);
		var cell2 = row.insertCell(1);
		var cell3 = row.insertCell(2);
		var cell4 = row.insertCell(3);
		var cell5 = row.insertCell(4);
		var cell6 = row.insertCell(5);
		var cell7 = row.insertCell(6);
		var cell8 = row.insertCell(7);
		var cell9 = row.insertCell(8);
		
		cell9.align = 'center';
		cell1.hidden = true;
		cell7.hidden = true;
		cell8.hidden = true;
		
		cell1.innerHTML = data[i].id;
		cell2.innerHTML = (i+1);
		cell3.innerHTML = data[i].name;
		cell5.innerHTML = data[i].username;
		
		if(Number(data[i].role) == 1){
			cell4.innerHTML = 'ADMIN';
		}else if(Number(data[i].role) == 2){
			cell4.innerHTML = 'WEIGH BRIDGE OPERATOR';
		}else if(Number(data[i].role) == 3){
			cell4.innerHTML = 'CASHIER';
		}
		
		if(Number(data[i].status) == 1){
			cell6.innerHTML = 'ACTIVE';
		}else if(Number(data[i].status) == 0){
			cell6.innerHTML = 'INACTIVE';
		}
		cell7.innerHTML = data[i].role;
		cell8.innerHTML = data[i].password;
		cell9.innerHTML = "<img src='../property/img/delete.png' alt='delete' id='deleteRow'>";
	}
}

document.addEventListener('click',function(e){
	if(e.srcElement.tagName === 'TD'){
		var table = document.getElementById('usersTable');
		var rowIndex = e.srcElement.parentNode.rowIndex-1;
		var id = table.rows[rowIndex].cells[0].innerHTML;
		getUserData(rowIndex);
	}
})

function getUserData(rowIndex){
	var table = document.getElementById('usersTable');
	
	document.getElementById('name').value = table.rows[rowIndex].cells[2].innerHTML;
	document.getElementById('username').value = table.rows[rowIndex].cells[4].innerHTML;
	document.getElementById('password').value = table.rows[rowIndex].cells[7].innerHTML;
	document.getElementById('role').value = table.rows[rowIndex].cells[6].innerHTML;
	document.getElementById('id').value = table.rows[rowIndex].cells[0].innerHTML;
	
	document.getElementById('update').disabled = false;
	document.getElementById('submit').disabled = true;
	
}

document.getElementById('reset').addEventListener('click',function(e){
	location.reload();
})

document.getElementById('submit').addEventListener('click',function(e){
	document.getElementById('registrationForm').action="../processing/addUser.jsp";
	submitForm();
})

document.getElementById('update').addEventListener('click',function(e){
	document.getElementById('registrationForm').action="../processing/updateUser.jsp";
	submitForm();
})

document.addEventListener('click',function(e){
	if(e.srcElement.id === 'deleteRow'){
		var table = document.getElementById('usersTable');
		var rowIndex = e.srcElement.parentNode.parentNode.rowIndex-1;
		var id = table.rows[rowIndex].cells[0].innerHTML;
		deleteUser(id);
	}
})

function deleteUser(id){
	console.log(id);
	var url="${pageContext.request.contextPath}/processing/deleteUser.jsp?userId="+id;
	if(window.XMLHttpRequest){  
		deleteUser=new XMLHttpRequest();  
	}  
	else if(window.ActiveXObject){  
		deleteUser=new ActiveXObject("Microsoft.XMLHTTP");  
	}  
	try{  
		deleteUser.onreadystatechange=deleteUserData;  
		console.log("AJAX Req sent");
		deleteUser.open("GET",url,true);  
		deleteUser.send();  
	}catch(e){alert("Unable to connect to server");}
}

function deleteUserData(){
	if(deleteUser.readyState == 4){
		location.reload();
	}
}

usersData();

</script>
<script src="../js/jquery-3.3.1.slim.min.js" ></script>
<script src="../js/popper.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
</body>
</html>