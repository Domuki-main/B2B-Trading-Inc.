package com.ssk3408.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.ssk3408.model.Complaint;

public class OperationDAO {
	Connection connection=null;
	Statement statement=null;
	ResultSet resultSet=null;
	PreparedStatement preparedStatement = null;

	public boolean save(Complaint c) {
		boolean flag = false;

		try {
			String sql = "INSERT INTO complaint(complaintid, department, issue, state, subject, message, email)VALUES" + "('" 
		+ c.getComplaintid() + "','" + c.getDepartment() + "', '" + c.getIssue() + "', '" + c.getState() + "', '" 
					+ c.getSubject() + "', '" + c.getMessage() + "', '" + c.getEmail() +"')";

			connection = DBConnectionUtil.openConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.executeUpdate();
			flag = true;
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return flag;
	}

	public List<Complaint> getComplaint() {
		List<Complaint> list = null;
		Complaint complaint = new Complaint();

		try {
			list = new ArrayList<Complaint>();
			String sql = "SELECT * FROM complaint order by complaintid asc";
			connection = DBConnectionUtil.openConnection();
			statement = connection.createStatement();
			resultSet = statement.executeQuery(sql);

			while (resultSet.next()) {
				complaint = new Complaint();
				complaint.setComplaintid(Integer.parseInt(resultSet.getString("complaintid")));
				complaint.setDepartment(resultSet.getString("department"));
				complaint.setIssue(resultSet.getString("issue"));
				complaint.setState(resultSet.getString("state"));
				complaint.setSubject(resultSet.getString("subject"));
				complaint.setMessage(resultSet.getString("message"));
				complaint.setEmail(resultSet.getString("email"));
				list.add(complaint);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	public boolean checkComplaint(String complaintid) {
		Boolean found = false;
		try {
			String sql = "SELECT * FROM complaint where complaintid=" + complaintid;
			connection = DBConnectionUtil.openConnection();
			statement = connection.createStatement();
			resultSet = statement.executeQuery(sql);
			if (resultSet.next()) {
				found = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return found;
	}

	public Complaint get(String complaintid) {
		Complaint complaint = null;
		try {
			complaint = new Complaint();
			String sql = "SELECT * FROM complaint where complaintid='" + complaintid +"'";
			connection = DBConnectionUtil.openConnection();
			statement = connection.createStatement();
			resultSet = statement.executeQuery(sql);
			if (resultSet.next()) {
				complaint = new Complaint();
				complaint.setComplaintid(Integer.parseInt(resultSet.getString("complaintid")));
				complaint.setDepartment(resultSet.getString("department"));
				complaint.setIssue(resultSet.getString("issue"));
				complaint.setState(resultSet.getString("state"));
				complaint.setSubject(resultSet.getString("subject"));
				complaint.setMessage(resultSet.getString("message"));
				complaint.setEmail(resultSet.getString("email"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return complaint;
	}
	
	public boolean update(Complaint complaint) {
		boolean flag = false;
		try {
			String sql = "UPDATE complaint SET complaintid ='" + complaint.getComplaintid()  + "', department = '" + complaint.getDepartment() + "', "
					+ "issue = '" + complaint.getIssue() + "', state = '" + complaint.getState() + "', subject = '" + complaint.getSubject() 
					+ "', message = '" + complaint.getMessage() + "', email = '" + complaint.getEmail() + "' where complaintid='"
					+ complaint.getComplaintid() + "'";

			connection = DBConnectionUtil.openConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.executeUpdate();
			flag = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	public boolean delete(String complaintid) {
		boolean flag = false;
		try {
			String sql = "DELETE FROM complaint where complaintid='" + complaintid +"'";
			connection = DBConnectionUtil.openConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.executeUpdate();
			flag = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}
	
}
