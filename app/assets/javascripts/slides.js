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
      timerId = setTimeout(function(){
         $('.edit_slide').submit()
      }, refreshTimeout)
}

function bindAutoRefresh(){
   $('textarea').keyup(refresh)
   $('textarea').mouseup(refresh)
}

function startup(){
   bindAjax()
   bindAutoRefresh()
}

$(document).ready(startup)
$(document).on('page:load', startup)
