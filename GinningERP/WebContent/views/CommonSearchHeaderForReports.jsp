<%@ taglib uri="/WEB-INF/CustomTags.tld" prefix="c"%>
<div class="row mt-2 tile-background-row">
			<div class="col-md-12">
					<h3 id="report-title" class="lbl-rm-l"></h3>
			</div>
			<div class="col-md-3">
					<label class="lbl-rm-l">Company</label>
					<select class="form-control form-control-sm" name="" id="companyId">
						<option selected>Select</option>
						<c:Company />
					</select>
			</div>
		</div>
		<div class="row tile-background-row">
			<div class="col-md-auto ">
				<label class="lbl-rm-l lbl-rm-t">Search</label>
			</div>
			<div class="col-md-auto">
				<input type="text" class="form-control form-control-sm inpt-rm-t" name="" id="searchInput" placeholder="">
			</div>
			<div class="col-md-auto text-left">
				<button type="button" class="btn btn-success btn-sm lbl-rm-l">Search</button>
			</div>
			<div class="col-md-auto text-left">
				<button type="button" class="btn btn-danger btn-sm" id="clearFilterBtn">Clear Filter</button>
			</div>
			<div class="col-md-auto">
				<img src="../property/img/setting.png" alt="option" class="img-set" id="options">
				<img src="../property/img/exportpdf.png" alt="option" class="img-set" id="exportToPdf">
				<img src="../property/img/exportexcel.png" alt="option" class="img-set" id="exportToExcel">
			</div>
			</div>