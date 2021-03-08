<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Lodge-Your-Complaint</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
	<div class="container" align="center">
		<h1><font color="red">Welcome to B2B Trading Inc.</font></h1>
		<p>The <b>B2B Trading Inc.</b> site provides a gateway to various applications.</p>
		<p>If you encounter any problems or issues with our staff, please feel free to contact the following person in-charge for assistance</p>
		<p style="color: #b50e0e">${NOTIFICATION}</p>
		<hr>
		<table class="table table-striped table-bordered">
			<tr class="thead-dark">
				<th>No.</th>
				<th>Name</th>
				<th>Contact</th>
				<th>Email</th>
			</tr>
			<tr>
				<th>1.</th>
				<th>Ms. Amirah Atasha</th>
				<th>03-82837822</th>
				<th>amira@b2b.com.my</th>
			</tr>
			<tr>
				<th>2.</th>
				<th>Mr. Ramalinggam</th>
				<th>03-82837823</th>
				<th>rama@b2b.com.my</th>
			</tr>
			<tr>
				<th>3.</th>
				<th>En. Mohd Nor</th>
				<th>03-82837824</th>
				<th>mohdnor@b2b.com.my</th>
			</tr>
		</table>
		<form name="myForm" action="Controller" method="get">
		<p>To <b>lodge</b> a complaint online please click <a href="Controller?action=LODGE">HERE</a></p>
		<p>To <b>display</b> complaints please click <a href="Controller?action=LIST">HERE</a></p>
		</form>
	</div>
</body>
</html>