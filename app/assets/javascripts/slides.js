var timerId 

function bindAjax() {
   $(".edit_slide").bind("ajax:success", function(){
      $("iframe")[0].contentDocument.location.reload(true)
   }
   ).bind("ajax:error", function(){
      alert(e);
   })
}

function refresh(){
     
      clearTimeout(timerId)
      var refreshTimeout = 2000 //ms
      timerId = setTimeout( refreshNow, refreshTimeout)
}

function refreshNow(){
         $('.edit_slide').submit()
}

function bindAutoRefresh(){
   $('textarea').keyup(refresh)
   $('textarea').mouseup(refresh)
}

function bindRefreshBtn(){
   $('#refresh').click(refreshNow);
}

function startup(){
   bindAjax();
   bindAutoRefresh();
   bindRefreshBtn();
}

addLoadEvent(startup)
//$(document).ready(startup)
//$(document).on('page:load', startup)
