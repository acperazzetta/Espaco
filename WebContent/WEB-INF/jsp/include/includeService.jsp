<%@page import="com.espatial.model.Service"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
    <title>Espaço Árvore - Serviços</title>
    <!-- Bootstrap -->
  <link rel="canonical" href="http://localhost:8080/Flourish_html/">
    
  <link href="/css/bootstrap.min.css" rel="stylesheet">
  <link href="/css/style.css?ver=4" rel="stylesheet">
  <link href="//fonts.googleapis.com/css?family=PT+Sans" rel="stylesheet" type="text/css">
  <link href='//fonts.googleapis.com/css?family=Montserrat' rel='stylesheet' type='text/css'>
  <link href="//fonts.googleapis.com/css?family=Bree+Serif" media="screen" rel="stylesheet" type="text/css" />
  <link href="//fonts.googleapis.com/css?family=Oswald" media="screen" rel="stylesheet" type="text/css" />
  <link href="/css/font-awesome.min.css" media="screen" rel="stylesheet" type="text/css" />

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2respond.min.js"></script>
    <![endif]-->
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->

    <script src="/js/bootstrap.js"></script>
    <script>
    var activeMenu = '#menu-include';

    $(function() {
      $('#id').on('keypress', function(e) {
          if (e.which == 32)
              return false;
      });
  });
    $(document).ready(function(){
      $("#includedMenu").load("/includes/menu.html");
      $("#includedFooter").load("/includes/footer.html");
      $(window).trigger('resize');                  
    });

    function setValues(id, action) {
      $("#action")[0].value = action;
    	$("#id")[0].value = $("#id_" + id)[0].innerText;
      $("#title")[0].value = $("#title_" + id)[0].innerText;
      $("#subtitle")[0].value = $("#subtitle_" + id)[0].innerText;
      $("#text")[0].value = $("#text_" + id)[0].innerText;
      $("#id").attr('readonly', true);
      $('html, body').animate({ scrollTop: 0 }, 'fast');
      switch (action) {
      case "<%=Service.UPDATE%>":
	      $("#button")[0].innerText = "Update";
	      break;

      case "<%=Service.DELETE%>":
        $("#button")[0].innerText = "Delete";
	      break;
      }
    }
    
    function newService() {
      $("#id").attr('readonly', false);
      $("#button")[0].innerText = "Insert";
      $("#action")[0].value = <%=Service.INSERT%>;
      $("#id")[0].value = "";
      $("#title")[0].value = "";
      $("#text")[0].value = "";
      $("#form-messages").addClass("hide");
    }
    
    function confirmSubmit() {
    	if ($("#action")[0].value == <%=Service.DELETE%>)
    		return confirm("Are you sure you want to Delete this Service?");
    	else
    		return true;
    }
        
    </script>
  </head>

  <body role="document">
    <main role="main" class="main clearfix">
    <div id="includedMenu"></div>
    <div class="container">
      <div class="col-xs-12">
        <div class="title_table">
          <div class="title_bar">
            <img data-all="/images/title_include.png" src="/images/title_include.png" alt="logo">
          </div>
        </div>
        <div class="row">
          <div class="col-xs-12">
            <p class="page_title">Include a new Service</p>
          </div>
        </div>
          <div class="col-xs-12">
            <div class="row">
              <div class="col-xs-12">
                <p class="">Put the Service information</p>
              </div>
            </div>


            <div class="row">
              <div data-item="Formulario">
                <form:form id="service" class="form"  modelAttribute="service" method="post" action="/include/includeService.htm" onSubmit="return confirmSubmit();">
                  <form:input type="hidden" path="action" name="action" id="action"/>
                  <div class="row">
                    <div class="col-xs-12">
                      <div class="form-group">
                        <form:input placeholder="Id" path="id" name="id" id="id" class="form-control" required="required" maxlength="20"/> 
                        <small class="help-block"></small>
                      </div>
                      <div class="form-group">
                        <form:input placeholder="Title" path="title" name="title" id="title" class="form-control" required="required" maxlength="50"/> 
                        <small class="help-block"></small>
                      </div>
                      <div class="form-group">
                        <form:input placeholder="SubTitle" path="subtitle" name="subtitle" id="subtitle" class="form-control" required="required" maxlength="50"/> 
                        <small class="help-block"></small>
                      </div>
                      <div class="form-group">
                        <form:textarea placeholder="Put the text here" path="text" name="text" id="text" class="form-control" required="required" style="height: 150px;"></form:textarea>
                        <small class="help-block"></small>
                      </div>
                    </div>
                  </div>
                  <c:if test="${not empty message}">
                  <div class="alert alert-success" id="form-messages">${message}</div>
                  </c:if>
                  <c:if test="${not empty messageError}">
                  <div class="alert alert-danger" id="form-messages">${messageError}</div>
                  </c:if>
                  <div class="containerBtn" style="text-align: center;">
                    <form:button type="reset" class="btn btn-default btn-form btn-form-style_0" style="display: inline-block;" onClick="newService();">New Service</form:button>
                    <form:button id="button" class="btn btn-default btn-form btn-form-style_0" style="display: inline-block;">Insert</form:button>
                  </div>
                </form:form>
              </div>
            </div>
            <div class="row">
              <div class="col-xs-12">
                <p class="">List of current services included</p>
              </div>
            </div>
            <div class="row">
							<table class="table table-striped">
							  <thead>
							    <tr>
                    <th scope="col">#</th>
							      <th scope="col">Id</th>
							      <th scope="col">Title</th>
                    <th scope="col">SubTitle</th>
							      <th scope="col">Text</th>
							      <th scope="col">Edit</th>
                    <th scope="col">Delete</th>
							    </tr>
							  </thead>
                <tbody>
	            <c:if test="${not empty serviceList}">
	              <c:forEach var="service" items="${serviceList}" varStatus="loop"> 
							    <tr>
							      <th scope="row">${loop.index + 1}</th>
							      <td id="id_${service.id}">${service.id}</td>
							      <td id="title_${service.id}">${service.title}</td>
                    <td id="subtitle_${service.id}">${service.subtitle}</td>
							      <td id="text_${service.id}">${service.text}</td>
                    <td class="text-center"><img height="20px" src="/images/icon_edit.png" onClick="setValues('${service.id}', '<%=Service.UPDATE%>');"></td>
                    <td class="text-center"><img height="20px" src="/images/icon_delete.png" onClick="setValues('${service.id}', '<%=Service.DELETE%>');"></td>
							    </tr>              
	              </c:forEach>
	            </c:if>
                </tbody>
              </table>
            </div>

          </div>

      </div>
    </div>
    </main>
    <div id="includedFooter"></div>
  </body>
</html>