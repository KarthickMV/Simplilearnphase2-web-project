<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
</style>
<script>

function openCity(evt, cityName) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }
  document.getElementById(cityName).style.display = "block";
  evt.currentTarget.className += " active";
}

// Get the element with id="defaultOpen" and click on it
document.getElementById("defaultOpen").click();

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

function openCity(evt, panel) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }
  document.getElementById(panel).style.display = "block";
  evt.currentTarget.className += " active";
}






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
 <div class="tab">
  <button class="tablinks" onclick="openCity(event, 'London')" id="defaultOpen">Admin</button>
  <button class="tablinks" onclick="openCity(event, 'Paris')">User</button>
 <!--  <button class="tablinks" onclick="openCity(event, 'Tokyo')">Tokyo</button> -->
</div>

<div id="London" class="tabcontent">
  <h3>Admin Login form</h3>
  <p></p>
  
  <!-- Form starts -->
  
  
<!-- Login form for Admin starts -->

<form action="Login_Check" method="post"  >
<table id="form_table">
<tr id="table_row"></tr>
<tr id="table_row">
<td id="column"><span id="label">Username :</span></td>
<td id="column"><input type="text" name="username" required></td>
</tr>
<tr id="table_row">
<td id="column"><span id="label">Password :</span></td>
<td id="column"><input type="password" name="password" required></td>
</tr>
<!-- <tr id="table_row">
<td id="column"><span id="label">Email Id :</span></td>
<td id="column"><input type="password" name="email"></td>
</tr> -->
<tr id="table_row">
<td id="column">
<input id="reg_button" type="submit" value="Login">

</td>
</tr>
</table>
</form>


<!-- Registration form ends -->

  <!-- Form ends -->
  
</div>

<div id="Paris" class="tabcontent">
  <h3>User</h3>
  <p></p> 
  <!-- Form starts -->


 
<!-- Form ends -->
<form action="Login_Check" method="post" >
<table id="form_table">
<tr id="table_row"></tr>
<tr id="table_row">
<td id="column"><span id="label">User name :</span></td>
<td id="column"><input type="text" name="username" required></td>
</tr>
<tr id="table_row">
<td id="column"><span id="label">Password :</span></td>
<td id="column"><input type="password" name="password" required></td>
</tr>
<tr id="table_row">
<td id="column">
<input id="reg_button" type="submit" value="Login">
</td>
</tr>
</table>
</form>
<!-- Form ends -->


<!-- Form ends -->  
  
</div>

<!-- <div id="Tokyo" class="tabcontent">
  <h3>Tokyo</h3>
  <p>Tokyo is the capital of Japan.</p>
</div> -->

</section>

<footer>
  <p><h2>Project developed by Karthick M</h2></p>
</footer>

</body>
</html>