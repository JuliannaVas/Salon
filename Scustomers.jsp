<%@ page import="java.sql.*, com.industry.controller.*" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="./style.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="//cdn.jsdelivr.net/gh/dmhendricks/bootstrap-grid-css@4.1.3/dist/css/bootstrap-grid.min.css" />
<title>Customers</title>

<style type="text/css">

table.table th {
    background-color: #DBD8D8;
    background-image: url(../Content/SiteImages/1.png);
}

table.table th:hover {
    background-color: #73C6B6;
    background-image: none;
}

</style>
</head>
<body>
<br>
<div class="container" style="width: 80%; margin-right: 20px">
<div class="col-md-6"> 
<a href="./Acustomers.jsp" class="btn btn-primary" style="margin: 25px 0px;">Add new client</a>
</div>
<body>
<table id="mytable" class="table" style="background-color:white;">
	<thead>
	<tr>
		
		<th onclick="sortTable(1)">Last name</th>
		<th onclick="sortTable(2)">First name</th>
		<th onclick="sortTable(3)">Middle name</th>
		<th>Date of birth</th>
		<th>Phone</th>
		<th>Date modified</th>
		<th>Note</th>
		<th class="text-center"></th>
		</tr>
	</thead>
	
	<%
	try {
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
    Connection con = null;
    con = DriverManager.getConnection("jdbc:sqlserver://JULIANNA;instanceName=MSSQLSERVER01;databaseName=Salon;integratedSecurity=true");
    Statement stmt = null;
    stmt = con.createStatement();
    
    String query = "select * from Business.Customers";
    ResultSet rs = null;
    response.setCharacterEncoding("UTF-8");
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html;charset=UTF-8");
    rs = stmt.executeQuery(query);
    int i=0;
	while(rs.next()){
		%>

	<tr>
	
	<td><%=rs.getString("LastName") %></td>
	<td><%=rs.getString("FirstName") %></td>
	<td><%=rs.getString("MiddleName") %></td>
	<td><%=rs.getString("BirthDate") %></td>
	<td><%=rs.getString("Phone") %></td>
	<td><%=rs.getString("DateMod") %></td>	
	<td><%=rs.getString("Description") %></td>
	<td style="width: 20%"> 
	<a href="./Ecustomers.jsp?u=<%=rs.getString("CustomerID")%>"> <button type = "button" class="btn btn-warning">Edit</button></a>
	<a href="./Dcustomers.jsp?id=<%=rs.getString("CustomerID")%>" > <button type = "button" onclick="return confirm('Ви впевнені, що хочете видалити товар?');" class="btn btn-danger">Delete</button></a>
	 
	</td>
	</tr>
	
<% 
i++ ;
}
con.close();
} catch (Exception e) {
e.printStackTrace();
}
%>


<script>
function sortTable(n) {
  var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
  table = document.getElementById("mytable");
  switching = true;
  //Set the sorting direction to ascending:
  dir = "asc"; 
  /*Make a loop that will continue until
  no switching has been done:*/
  while (switching) {
    //start by saying: no switching is done:
    switching = false;
    rows = table.rows;
    /*Loop through all table rows (except the
    first, which contains table headers):*/
    for (i = 1; i < (rows.length - 1); i++) {
      //start by saying there should be no switching:
      shouldSwitch = false;
      /*Get the two elements you want to compare,
      one from current row and one from the next:*/
      x = rows[i].getElementsByTagName("TD")[n];
      y = rows[i + 1].getElementsByTagName("TD")[n];
      /*check if the two rows should switch place,
      based on the direction, asc or desc:*/
      if (dir == "asc") {
        if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
          //if so, mark as a switch and break the loop:
          shouldSwitch= true;
          break;
        }
      } else if (dir == "desc") {
        if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
          //if so, mark as a switch and break the loop:
          shouldSwitch = true;
          break;
        }
      }
    }
    if (shouldSwitch) {
      /*If a switch has been marked, make the switch
      and mark that a switch has been done:*/
      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
      switching = true;
      //Each time a switch is done, increase this count by 1:
      switchcount ++;      
    } else {
      /*If no switching has been done AND the direction is "asc",
      set the direction to "desc" and run the while loop again.*/
      if (switchcount == 0 && dir == "asc") {
        dir = "desc";
        switching = true;
      }
    }
  }
}
</script>
</table>
</div>
</body> 
</html>
