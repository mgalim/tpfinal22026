<%@page import="Clases.SociosDAO"%>
<%@page import="Clases.Socios"%>
<%@page import="java.util.List"%>  

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
<title>Modificar Socio</title>
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
 <script>$(document).ready(function(){

	    $('.needs-validation').on('submit', function(e) {
	      if (!this.checkValidity()) {
	        e.preventDefault();
	        e.stopPropagation();
	      }

	      $(this).addClass('was-validated');
	    });

	});</script>
</head>
 <body style=" background-color: #454647 !important;">
			
				<%
				String id=request.getParameter("id");
				int mid;
				mid=Integer.parseInt(id);				
				Socios resultado=null;
				SociosDAO  socio=new SociosDAO();
				resultado=socio.mostrarSocio(mid);
				%>		
	 <div class="container mt-4 d-flex justify-content-center">
      <form style="max-width: 800px;border-radius: 12px;padding:30px 40px; background-color: #ffffff;" class="mt-3 g-3 m-auto needs-validation" action="SociosController?accion=actualizar" method="post" novalidate>
		<input type="hidden"  class="form-control" id="id" name="id"  value=<%=resultado.getId_socio() %> required>
		<h2 class="text-center text-primary my-3" >Modificar Socio</h2>
		    <div class="row gy-2 gx-3 align-items-center m-auto">
		    	<div class="col-md-6">
          	<label for="nombre" class="form-label">Nombre</label>
          	<input type="text" class="form-control" id="nombre" name="nombre" value=<%=resultado.getNombre()%> maxlength="45" required>
        	 <div class="valid-feedback">Luce bien!</div>
              <div class="invalid-feedback">Te olvidaste algo.</div>
        	</div>
        	<div class="col-md-6">
          		<label for="apellido" class="form-label">Apellido</label>
          		<input type="text" class="form-control" id="apellido" name="apellido" value=<%=resultado.getApellido()%> maxlength="45" required>
        	 <div class="valid-feedback">Luce bien!</div>
              <div class="invalid-feedback">Te olvidaste algo.</div>
        	</div>
         </div>
        <div class="row gy-2 gx-3 align-items-center m-auto">
            <div class="col col-md-3 mb-2">
            <label for="dni" class="form-label">Dni</label>
            <input type="number" class="form-control" id="dni" name="dni" value=<%=resultado.getDni()%> min="1999999" max="99999999" required>
           <div class="valid-feedback">Luce bien!</div>
              <div class="invalid-feedback">Rango invalido.</div>
          </div>
          <div class="col-md-3">
            <label for="fecha_alta" class="form-label">Fecha de Alta</label>
            <input type="date" class="form-control" id="fecha_alta" placeholder="25-04-1977" pattern="dd-mm-yyyy" name="fecha_alta" value=<%=resultado.getFecha_alta()%> required>
           <div class="valid-feedback">Luce bien!</div>
              <div class="invalid-feedback">Por favor ingresa un valor valido.</div>
          </div>
          <div class="col-md-5">
            <label for="mail" class="form-label">Mail</label>
            <input type="email" class="form-control" id="mail" name="mail" value=<%=resultado.getMail()%> maxlength="45" required>
          <div class="valid-feedback">Luce bien!</div>
              <div class="invalid-feedback">Por favor ingresa un valor valido.</div>
          </div>
           <div class="d-flex d-md-block justify-content-center col-6 col-md-1 mt-md-4 pt-3 form-check m-auto">
            <input class="form-check-input" type="checkbox" id="estado" name="estado" value="1" <%if(resultado.getEstado()==1){out.print("checked=\"checked\"");}%> ">
            <input type="hidden" value="0" id="estadonull" name="estado" />
            <label class="form-check-label px-2" for="estado">Activo</label>
          </div>
        </div>
        <div class="text-center">
          <button type="submit" class="submit col-2 text-white btn btn-primary rounded-pill mt-3">Modificar</button>
        </div>
      </form>
    </div>
  </body>
</html>