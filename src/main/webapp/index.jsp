<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistema escuela</title>
</head>
<style>

body{
    background-color: #183446;
}
ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #CDCDCD;
}

li {
    float: left;
}

li a {
    display: block;
    color: black;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
    transition: 0.3s;
}

li a:hover {
    background-color: #111;
    color: white;
    transition: 0.3s;
    text-decoration: underline;
}


.contenedor-carta{
    background-color: #CDCDCD;
    max-width: 800px;
    margin: auto;
    margin-top: 40px;
    padding-top: 20px;
    border-radius: 10px;
    box-shadow: 2px 1px 6px rgb(66, 66, 66);
    padding-bottom: 30px;
}
.contenedor-carta h1{
    
    text-align: center;
    color: black;
    font-family: "Open Sans", Helvetica, Arial, sans-serif!important;

}
.contenedor-carta p{
    color: black; 
    font-family: "Open Sans", Helvetica, Arial, sans-serif!important;

}

table{
    width: 100%;
    background-color: white;
    text-align: left;
    border-collapse: collapse;

}
th,td{
    padding: 10px;
    padding-left: 30px;
}
thead{
    background-color: #246355;
    border-bottom: solid 5px #0f362d;
    color: white;
}
tr:nth-child(even){
    background-color: #ddd;
}

</style>
<body>
    <nav>
        <ul>
            <li><a href="index.jsp">Mostrar alumnos </a></li>
            <li><a href="registro.jsp">Agregar alumnos</a></li>
          </ul>
    </nav>
    <section>
        <div class="contenedor-carta">
            <h1><strong> Estudiantes </strong></h1>
            <div>
                <table>
                    <thead>
                        <th>Nombre</th>
                        <th>Ingreso</th>
                        <th>Correo</th>
                    </thead>
  <%
	  String driver = "com.mysql.jdbc.Driver";
	  String connectionUrl = "jdbc:mysql://localhost:3306/";
	  String database = "mibase";
	  String userid = "root";
	  String password = "admin";
	  try{
		  Class.forName("com.mysql.jdbc.Driver");
	  }catch(Exception e){
		  out.print(e);
	  }
	  Connection connection = null;
	  Statement statement = null;
	  ResultSet resultSet = null;
	  
	  try{
		  connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/mibase", "root", "admin");
		  statement=connection.createStatement();
		  String sql ="select * from estudiante";
		  resultSet = statement.executeQuery(sql);
		  while(resultSet.next()){
  %>
                    <tr>
                        <td><%=resultSet.getString("nombre") %></td>
                        <td><%=resultSet.getString("anio") %></td>
                        <td><%=resultSet.getString("correo") %></td>
                    </tr>
<%
			}
			connection.close();
			} catch (Exception e) {
			e.printStackTrace();
			}
%>
                </table>
            </div>
        </div>
    </section>
</body>
</html>