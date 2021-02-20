<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="connection_builder.SqlOperation"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Flyway Project</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
  box-sizing: border-box;
}

body {
  font-family: Arial, Helvetica, sans-serif;
}

/* Style the header */
header {
  background-color: #666;
  padding: 30px;
  text-align: center;
  font-size: 35px;
  color: white;
}

/* Create two columns/boxes that floats next to each other */
nav {
  float: left;
  width: 30%;
  height: 300px; /* only for demonstration, should be removed */
  background: #ccc;
  padding: 20px;
}

/* Style the list inside the menu */
nav ul {
  list-style-type: none;
  padding: 0;
}

article {
  float: left;
  padding: 20px;
  width: 70%;
  background-color: #f1f1f1;
  height: 300px; /* only for demonstration, should be removed */
}

/* Clear floats after the columns */
section::after {
  content: "";
  display: table;
  clear: both;
}

/* Style the footer */
footer {
  background-color: #777;
  padding: 10px;
  text-align: center;
  color: white;
}

/* Responsive layout - makes the two columns/boxes stack on top of each other instead of next to each other, on small screens */
@media (max-width: 600px) {
  nav, article {
    width: 100%;
    height: auto;
  }
}
* {box-sizing: border-box}
body {font-family: "Lato", sans-serif;}

/* Style the tab */
.tab {
  float: left;
  border: 1px solid #ccc;
  background-color: #f1f1f1;
  width: 30%;
  height: 300px;
}

/* Style the buttons inside the tab */
.tab button {
  display: block;
  background-color: inherit;
  color: black;
  padding: 22px 16px;
  width: 100%;
  border: none;
  outline: none;
  text-align: left;
  cursor: pointer;
  transition: 0.3s;
  font-size: 17px;
}

/* Change background color of buttons on hover */
.tab button:hover {
  background-color: #ddd;
}

/* Create an active/current "tab button" class */
.tab button.active {
  background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
  float: left;
  padding: 0px 12px;
  border: 1px solid #ccc;
  width: 70%;
  border-left: none;
  height: 300px;
}
body {
  font-family: Arial;
  color: white;
}

.split {
  height: 50%;
  width: 45%;
  position: inherit;
  z-index: 1;
  top: 0;
  overflow-x: hidden;
  padding-top: 20px;
  color:#544a4a;
}

.left {
  left: 0;
  border: 15px solid black;
  padding: 20px;
  margin-left: 5px;
  font: black;
  font-size: large;
  font-style: italic;
}

.right {
  right: 0;
font-color:#544a4a;
}

.centered {
  position: absolute;
  top: 20%;
  left: 50%;
  transform: translate(-50%, -50%);
  text-align: center;
}


input[type=text] {
  width: 95%;
  padding: 12px 20px;
  margin: 8px 0;
  box-sizing: border-box;
  border: solid;
  background-color: white;
  color: black;
}
/* .tabbutton {
  background-color: #544a4a;
  color:white;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  transition: 0.3s;
  font-size: 17px;
} */
</style>
<script>


function update(){
		var cmb= document.getElementById("cmbperson").value;
		var cost=cmb*3000;
		document.getElementById("Totalcost").value=cost;
	
}
$(document).ready(function () {
    $("form").submit(function () {

      var clikedForm = $(this); // Select Form

      if (clikedForm.find("[name='Cardnumber']").val() == '') {
        alert('Enter Valid Card number');
        return false;
      }
      if (clikedForm.find("[name='Name']").val() == '') {
        alert('Enter  valid Name on card');
        return false;
      }
      if (clikedForm.find("[name='Mobilenumber']").val() == '') {
          alert('Enter  valid Mobile number');
          return false;
        }

    });
  });




function date(){
	 var today = new Date();
	 var date = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate();
	 var time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
	 var dateTime = date+' '+time;
	   document.getElementById("currentDateTime").value = dateTime;}



$(document).ready(function () {
    $("form").submit(function () {

      var clikedForm = $(this); // Select Form

      if (clikedForm.find("[name='username']").val() == '') {
        alert('Enter Valid username');
        return false;
      }
      if (clikedForm.find("[name='password']").val() == '') {
        alert('Enter  valid password');
        return false;
      }

    });
  });



</script>
</head>
<body onload="date()">

<div style="marging-left:500px;">
<div style="margin-left:600px;">
Current Date Time:
<input type="text" id="currentDateTime" disabled>
 </div>
</div>

<header>
  <h2>Flyway Booking System</h2>
  
</header>

<section>

<div class="split left">
  <div class="centered">
      <h2>Flight Details</h2>
    <p>
    
    </p>
  </div>
  <div>
  <form>
  <label for="fname">ID</label>
  <input type="text" disabled="disabled" id="ID" name="Id" value="<%=request.getParameter("id")%>">
  <label for="lname">Source City</label>
  <input type="text" disabled="disabled" id="Source_city" name="Source_City" value="<%=request.getParameter("source_city")%>">
  <label for="lname">Destination City</label>
  <input type="text"  disabled="disabled" id="Dest_city"name="Dest_City" value="<%=request.getParameter("dest_city")%>">
  <label for="lname">Date of journey</label>
  <input type="text" disabled="disabled" id="Date" name="Date" value="<%=request.getParameter("date")%>">

</form></div>
    
</div>

<div class="split right">
  <div class="centered">
 
    <h2>Your Payment Details:</h2>
    <p></p>
  </div>
   
   <h2>Enter Your Debit Card details:</h2>
  <form  action="PaymentResult.jsp" method="get">
  <label for="Cardnumber"> Enter Your Debit Card Number</label>
  <input type="text" id="Cardnumber" name="Cardnumber" required>
  <label for="lname">Enter the Full Nam on Your Card</label>
  <input type="text" id="Name" name="Name" required>
  <label for="lname">Enter Your Mobile number</label>
  <input type="text" id="Mobilenumber"name="Mobilenumber" required>
  <label for="lname">Total Travel cost Per Person:</label>
  <input type="text" disabled="disabled" id="Cost" name="Cost" value="3000 per person">
  <br>
	<label for="lname">Select number of person for the journey:</label>
	<select name="cmbperson" id="cmbperson" onchange="update()">
    <option value="1">1</option>
    <option value="2">2</option>
    <option value="3">3</option>
    <option value="4">4</option>
    <option value="5">5</option>
    <option value="6">6</option>
	</select>
	<br>
	  <input type="text" id="Totalcost"name="Totalcost" disabled="disabled">
	<br>
	<input type="submit" value="Pay Now" class="tabbutton">
	</form>
</div>


</section>

<footer>
  <p><h2>Project developed by Karthick M</h2></p>
</footer>


</body>
</html>