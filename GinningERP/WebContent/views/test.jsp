<!DOCTYPE html>
<html>
<head>
<style>
table, td {
  border: 1px solid black;
}
</style>
</head>
<body>

<p>Click the button to create a TABLE, a TR and a TD element.</p>

<button onclick="myFunction(2,['one','Two'])">Try it</button>

<script>
function myFunction(numbers,ary) {
	var x = document.createElement("table");
  x.setAttribute("id", "dataTable");
  document.body.appendChild(x);

  var y = document.createElement("thead");
  y.setAttribute("id", "dataTableHead");
  document.getElementById("dataTable").appendChild(y);

  var b = document.createElement("tbody");
  b.setAttribute("id", "dataTableBody");
  document.getElementById("dataTable").appendChild(b);
  
  for(i=0;i<=(numbers-1);i++){
	  var th = document.createElement("th");
	  document.getElementById("dataTableHead").appendChild(th);
	  document.getElementsByTagName("th")[i].innerHTML = ary[i];
  }
 
  

}
</script>

</body>
</html>
