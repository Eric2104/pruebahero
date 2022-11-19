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

.cont-datos{
    max-width: 700px;
    color: black;
    font-size: 25px;
    padding: 0%;
    margin: auto;
}
.btn-reg{
    max-width: 100px;
    margin: auto;
}
.dv-datos{
    display: flex;
    flex-direction: row;
}
.dv-datos p{
    min-width: 400px;
}
.dv-datos input{
    height: 20px;
    margin: auto;
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
        <form action="registro.jsp" method="post">
        <div class="contenedor-carta">
            <h1><strong> Estudiantes </strong></h1>
            <br/>
            <div class="cont-datos">
                <div class="dv-datos">
                    <p>Ingrese el nombre del estudiante</p>
                    <input type="text" name="nombre_est" placeholder="Nombre del estudiante" required>
                </div>
                <div class="dv-datos">
                    <p>Ingrese el año de ingreso:</p>
                    <input type="number" name="anio_ingre" placeholder="Año" required min="0.00">
                </div>
                <div class="dv-datos">
                    <p>Ingrese el correo del estudiante:</p>
                    <input type="text" name="correo_est" placeholder="Correo del estudiante" required>
                </div>
            </div>
            <div class="btn-reg"><input type="submit" value="Registrar estudiante" ></div>
        </div>
    </form>
    </section>
    <%
	  String nombre = request.getParameter("nombre_est");
	  int anio = Integer.parseInt(request.getParameter("anio_ingre"));
	  String correo = request.getParameter("correo_est");
	  try{
		  Class.forName("com.mysql.jdbc.Driver");
		  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mibase", "root", "admin");
		  Statement st = con.createStatement();
		  st.executeUpdate("INSERT INTO estudiante(nombre, anio, correo) VALUES ('"+nombre+"',"+anio+",'"+correo+"');");
	  }catch(Exception e){
		  out.print(e);
	  } 
	%>
</body>
</html>