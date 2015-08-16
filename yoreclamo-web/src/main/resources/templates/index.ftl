<#ftl encoding='UTF-8'>
<#-- @ftlvariable type="yoreclamo.view.GenericView" -->
<!DOCTYPE html>
<html lang="es">
  <head>
    <title>Yo Reclamo</title>
    <#include "template/header.ftl"> 
    <#include "template/analytics.ftl">

  </head>
  <body>
    <#include "template/navigation_bar.ftl">
        
    <div class="container">
      <div class="jumbotron">
        <h1>Sitio de defensa al consumidor</h1>
        <p>Yo Reclamo es un nuevo servicio creado con la finalidad de ser un canal de atención online entre los consumidores y las empresas en todo el Perú.</p>
      </div>
    

        <div class="row">
          <div class="col-md-6">       
            <div class="list-group">
                <div class="list-group-item news-feed-danger">
                  <h3 class="list-group-item-heading">
                    Últimos reclamos
                  </h3>
                </div>             
               <#list complains as complain>
                  <a href="reclamo/detalle/${complain.url}" class="list-group-item" title="${complain.title}">
                    <h4 class="list-group-item-heading"> ${complain.title}</h4>
                    <p>${complain.company.name} - Fecha: ${complain.creation?date}</p>
                  </a>
                </#list>
            </div>
          </div>

          <div class="col-md-6">
              <div class="space-grids">
                <div class="fb-like" data-href="https://www.facebook.com/yoreclamoperu" data-layout="standard" data-action="like" data-show-faces="true" data-width="350px" data-share="true"></div>
              </div>
              <div class="list-group">
                      <div class="list-group-item news-feed-solved">
                          <h3 class="list-group-item-heading">
                            Reclamos Solucionados
                          </h3>
                      </div>
                      <div class="list-group-item ">
                          <p class="list-group-item-text ">
                            No existen reclamos solucionados
                          </p>
                      </div>
              </div>
          </div>
        </div>

    </div>

    <#include "template/footer.ftl">
    <#include "template/scripts_facebook.ftl">
    <#include "template/scripts.ftl">
  </body>
</html>