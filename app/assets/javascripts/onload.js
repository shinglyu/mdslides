function addLoadEvent(func) {
  var oldonload = window.onload;
  if (typeof window.onload != 'function') {
    window.onload = func;
    $(document).ready(func)
    $(document).on('page:load', func)
    
  } else {
     var newonload = function() {
       if (oldonload) { oldonload(); }
        func();
     }
     window.onload = newonload;
     $(document).ready(newonload)
     $(document).on('page:load', newonload)

  }
}
