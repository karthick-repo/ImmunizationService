
<!DOCTYPE html> 
<html lang="en"> 
<head> 
<meta charset="ISO-8859-1"> 
<title>Vaccine</title> 
  
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
        <h1><label>Add Vaccine</label></h1> 
        <hr> 
        <a href="home" id="dashboard" style="margin-right: 40px;">${dashboard}</a> 
        <a href="patients" id="pateints">${patients}</a><br> 
         
    <input type="button" id="Back" value="BACK" style="float: left;" onclick="window.location.href='patients'"><br> 
     
    <form action="addvaccine"> 
    <input type = "hidden" id="document" name="document" value=${searchId}>
    Vaccine:  
        <select id="vaccine" name="vaccine"> 
                <option value="BCG">BCG</option> 
                <option value="DT">DT</option> 
                <option value="DTP">DTP</option> 
                <option value="Hepatitis A">Hepatitis A</option> 
                <option value="Hepatitis B">Hepatitis B</option> 
                <option value="Hepatitis C">Hepatitis C</option> 
                <option value="Influenza">Influenza</option> 
                <option value="Measles">Measles</option> 
                <option value="Pnuemonia">Pnuemonia</option> 
                <option value="VOP">VOP</option> 
                <option value="Yellow Fever">Yellow Fever</option> 
        </select><br> 
         
        <input type="submit" id="submit" name="submit" value="APPLY"> 
    </form> 
    </div> 
   
</body> 
</html> 