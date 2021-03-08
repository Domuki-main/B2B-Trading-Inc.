<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>List of Complaints</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
		<h1>List of Complaints</h1>

		<p style="color: #b50e0e">${NOTIFICATION}</p>
		<hr>
			<table class="table table-striped table-bordered">
				<tr class="thead-dark">
					<th>ID</th>
					<th>Department</th>
					<th>Issue</th>
					<th>State of Residence</th>
					<th>Subject</th>
					<th>Description</th>
					<th>Email</th>
				</tr>

				<c:forEach items="${complaint}" var="complaint">

					<tr>
						<td>${complaint.complaintid}</td>
						<td>${complaint.department}</td>
						<td>${complaint.issue}</td>
						<td>${complaint.state}</td>
						<td>${complaint.subject}</td>
						<td>${complaint.message}</td>
						<td>${complaint.email}</td>
					</tr>
				</c:forEach>
			</table> 
			<input type="button" class="btn btn-success"
			onclick="window.location.href = '/B2B-FinalProject/FormComplaintUpdateCheck.jsp'"
			value="Edit" /> 
			<input type="button" class="btn btn-success"
			onclick="window.location.href = '/B2B-FinalProject/FormComplaintDeleteCheck.jsp'"
			value="Delete" />
			<input type="button" class="btn btn-success"
			onclick="window.location.href = '/B2B-FinalProject/index.jsp'"
			value="Back" /> 
	</div>
</body>
</html>
