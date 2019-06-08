<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<%

String id = request.getParameter("d");
//int no = Integer.parseInt(id);

Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
Connection conn = null;
conn = DriverManager.getConnection("jdbc:sqlserver://JULIANNA;instanceName=MSSQLSERVER01;databaseName=Salon;integratedSecurity=true");
Statement st=conn.createStatement();
st.executeUpdate("delete from Staff.Employees where EmployeeID='"+id+"'");
response.sendRedirect("/Login-Registration_Form-master/Semployees.jsp");

%>

