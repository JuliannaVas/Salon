<%@ page import="java.sql.*" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page language="java" contentType="text/html"%>
<%@ page import="java.util.Scanner" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link href="style.css" rel="stylesheet" type="text/css">
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
rss = stt.executeQuery("select * From Staff.Position") ;

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
		<input type="text" class="form-control" required name="FirstName" />
	</div>
	<div class="form-group" style="wigth: 80%;">
		<label>Middle name</label>
		<input type="text" class="form-control" required name="MiddleName"/>
	</div>
	<div class="custom-select">
		<label>Position</label>
		<select name="item" class="custom-select">
        <%  while(rss.next()){ %>
            <option><%= rss.getString(2)%></option>
        <% } %>
        </select>
	</div>
	<div class="form-group" style="wigth: 80%;">
		<label>Date of birth</label>
		<input type="date" class="form-control" required name="BirthDate"/>
	</div> 
	
	<div class="form-group" style="wigth: 80%;">
		<label>Phone</label>
		<input type="number" class="form-control" required name="Phone" />
	</div>
	
	<div class="form-group" style="wigth: 80%;">
		<label>Date of hire</label>
		<input type="date" class="form-control" required name="HireDate"/>
	</div>
	
	
	<button type="submit" class="btn btn-primary"> Save</button>
	<a href="Semployees.jsp" class="btn btn-default">Back</a>
	</div>
</form>
<% 
                String s=request.getParameter("item");
                if (s !=null)
                {
                    out.println("Selected  : "+s);
                }
                
                
                
      %>

</body>
<script>
var x, i, j, selElmnt, a, b, c;
/*look for any elements with the class "custom-select":*/
x = document.getElementsByClassName("custom-select");
for (i = 0; i < x.length; i++) {
  selElmnt = x[i].getElementsByTagName("select")[0];
  /*for each element, create a new DIV that will act as the selected item:*/
  a = document.createElement("DIV");
  a.setAttribute("class", "select-selected");
  a.innerHTML = selElmnt.options[selElmnt.selectedIndex].innerHTML;
  x[i].appendChild(a);
  /*for each element, create a new DIV that will contain the option list:*/
  b = document.createElement("DIV");
  b.setAttribute("class", "select-items select-hide");
  for (j = 1; j < selElmnt.length; j++) {
    /*for each option in the original select element,
    create a new DIV that will act as an option item:*/
    c = document.createElement("DIV");
    c.innerHTML = selElmnt.options[j].innerHTML;
    c.addEventListener("click", function(e) {
        /*when an item is clicked, update the original select box,
        and the selected item:*/
        var y, i, k, s, h;
        s = this.parentNode.parentNode.getElementsByTagName("select")[0];
        h = this.parentNode.previousSibling;
        for (i = 0; i < s.length; i++) {
          if (s.options[i].innerHTML == this.innerHTML) {
            s.selectedIndex = i;
            h.innerHTML = this.innerHTML;
            y = this.parentNode.getElementsByClassName("same-as-selected");
            for (k = 0; k < y.length; k++) {
              y[k].removeAttribute("class");
            }
            this.setAttribute("class", "same-as-selected");
            break;
          }
        }
        h.click();
    });
    b.appendChild(c);
  }
  x[i].appendChild(b);
  a.addEventListener("click", function(e) {
      /*when the select box is clicked, close any other select boxes,
      and open/close the current select box:*/
      e.stopPropagation();
      closeAllSelect(this);
      this.nextSibling.classList.toggle("select-hide");
      this.classList.toggle("select-arrow-active");
    });
}
function closeAllSelect(elmnt) {
  /*a function that will close all select boxes in the document,
  except the current select box:*/
  var x, y, i, arrNo = [];
  x = document.getElementsByClassName("select-items");
  y = document.getElementsByClassName("select-selected");
  for (i = 0; i < y.length; i++) {
    if (elmnt == y[i]) {
      arrNo.push(i)
    } else {
      y[i].classList.remove("select-arrow-active");
    }
  }
  for (i = 0; i < x.length; i++) {
    if (arrNo.indexOf(i)) {
      x[i].classList.add("select-hide");
    }
  }
}
/*if the user clicks anywhere outside the select box,
then close all select boxes:*/
document.addEventListener("click", closeAllSelect);
</script>
</html>
<%
String a = request.getParameter("FirstName");
String b = request.getParameter("LastName");
String c = request.getParameter("MiddleName");
String e = request.getParameter("Phone");
String d = request.getParameter("BirthDate");
String f = request.getParameter("HireDate");
String g = request.getParameter("item");


	Connection conn = null;
Statement st = null;
PreparedStatement stmt = null;
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
if (a!=null && b!=null && c!=null && d!=null && e!=null && f!=null)
{
conn = DriverManager.getConnection("jdbc:sqlserver://JULIANNA;instanceName=MSSQLSERVER01;databaseName=Salon;integratedSecurity=true");
//String data = "INSERT INTO Business.Customers (FirstName, LastName, MiddleName, BirthDate, Phone, Description) VALUES (?, ?, ?, ?, ?, ?)";
String data = "EXEC [Sales].INS_Emp @FName=?,@LName=?,@MName=? ,@Phone=?,@DOB=?, @Hire=?, @Position=?";
stmt = conn.prepareStatement(data);
stmt.setString(1, a);
stmt.setString(2, b);
stmt.setString(3, c);
stmt.setString(4, e);
stmt.setString(5, d);
stmt.setString(6, f);
stmt.setString(7, g);

response.setCharacterEncoding("UTF-8");
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");
int i = stmt.executeUpdate();
if (i > 0) {
    System.out.println("success");
    response.sendRedirect("Semployees.jsp");
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

	




%>