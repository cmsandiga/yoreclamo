<#ftl encoding='UTF-8'>
<!DOCTYPE html>
<html lang="es">
  <head>
    <title>Yo Reclamo - ${complain.company.name} - ${complain.title}</title>
    <#include "template/header.ftl">
    <#include "template/analytics.ftl">
  </head>
  <body>
    <#include "template/navigation_bar.ftl">

    <div class="container"> 
      <div class="row">
        <div class="col-md-8">
          <div class="panel panel-primary space-grids">
            <div class="panel-heading"> ${complain.title}</div>
            <div class="panel-body">
              <p><strong> ${complain.company.name} </strong> - Fecha: ${complain.creation?datetime}</p>
              <p></p>
              <p>${complain.body}</p>
            </div>
          </div>
          <div class="col-md-8 space-grids">
            <div class="row">
               <div class="col-md-2">
                <a class="twitter-share-button"
                  rel="canonical"
                  href="https://twitter.com/intent/tweet?text=${complain.company.name} - ${complain.title}&via=YoReclamoPeru"
                  data-count="vertical"
                  >
                </a>
              </div>
              <div class="col-md-2 fb-share-button" data-href="http://yoreclamo.com.pe/reclamo/detalle/${complain.url}" data-layout="box_count" data-count="vertical"></div>
              

            </div>
          </div>
          <div class="col-md-8 space-grids">
            <div class="fb-comments" data-href="http://www.yoreclamo.com.pe/reclamo/detalle/${complain.url}" data-numposts="5" data-colorscheme="light"></div>
          </div>

        </div>

        <div class="col-md-4">
          <div class="panel panel-info">
            <div class="panel-heading text-center"> ${complain.company.name}</div>
            <div class="panel-body">
              <p class="text-center">Reclamos resolvidos: 0%</p>
              <p class="text-center">Reclamos atendidos: 0%</p>
              <p class="text-center" style="color:red"><b>Numero de reclamos: ${complain.company.complainCounter}</b></p>
            </div>
          </div>
          <div class="panel panel-danger" style="padding-bottom:20px">
            <div class="panel-heading text-center">Reclamos Relacionados</div>
            <ul class="list-group">
             <#list relatedComplains as complain>
             <li class="list-group-item"> 
              <a href="/reclamo/detalle/${complain.url}">${complain.company.name} - ${complain.title}</a>
            </li>
            </#list>
          </ul>
        </div>
      </div>
    </div>

  </div>
  <#include "template/footer.ftl">
  <#include "template/scripts_facebook.ftl">
  <#include "template/scripts_twitter.ftl">
  <#include "template/scripts.ftl">
  </body>
</html>