var uiController = (function(){
	var selectElementIds = {
			companyId = "companyId"
	}
	
	var pageHtmlObjects = {
			
	}
	
	

	document.addEventListener('change', function(e){
				if(e.srcElement.id === selectElementIds.companyId){
					appController.getStockReportData(e.srcElement.options[e.srcElement.selectedIndex].value);
				}
			})
})();		

var appController = (function(){
	
	
	var getStockReport = function(companyId){
		var url="../processing/getTodaysStockReport.jsp?companyId="+companyId;
		if(window.XMLHttpRequest){  
			fetchStock=new XMLHttpRequest();  
		}  
		else if(window.ActiveXObject){  
			fetchStock=new ActiveXObject("Microsoft.XMLHTTP");  
		}  
	  
		try{  
			fetchStock.onreadystatechange=fetchData;  
			console.log("AJAX Req sent");
			fetchStock.open("GET",url,true);  
			fetchStock.send();  
		}catch(e){alert("Unable to connect to server");}
	}
	
	return{
		getStockReportData:function(){
			return getStockReport();
		}
	}
	
})();



		
		

		 function fetchData(){
			 if(fetchStock.readyState == 4){
				 setData(this.response.trim());
			 }
		 }

		 
		 function setData(data){
			 
			 var obj = JSON.parse(data);
			 console.log(obj);
			 
			 var canvas = document.getElementById("myChart");
			 var ctx = canvas.getContext('2d');

			 // Global Options:
			  Chart.defaults.global.defaultFontColor = 'black';
			  Chart.defaults.global.defaultFontSize = 16;

			 var data = {
			     labels: ["Cotton Bales", "Cotton Seeds", "Oil", "Cotton Cake"],
			       datasets: [
			         {
			             fill: true,
			             backgroundColor: [
			                 'black',
			                 'white',
			                 'green',
			                 'orange'],
			             data: [obj.closingStock.cottonBales,obj.closingStock.cottonSeed,obj.closingStock.cottonSeedOil,obj.closingStock.cottonCakes],
			 // Notice the borderColor 
			             borderColor: ['black', 'black','black','black'],
			             borderWidth: [2,2,2,2]
			         }
			     ]
			 };

			 // Notice the rotation from the documentation.
			 var options = {
			         title: {
			                   display: true,
			                   text: 'Stock Details',
			                   position: 'top'
			               },
			         rotation: -0.7 * Math.PI
			 };


			 // Chart declaration:
			 var myBarChart = new Chart(ctx, {
			     type: 'pie',
			     data: data,
			     options: options
			 });
		 }
		
		
		function getAverageRate(){
			var tRate = document.getElementById("tRate").innerHTML;
			var aRate = document.getElementById("aRate").innerHTML;
			if(tRate > aRate){
				document.getElementById("aRate").style.background = "green";
				document.getElementById("aRate").style.color = "#fff";
			}else{
				document.getElementById("aRate").style.background = "red";	
				document.getElementById("aRate").style.color = "#fff";
			}
		}
		
		function getTodayCottonRate(){
			var url="../processing/getTodaysSuperRate.jsp";
			if(window.XMLHttpRequest){  
				fetchCottonRate=new XMLHttpRequest();  
			}  
			else if(window.ActiveXObject){  
				fetchCottonRate=new ActiveXObject("Microsoft.XMLHTTP");  
			}  
		  
			try{  
				fetchCottonRate.onreadystatechange=fetchRate;  
				console.log("AJAX Req sent");
				fetchCottonRate.open("GET",url,true);  
				fetchCottonRate.send();  
			}catch(e){alert("Unable to connect to server");}
		}
		
		function fetchRate(){
			 if(fetchCottonRate.readyState == 4){
				var response = this.response.trim();
				console.log(response);
				var data = JSON.parse(response);
				document.getElementById('tRate').innerHTML = data['superRate'];
				document.getElementById('aRate').innerHTML = data['averageRate'];
			 }
		 }
		
		getTodayCottonRate();
		getAverageRate();