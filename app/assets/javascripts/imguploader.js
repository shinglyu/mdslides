
function bindImguploader(){
   $('.cloudinary-fileupload')
      .bind('fileuploaddone', function(e, data) { 
         //var resultHtml = 'Please paste this code to where you want the image to be<br>';
         //resultHtml += '<div class="well"> <h4>![' + data.public_id + '](http://res.cloudinary.com/mdslides/image/upload/' + data.public_id + '.' + data.format + ')</h4> </div>';
         //$("#imgUploader .modal-dialog .modal-body").html(resultHtml);
         //alert("Done!");

         $("#imgUploader").modal('hide');
         $('#imgCode').html('![' + data.result.public_id + '](http://res.cloudinary.com/mdslides/image/upload/' + data.result.public_id + '.' + data.result.format + ')');
         $('#imgResult').modal('show');
        $('.progress-bar').css('width', '0%'); 
      })
      .bind('fileuploadprogress', function(e, data) { 
        $('.progress-bar').css('width', Math.round((data.loaded * 100.0) / data.total) + '%'); 
      });

}
addLoadEvent(bindImguploader);


