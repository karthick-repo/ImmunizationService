
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> 

<html> 
<head>
<meta charset="ISO-8859-1"> 
<title>Home</title> 
  
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
        
        <h1><label id="title">Immunization Service</label></h1> 
        <a href="home" style="margin-right: 40px;">Dashboard</a> 
        <a href="patients">Patients</a>

		<table> 
            <c:if test="${empty data}" > 
                </br><label id="message">There are no patients</label> 
            </c:if>
  
            <c:if test="${not empty data}"> 
                    <th>NAME</th> 
                    <th>AGE</th> 
                    <th>DOCUMENT</th> 
                    <th>VACCINE</th> 
                    
                <c:forEach items='${data}' var="dt" varStatus="count">                                     
                    <tr> 
                        <td id="name${count.count}">${dt.name}</td> 
                        <td id="birth${count.count}">${dt.birth}</td> 
                        <td id="document${count.count}">${dt.document}</td> 
                        <td id="vaccine${count.count}">${dt.vaccine}</td> 
                    </tr> 
                </c:forEach> 
            </c:if> 
        </table>  
	</div> 
</body> 
</html> 