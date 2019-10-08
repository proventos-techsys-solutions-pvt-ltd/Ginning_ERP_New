<%@page import="com.prov.bean.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            	<button type="button" id="sidebarCollapse" class="btn btn-info">
                        <i class="fa fa-bars"></i>
                        <span></span>
                    </button>
                    <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <i class="fa fa-bars"></i>
                    </button>
				 <% User currentUser = (User)session.getAttribute("currentSessionUser"); %>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="nav navbar-nav ml-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="#">Daily Setup</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Grading</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Invoicing</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link fa fa-user" > &nbsp;<%= currentUser.getName()%></a> 
                            </li>
                        </ul>
                    </div>
            </nav>