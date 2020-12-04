<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="ISO-8859-1"> 
<title>Patient Page</title> 
  
<style type="text/css"> 
input, select { 
    margin: 5px; 
    width: 150px; 
} 
  
table { 
    width: 75%; 
    height: auto; 
    text-align: center; 
} 
  
div.dimen { 
    border: 2px solid black; 
    margin-left: 25%; 
    text-align: center; 
    padding: 4px; 
    width: 50%; 
} 
</style> 
  
</head> 
<body> 
    <div class="dimen"> 
    <h1><label id="title">${title}</label></h1> 
    <hr> 
    <a href="home" style="margin-right: 40px;">${dashboard}</a> 
    <a href="patients">${patients}</a><br> 
     
    <input type="button" id="Back" value="BACK" style="float: left;" onclick="window.location.href='patients'"><br> 
    <h3 align="center"><strong>Patient - ${patient.getName()}</strong></h3> 
     
    <table style="float: center; text-align: center;"> 
        <tr> 
            <td><label>Name</label></td> 
            <td>${patient.getName()}</td> 
        </tr> 
        <tr> 
            <td><label>Birth</label></td> 
            <td>${patient.getBirth()}</td> 
        </tr> 
        <tr> 
            <td><label>Age</label></td> 
            <td>${patientAge}</td> 
        </tr> 
        <tr> 
            <td><label>Document</label></td> 
            <td id="docs">${patient.getDocument()}</td> 
        </tr> 
    </table> 
     
    <div style="float: center;"> 
             
        <input type="button" id="addApplication" name="addvaccine" value="ADD VACCINE"  onclick="window.location.href='http://localhost:8080/vaccine'"> 
    </div> 
   
     
    <div style="text-align: center;"> 
        <h3><strong>Vaccine History</strong></h3> 
         
        <table style="float: center; text-align: center;"> 
            <th> 
                <td><label>Vaccine</label></td> 
                <td><label>Age</label></td> 
            </th>
            <c:forEach items='${topvaccines}' var="data" varStatus="count"> 
            <tr>
            	<td> ${data.document}</td>
            	<td> ${data.vaccine}</td>
            	<td> ${patientAge}</td>
            </tr>
            </c:forEach> 
        </table> 
    </div> 
    </div> 
     
    <script type="text/javascript"> 
        function sendDoc(){         	
            var doc = document.getElementById("docs"); 
            session.setAttribute("doc", doc);
            return doc; 
        }  
             
    </script>     
  
</body> 
</html> 