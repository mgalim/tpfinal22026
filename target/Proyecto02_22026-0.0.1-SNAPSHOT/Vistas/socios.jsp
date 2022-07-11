<%@page import="Clases.SociosDAO"%>
<%@page import="Clases.Socios"%>
<%@page import="java.util.List"%>
<%@page import="java.time.format.DateTimeFormatter"%>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Proyecto 2</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
 <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
      integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-kjU+l4N0Yf4ZOJErLsIcvOU2qSb74wXpOhqTvwVx3OElZRweTnQ6d31fXEoRD1Jy" crossorigin="anonymous"></script>
 <script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script>$(document).ready(function() { $("#modal").click(function(){
    $("#eliminarSocio").modal();
  });
});</script>
</head>
<body style=" background-color: #454647 !important;">
<h1 class="text-center text-light my-3">Listado de Socios</h1>

<div  class="container" >
	<div
      class="d-flex justify-content-center align-items-center mb-3"
    >
      <h4 class="text-light text-opacity-75 my-3">Agregar Socio</h4>
      <a role="button"
        class="fa-stack fa-1x text-success ms-3" href="SociosController?accion=nuevo">
        <i class="fa-solid fa-circle fa-stack-2x"></i>
        <i class="fa-solid fa-plus fa-stack-1x fa-inverse"></i>
      </a>
    </div>  
    <div class="table-responsive text-center">
				<table class="table table-md table-striped">
				<thead class="table-dark">
				<tr>
					<th scope="col">Nº</th>
					<th scope="col">Nombre</th>
					<th scope="col">Apellido</th>
					<th scope="col">DNI</th>
					<th scope="col">Mail</th>
					<th scope="col">Fecha</th>
					<th scope="col">Estado</th>
					<th scope="col">Modificar</th>
					<th scope="col">Eliminar</th>
					</tr>				
				</thead>
				
				
				<%
				List<Socios> resultado=null;
				SociosDAO socio=new SociosDAO();
				resultado=socio.listarSocios();
				int getId=0;
				DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/YYYY");				
				
				
				for(int i=0;i<resultado.size();i++)
				{
				String ruta="SociosController?accion=modificar&id="+resultado.get(i).getId_socio();	
				String rutaE="SociosController?accion=eliminar&id="+resultado.get(i).getId_socio();
				%>
				 <tbody class="align-middle">			
				<tr class="table-secondary">
				<td><%=resultado.get(i).getId_socio()%></td>				
				<td class="text-capitalize"><%=resultado.get(i).getNombre()%></td>				
				<td class="text-capitalize"><%=resultado.get(i).getApellido()%></td>
				<td><%=resultado.get(i).getDni()%></td>
				<td><%=resultado.get(i).getMail()%></td>
				<td><%=resultado.get(i).getFecha_alta().format(formatter)%></td>
				<td><%=resultado.get(i).getEstadoToString()%></td>
				<td class="text-center"> <a role="button"
                class="fa-stack fa-1x mt-2" href=<%=ruta%>>
                <i class="fa-solid fa-circle fa-stack-2x"></i>
                <i class="fa-solid fa-pen fa-stack-1x fa-inverse"></i>
              </a></td>
				<td class="text-center"><a data-bs-toggle="modal" data-bs-target="#eliminarSocio" role="button"
                class="fa-stack fa-1x mt-2 text-danger ms-3" <%=getId=resultado.get(i).getId_socio()%>>
                <i class="fa-solid fa-circle fa-stack-2x"></i>
                <i class="fa-solid fa-trash-can fa-stack-1x fa-inverse"></i>
              </a></td>
				</tr>
				
				<%
				}
				%>
				 </tbody>
				</table>
				</div>
			</div>
			<form
  
  class="modal fade"
  id="eliminarSocio"
  data-bs-backdrop="static"
  data-bs-keyboard="false"
  aria-hidden="true"
  action="SociosController?accion=eliminar&id=<%=getId%>"
  method="post"
>
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title fw-bold text-danger">Borrar Socio nº <%=getId%></h3>
        <button
          type="button"
          class="btn-close"
          data-bs-dismiss="modal"
          aria-label="Close"
          
        ></button>
      </div>
      <div class="modal-body text-center">
        <img
          width="96px"
          src="assets/carnet.png"
          alt="icon"
        />
        <h5 class="fw-bold text-danger mt-3">¿Esta seguro que desea borrar este socio?</h5>
      </div>
      <div class="modal-footer text-center">
        <button
          type="button"
          class="btn btn-outline-secondary rounded-pill"
          data-bs-dismiss="modal"
         
        >
          CANCELAR
        </button>
        <button
        	type="submit"
            class="submit text-white btn btn-danger rounded-pill"
          data-bs-dismiss="modal">
          ELIMINAR
        </button>
      </div>
    </div>
  </div>
</form>
	</body>
</html>