<style>
	.iframe-background{
		display:none;
		position:fixed;
		top:0;right:0;bottom:0;left:0;
		background:black;
		opacity:0.3;
		z-index:1;
	}
	.iframe-modified{
		display:none;
		position:absolute;
		top:50px;
		left:50%;
		bottom:50px;
		margin-left:-384.5px;
		width:769px;
		height:842px;
		border:3px solid black;
		overflow:auto;
		box-shadow:2px 2px 2px 2px;
		z-index:2;
		padding:10px;
	}
</style>
<div class="iframe-background"></div>
<button type="button" class="btn btn-success" id="getInvoice">Invoice</button>
<button type="button" class="btn btn-success" id="printme">Print</button>
<iframe class="iframe-modified" src="test.jsp" id="printf" name="printf">
		
</iframe>
<script>
	window.frames["printf"].focus();
	document.getElementById("printme").addEventListener("click",function(){
		window.frames["printf"].print();
	})
	
	document.getElementById("getInvoice").addEventListener("click",function(){
		document.getElementsByClassName("iframe-background")[0].style.display = "block";
		document.getElementsByClassName("iframe-modified")[0].style.display = "block";
	})

</script>

