<#ftl encoding='UTF-8'>
<#-- @ftlvariable type="yoreclamo.view.ComplainDetailView" -->
<!DOCTYPE html>
<html lang="es">
  <head>
    <title>Yo Reclamo - ${detail.company} - ${detail.title}</title>
    <#include "template/header.ftl">
    <#include "template/analytics.ftl">
  </head>
  <body>
    <#include "template/navigation_bar.ftl">

    <div class="container"> 
      <div class="row">
        <div class="col-md-8">
          <div class="panel panel-primary space-grids">
            <div class="panel-heading"> ${detail.title}</div>
            <div class="panel-body">
              <p><strong> ${detail.company} </strong> - Fecha: ${detail.creation?datetime}</p>
              <p></p>
              <p>${detail.body}</p>
            </div>
          </div>
          <div class="col-md-8 space-grids">
            <div class="row">
               <div class="col-md-2">
                <a class="twitter-share-button"
                  rel="canonical"
                  href="https://twitter.com/intent/tweet?text=${detail.company} - ${detail.title}&via=YoReclamoPeru"
                  data-count="vertical"
                  >
                </a>
              </div>
              <div class="col-md-2 fb-share-button" data-href="http://yoreclamo.com.pe/reclamo/detalle/${detail.url}" data-layout="box_count" data-count="vertical"></div>
              

            </div>
          </div>
          <div class="col-md-8 space-grids">
            <div class="fb-comments" data-href="http://www.yoreclamo.com.pe/reclamo/detalle/${detail.url}" data-numposts="5" data-colorscheme="light"></div>
          </div>

        </div>

        <div class="col-md-4">
          <div class="panel panel-info">
            <div class="panel-heading text-center"> ${detail.company}</div>
            <div class="panel-body">
              <p class="text-center">Reclamos resolvidos: 0%</p>
              <p class="text-center">Reclamos atendidos: 0%</p>
              <p class="text-center" style="color:red"><b>Numero de reclamos: ${detail.complainCounter}</b></p>
            </div>
          </div>
          <div class="panel panel-danger" style="padding-bottom:20px">
            <div class="panel-heading text-center">Reclamos Relacionados</div>
            <ul class="list-group">
             <#list detail.relatedLinks as v>
             <li class="list-group-item"> 
              <a href="/reclamo/detalle/${v.url}">${v.company} - ${v.title}</a>
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