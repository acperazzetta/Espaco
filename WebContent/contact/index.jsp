<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.espatial.model.Clinic"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
List<Clinic> lstClinic = new ArrayList<Clinic>();

  try {
    Class.forName("com.mysql.jdbc.Driver");  
    String url="jdbc:mysql://localhost:3306/espatial?useSSL=false";
    Connection connection = DriverManager.getConnection(url, "admin", "admin");  

    String strquery = "select * from clinics;";
    Statement st= connection.createStatement();
    ResultSet rs= st.executeQuery(strquery);
    
    while (rs.next()) {
    	Clinic clinic = new Clinic();
    	clinic.setId(rs.getString("id"));
    	clinic.setTitle(rs.getString("title"));
    	clinic.setText(rs.getString("text"));
    	clinic.setLat(rs.getFloat("lat"));
    	clinic.setLon(rs.getFloat("lon"));
    	lstClinic.add(clinic);
    }
  }
  catch(Exception e)
  {
    System.out.println("Could not connect");
  }
%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
    <title>Espaço Árvore - Entre em Contacto</title>
    <!-- Bootstrap -->
  <link rel="canonical" href="http://localhost:8080/Flourish_html/">
    
  <link href="/css/bootstrap.min.css" rel="stylesheet">
  <link href="/css/style.css?ver=4" rel="stylesheet">
  <link href="//blueimp.github.io/Gallery/css/blueimp-gallery.min.css" rel="stylesheet">
  <link href="/css/bootstrap-image-gallery.css" rel="stylesheet">
  <link href="//fonts.googleapis.com/css?family=PT+Sans" rel="stylesheet" type="text/css">
  <link href='//fonts.googleapis.com/css?family=Montserrat' rel='stylesheet' type='text/css'>
  <link href="//fonts.googleapis.com/css?family=Bree+Serif" media="screen" rel="stylesheet" type="text/css" />

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/js/bootstrap.js"></script>
    <script src="/js/modernizr.js"></script>
    <script src="/js/app.js"></script>
    <script language="javascript">
    
    var activeMenu = '#menu-contact';
    
    $(function(){
      $("#includedMenu").load("/includes/menu.html");
      $("#includedFooter").load("/includes/footer.html");
    });
    
    $(document).ready(function(){
      // Get the form.
      var form = $('#ajax-contact');
      //alert(form);
      // Get the messages div.
      var formMessages = $('#form-messages');

   // Set up an event listener for the contact form.
      $(form).on("submit", function(event) {
        // Stop the browser from submitting the form.
        event.preventDefault();
        // Serialize the form data.
        var formData = $(form).serialize();
        $.ajax({
          type: 'POST',
          url: $(form).attr('action'),
          data: formData
        }).success(function(response) {
          // Make sure that the formMessages div has the 'success' class.
          $(formMessages).removeClass('hide');
          $(formMessages).removeClass('alert-danger');
          $(formMessages).addClass('alert-success');

          // Set the message text.
          $(formMessages).text(response);

          // Clear the form.
          $('#name').val('');
          $('#phone').val('');
          $('#email').val('');
          $('#message').val('');
        }).fail(function(data) {
          // Make sure that the formMessages div has the 'error' class.
          $(formMessages).removeClass('hide');
          $(formMessages).removeClass('alert-success');
          $(formMessages).addClass('alert-danger');

          // Set the message text.
          if (data.responseText !== '') {
              $(formMessages).text(data.responseText);
          } else {
              $(formMessages).text('Oops! Houve um problema e sua mensagem não pode ser enviada. Por favor tente mais tarde. Obrigado.');
          }
        });       
      });
    });
    </script>
  </head>

  <body>
    <main role="main" class="main clearfix">
    <div id="includedMenu"></div>
    <div class="container">
      <div class="col-xs-12">
        <div class="title_table">
          <div class="title_bar">
            <img data-all="/images/title_contact.png" src="/images/title_contact.png" alt="logo">
          </div>
        </div>
        <div class="row">
          <div class="col-xs-12">
            <p class="page_title">Contacto</p>
          </div>
        </div>
        <div class="row">
          <div class="col-xs-12">
            <div id="map" style="width:100%;height:400px;">
          </div>
        </div>


        <div class="row">
          <div class="col-xs-6">
            <div class="row">
              <div class="col-xs-12">
                <p class="">Envie nos uma mensagem</p>
              </div>
            </div>
            <div class="row">
              <div data-item="Formulario">
                <form id="ajax-contact" enctype="multipart/form-data" class="form" method="post" action="mailer.php">
                  <div class="row">
                    <div class="col-xs-12">
                      <div class="form-group">
                        <label class="text-ellipsis sr-only">Subject</label> 
                        <input placeholder="Nome" type="text" name="name" id="name" data-mask="" class="form-control" required=""> 
                        <small class="help-block"></small>
                      </div>
                      <div class="form-group">
                        <label class="text-ellipsis sr-only">Telefone</label>
                        <input placeholder="Telefone" type="text" name="phone" id="phone" data-mask="" class="form-control" required=""> 
                        <small class="help-block"></small>
                      </div>
                      <div class="form-group">
                        <label class="text-ellipsis sr-only">E-mail</label> 
                        <input placeholder="Email" type="email" name="email" id="email" class="form-control" required=""> 
                        <small class="help-block"></small>
                      </div>
                      <div class="form-group">
                        <label class="text-ellipsis sr-only">Text </label>
                        <textarea placeholder="Sua mensagem aqui" name="message" id="message" class="form-control" required="" style="height: 150px;"></textarea>
                        <small class="help-block"></small>
                      </div>
                    </div>
                  </div>
                  <div class="alert alert-success hide" id="form-messages"></div>
                  <div class="containerBtn" style="text-align: center;">
                    <button type="submit" class="btn-form btn-form-style_0" style="display: inline-block;">Enviar</button>
                  </div>
                </form>
              </div>
            </div>
          </div>
          <div class="col-xs-6">
            <div class="row">
              <div class="col-xs-12">
                <p class="">Informações de Contacto</p>
              </div>
              <div class="col-xs-12">
                <img class="icon" data-all="/images/icon_mobile.png" src="/images/icon_mobile.png">
                (+351) 924 105 721
              </div>
              <div class="col-xs-12">
                <img class="icon" data-all="/images/icon_facebook.png" src="/images/icon_facebook.png">
                /espacoarvore
              </div>
              <div class="col-xs-12">
                <img class="icon" data-all="/images/icon_email.png" src="/images/icon_email.png">
                contacto@espacoarvore.com
              </div>
              <div class="col-xs-12">
                <img class="icon" data-all="/images/icon_home.png" src="/images/icon_home.png">
                Av. Elias Garcia, 93 - 1 e 2 andar - Lisboa
              </div>
            </div>
          </div>
        </div>

      </div>
    </div>
    </main>
    <div id="includedFooter"></div>
