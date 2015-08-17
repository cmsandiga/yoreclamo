  <#ftl encoding='UTF-8'>
  <!DOCTYPE html>
  <html lang="es">
    <head>
      <title>Ingresar Reclamo</title>
      <#include "template/header.ftl">
      <#include "template/analytics.ftl">
      <link href="/css/select2.min.css" rel="stylesheet">
    </head>
    <body>
      <#include "template/navigation_bar.ftl"> 

      <div class="container">
        <div class="row">
          <div class="col-md-6" >
            <div style="text-align:center;padding-top:50px">
              <h1>Ingresa tu reclamo de forma fácil y rápida</h1>
              <img src="/img/steps.png" alt="">
              <h2>En 2 sencillos pasos</h2>

              <h4>Tu reclamo aparecerá en nuestra pagina principal</h4>
            </div>
          </div>
          <div class="col-md-6 " >
              <form id="complain-form" role="form" class="form-main">
                  <fieldset id="complain-fields">
                    <div class="row">

                      <h3><strong>Paso 1: </strong>Detalle su reclamo</h3>
                      
                      <div class="form-group">    

                        <label for="company" class="control-label">Empresa</label>
                        <select id="company" name="company.id"  class="form-control js-example-responsive" style="width: 100%">
                            <option></option>
                            <#list companies as company>
                              <option value="${company.id}">${company.name}</option>
                            </#list>
                          </select>
                      </div>

                      <div class="form-group">
                        <label for="title" class="control-label">Título del reclamo</label>
                        <input id="title" name="title" type="text" class="form-control" placeholder="Ejem: No me dejan cancelar mi línea" required/>
                      </div>

                      <div class="form-group">
                          <label for="body" class="control-label">Describa su reclamo</label>
                          <textarea id="body" name="body" class="form-control" rows="10" placeholder="Describa su reclamo detalladamente indicando: fecha, número de atendimiento, numero de veces que intente solucionar el problema.  Ejem: El día 25 de mayo, me acerque al servicio al cliente de la empres XYZ....."></textarea>
                      </div>
                      <div class="form-group pull-right">
                          <a id="btn-step1" class="btn btn-danger" href="#" role="button" style="background: #e12e36;font-size:18px"> <span class="glyphicon glyphicon-align-left glyphicon-arrow-right" aria-hidden="true"></span>   Continuar</a>
                      </div>
                    </div>
                  </fieldset>
                  <fieldset style="display:none" id="contact-fields">              
                    <div class="row">
                      <h3><strong>Paso 2:</strong>Información de contacto</h3>
                      <h6 style="color:red">*Esta información es privada y solo será compartida con la empresa</h6>
                      <div class="form-group">                    
                        <label for="name" class="control-label">Nombres completos</label>
                        <input id="name" name="name" type="text" class="form-control" placeholder="Nombres completos" required/>
                      </div>
                      <div class="form-group">
                          <label for="dni" class="control-label">DNI</label>
                          <input id="dni" name="dni" minlength="8"  type="text" class="form-control" placeholder="Ingrese su DNI"  onkeypress='return event.charCode >= 48 && event.charCode <= 57' required />
                      </div>
                      <div class="form-group">
                          <label for="email" class="control-label">Email</label>
                          <input id="email" name="email" type="email" class="form-control" placeholder="Ingrese un email válido" required/>
                      </div>
                      <div class="form-group">
                          <label for="phone" class="control-label">Teléfono</label>
                          <input id="phone" name="phone" minlength="8" type="tel" class="form-control" placeholder="Celular o Fijo (provincia con código de ciudad)"   onkeypress='return event.charCode >= 48 && event.charCode <= 57' required/>
                      </div>
                    </div>
                    <div class="row">
                      <div class="form-group pull-right">
                          <a id="btn-register-complain"  class="btn btn-danger" href="#" role="button" style="background: #e12e36;font-size:18px"> <span class="glyphicon glyphicon-align-left glyphicon-hand-right" aria-hidden="true"></span>   Reclamar</a>
                      </div>
                    </div>
                  </fieldset>
              </form>
          </div>
        </div>    
      </div>
      <#include "template/footer.ftl">
      <#include "template/modal.ftl">
      <#include "template/scripts.ftl">
      <#include "template/scripts_form.ftl">
    </body>
  </html>