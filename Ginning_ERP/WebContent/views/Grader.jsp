<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="../styles/sharedstyle.css">
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <title>Grading Operation</title>
  </head>
  <body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light custom-navbar">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
          <a class="navbar-brand" href="#">Company Logo</a>
          <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
            <li class="nav-item active">
              <a class="nav-link" href="#">Dashboard <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">WB Operation</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="GradingOperations.html">Grading Operation</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="FinalPurchase.html">Final Purchasing</a>
            </li>
          </ul>
        </div>
    </nav>
    <div class="container-fluid">
      <div class="row">
       
        <div class="col-md-8">
          <form action="">
            <div class="form-row">
              <div class="col-md-6">
                  <label>Authorized Grader Name</label>&nbsp;&nbsp;
                  <input type="search" class="form-control form-control-sm" name="authoGradeName" placeholder="Mr. ABC XYZ" readonly>
              </div>
              <div class="col-md-4">
                  <label for="">Search RST</label>&nbsp;&nbsp;
                  <input type="search" class="form-control form-control-sm" name="searchRst" placeholder="RST">
              </div>
              <div class="col-md-2">
                  <button type="button" class="btn btn-primary btn-sm custom-btn">Fetch</button>
              </div>
              <div class="col-md-6">
                <label>Customer Name & Address</label>
                <textarea class="form-control form-control-lg"></textarea>
              </div>
              <div class="col-md-6">
                <label>Grade Record</label>
                <input type="input" class="form-control form-control-sm" placeholder="">
                <label>Date</label>
                <input type="date" class="form-control form-control-sm" placeholder="">
              </div>
             
              <div class="col-md-12">
              <table class="table table-bordered custom-table">
                    <thead>
                      <tr>
                        <th>Sr No</th>
                        <th>Material</th>
                        <th>Quantity</th>
                        <th>Grade</th>
                        <th>Rate</th>
                        <th>Total</th> 
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
                        <td>15000</td>
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
                        <td>15000</td>
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
                        <td>15000</td>
                      </tr>
                    </tbody>
                </table>
              </div>
              <div class="col-md-12">
                  <div class="d-inline-flex p-2 bd-highlight">
                      <button type="button" class="btn btn-primary btn-sm custom-button-submit">Submit</button>
                      <button type="button" class="btn btn-primary btn-sm custom-button-submit">PDF</button>
                  </div>
              </div>
            </div>
          </form>
        </div>
        <div class="col-md-4">
          <input type="text" class="form-control form-control-sm" placeholder="search">
          <table class="table">
            <thead>
              <tr>
                <th>#</th>
                <th>RST No</th>
                <th>Material</th>
                <th>Qty</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>1</td>
                <td>4357</td>
                <td>Cotton</td>
                <td>100 Qntl</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </body>
  
  <script>
  	
  	
  
  </script>
  
</html>