<script>
function myMap() {
  var mapCanvas = document.getElementById("map");
  var bounds = new google.maps.LatLngBounds();

  var mapOptions = {
    center: new google.maps.LatLng(53.34, -6.23), zoom: 12
  };
  
  var map = new google.maps.Map(mapCanvas, mapOptions);
  
  // Multiple markers location, latitude, and longitude
  var markers = [
  	 <% for (Clinic clinic: lstClinic) {%>
      ['<%=clinic.getTitle()%>', <%=clinic.getLat()%>, <%=clinic.getLon()%>],
    <%}%>
  ];
  
  var infoWindowContent = [
    <% for (Clinic clinic: lstClinic) {%>

    ['<div class="info_content">' +
    '<h3><%=clinic.getTitle()%></h3>' +
    '<%=clinic.getText()%></div>'],
    <%}%>
    
    ];
  
  // Place each marker on the map  
  for( i = 0; i < markers.length; i++ ) {
      var position = new google.maps.LatLng(markers[i][1], markers[i][2]);
      bounds.extend(position);
      marker = new google.maps.Marker({
          position: position,
          map: map,
          title: markers[i][0]
      });
      var infoWindow = new google.maps.InfoWindow(), marker, i;  

      // Add info window to marker    
      google.maps.event.addListener(marker, 'click', (function(marker, i) {
          return function() {
              infoWindow.setContent(infoWindowContent[i][0]);
              infoWindow.open(map, marker);
          }
      })(marker, i));

      // Center the map to fit all markers on the screen
      map.fitBounds(bounds);
  }
}

</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBdXbkzkJkHYzXVtrqTA6a4etASCVrxzrM&callback=myMap"></script>
    
  </body>
</html>