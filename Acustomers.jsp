<%@ page import="java.sql.*, com.industry.controller.Customers" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link href="./style.css" rel="stylesheet" type="text/css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="//cdn.jsdelivr.net/gh/dmhendricks/bootstrap-grid-css@4.1.3/dist/css/bootstrap-grid.min.css" />
<title>Add</title>
<body>
 <%

Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
Connection con = null;
con = DriverManager.getConnection("jdbc:sqlserver://JULIANNA;instanceName=MSSQLSERVER01;databaseName=Salon;integratedSecurity=true");
Statement stt = con.createStatement();
ResultSet rss = null;
rss = stt.executeQuery("select * From Business.Customers") ;

%> 
<p><br></p>
<form action="" method="post">
	<div class="container">
	<div class="form-group" style="wigth: 80%;">
		<label>Last name</label>
		<input type="text" class="form-control" required name="LastName" />
	</div>
	
	<div class="form-group" style="wigth: 80%;">
		<label>First name</label>
		<input type="text" class="form-control" required name="FirstName"/>
	</div>
	<div class="form-group" style="wigth: 80%;">
		<label>Middle name</label>
		<input type="text" class="form-control" required name="MiddleName" />
	</div>
	<div class="form-group" style="wigth: 80%;">
		<label>Date of birth</label>
		<input type="date" class="form-control" required name="BirthDate"/>
	</div> 
	
	<div class="form-group" style="wigth: 80%;">
		<label>Phone</label>
		<input type="text" class="form-control" required name="Phone" />
	</div>
	
	<div class="form-group" style="wigth: 80%;">
		<label>Note</label>
		<textarea type="text" class="form-control" name="Description"/></textarea>
	</div>
	<button type="submit" class="btn btn-primary"> Save</button>
	<a href="./Scustomers.jsp" class="btn btn-default">Back</a>
	</div>
</form>

</body>

</html>

<%

String a = request.getParameter("FirstName");
String b = request.getParameter("LastName");
String c = request.getParameter("MiddleName");
String d = request.getParameter("BirthDate");
String e = request.getParameter("Phone");
String f = request.getParameter("Description");

	Connection conn = null;
Statement st = null;
PreparedStatement stmt = null;
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
if (a!=null && b!=null && c!=null && d!=null && e!=null && f!=null)
{
conn = DriverManager.getConnection("jdbc:sqlserver://JULIANNA;instanceName=MSSQLSERVER01;databaseName=Salon;integratedSecurity=true");
String data = "INSERT INTO Business.Customers (FirstName, LastName, MiddleName, BirthDate, Phone, Description) VALUES (?, ?, ?, ?, ?, ?)";
stmt = conn.prepareStatement(data);
stmt.setString(1, a);
stmt.setString(2, b);
stmt.setString(3, c);
stmt.setString(4, d);
stmt.setString(5, e);
stmt.setString(6, f);

response.setCharacterEncoding("UTF-8");
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");
int i = stmt.executeUpdate();

if (i > 0) {
    System.out.println("success");
    response.sendRedirect("Scustomers.jsp");
} else {
    System.out.println("stuck somewhere");
    out.println("<script type=\"text/javascript\">");  
	out.println("alert('Error');");  
	out.println("</script>");	
	
	out.println("<script type=\"text/javascript\">");  
	out.println("window.history.go(-1);");  
	out.println("</script>");	 
	
}
} 


//{
//	out.println("<script type=\"text/javascript\">");  
	//out.println("alert('Sorry, Password or Username Error');");  
	//out.println("</script>");	
	
//}

%>