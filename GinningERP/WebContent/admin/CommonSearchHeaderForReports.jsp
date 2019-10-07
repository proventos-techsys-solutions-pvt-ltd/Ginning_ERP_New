<%@ taglib uri="/WEB-INF/CustomTags.tld" prefix="c"%>
<div class="row mt-2 row-background border-bottom">
			<div class="col-md-12 ">
			<div class="d-flex justify-content-start align-items-center">
					<div class="c-nav-collapse" onclick="myFunction(this)">
							  <div class="bar1"></div>
							  <div class="bar2"></div>
							  <div class="bar3"></div>
							</div>
							&nbsp;&nbsp;
					<h4 id="report-title" class="lbl-rm-l"></h4>
					</div>
			</div>
			</div>
			<div class="row row-background">
			<div class="col-md-3">
					<label class="lbl-rm-l">Company</label>
					<select class="form-control form-control-sm" name="" id="companyId">
						<option selected>Select</option>
						<option value='0'>All</option>
						<c:Company />
					</select>
			</div>
		</div>
		<div class="row row-background">
			
			<div class="col-md-auto">
				<div class="d-flex justify-content-start align-items-center">
				<input type="text" class="form-control form-control-sm inpt-rm-t" name="" id="searchInput" placeholder="">
				<button type="button" class="btn btn-success btn-sm lbl-rm-l">Search</button>
				</div>
			</div>
			<div class="col-md-auto text-left">
				<button type="button" class="btn btn-danger btn-sm" id="clearFilterBtn">Clear Filter</button>
			</div>
			<div class="col-md-auto">
				<img src="../property/img/exportpdf.png" alt="option" class="img-set" id="exportToPdf">
				<img src="../property/img/exportexcel.png" alt="option" class="img-set" id="exportToExcel">
			</div>
			</div>