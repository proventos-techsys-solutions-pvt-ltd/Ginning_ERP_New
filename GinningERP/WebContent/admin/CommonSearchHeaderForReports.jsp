<%@ taglib uri="/WEB-INF/CustomTags.tld" prefix="c"%>
<div class="row  row-background border-bottom">
			<div class="col-md-12 ">
					<h4 id="report-title" class="lbl-rm-l"></h4>
					</div>
			</div>
			<div class="row row-background">
			<div class="col-md-3">
					<label class="lbl-rm-l">Company</label>
					<select class="form-control form-control-sm" name="" id="companyId">
						<option selected disabled>Select</option>
						<option value='0'>All</option>
						<c:Company />
					</select>
			</div>
		</div>
		<div class="row row-background">
			
			<div class="col-md-2">
				<label class="lbl-rm-all">Search</label>
				<input type="text" class="form-control form-control-sm " name="" id="searchInput" placeholder="">
			</div>
			<div class="col-md-2" >
				<label class="lbl-rm-all">From</label>
				<input type="date" class="form-control form-control-sm " name="startDate" id="startDate">
 			</div>
 			<div class="col-md-2">
				<label class="lbl-rm-all">To</label>
				<input type="date" class="form-control form-control-sm" name="endDate" id="endDate">
 			</div>
 			<div class="col-md-2">
				<button type="button" class="btn btn-sm btn-success" id="dateFilterButton" onclick="dateFilter()" style="margin-top:31px;">Filter</button>
 			</div>
 			<div class="col-md-2">
				<img src="../property/img/exportexcel.png" alt="option" class="img-set" style="margin-top:31px;margin-left:-120px;" id="exportToExcel">
 			</div>
 			
			</div>