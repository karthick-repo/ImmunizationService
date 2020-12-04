<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html> 
<html lang="en"> 
<head> 
<meta charset="ISO-8859-1"> 
<title>Patients</title> 
  
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
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="/jfn.js"></script>
 
</head> 
  
<body> 
    <div class="dimen"> 
        <h1><label>${title}</label></h1> 
        <hr> 
        <a href="home" id="dashboard" style="margin-right: 40px;">${dashboard}</a> 
        <a href="patients" id="pateints">${patients}</a> 
        <h1><strong><label id="patientList">Patient List</label></strong></h1> 
         
        <form action="getpatient"> 
            <input type="number" required="required" value="document" id="documentSearch" name="documentSearch"> 
            <input type="submit" id="search" value="SEARCH"> 
        </form> 
         
        <input type="button" value="ADD PATIENT" id="addPatient" 
            onclick="window.location.href='addpatient'"><br> 
        
        <table> 
         <caption> </caption>
            <c:if test="${empty toppatients}"> 
                </br><label id="message">There are no patients</label> 
            </c:if>
  
            <c:if test="${not empty toppatients}"> 
                    <th scope="col">NAME</th> 
                    <th scope="col">AGE</th> 
                    <th scope="col">DOCUMENT</th> 
                    <th scope="col">VACCINE</th> 
                    
                <c:forEach items='${toppatients}' var="data" varStatus="count">                                     
                    <tr> 
                        <td id="name${count.count}">${data.name}</td> 
                        <td id="birth${count.count}">${data.birth}</td> 
                        <td id="document${count.count}">${data.document}</td> 
                        <td id="vaccine${count.count}">${data.vaccine}</td> 
                    </tr> 
                </c:forEach> 
            </c:if> 
        </table>      
    </div> 
</body> 
</html> 