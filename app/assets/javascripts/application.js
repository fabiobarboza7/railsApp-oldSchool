// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

// Add from BootStrap 4 Docs
//= require jquery
//= require jquery_ujs
//= require popper
//= require bootstrap
//= require dropzone
//= require scrollbar
//= require jquery.inputmask
//= require jquery.inputmask.extensions
//= require jquery.inputmask.numeric.extensions
//= require jquery.inputmask.date.extensions
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .

  // custom dropdown
  function myFunction() {
    document.getElementById("myDropdown").classList.toggle("show-custom");
  }

  // Close the dropdown menu if the user clicks outside of it
  window.onclick = function(event) {
    if (!event.target.matches('.dropdown-content-custom')) {

      var dropdowns = document.getElementsByClassName("dropdown-content");
      var i;
      for (i = 0; i < dropdowns.length; i++) {
        var openDropdown = dropdowns[i];
        if (openDropdown.classList.contains('show-custom')) {
          openDropdown.classList.remove('show-custom');
        }
      }
    }
  }


$(document).on('turbolinks:load', function(){
  $('input[type="tel"]').inputmask("(99) 9 99999999");  //static mask
  // start progressbar
  var bar = $('.progress-bar');
  var percent = $('.percent');
  var status = $('#status');
  var answer;

  $('form').ajaxForm({
    beforeSend: function() {
      status.empty();
      var percentVal = '0%';
      bar.width(percentVal);
      bar.html(percentVal);
      percent.html(percentVal);
    },
    uploadProgress: function(event, position, total, percentComplete) {
      var percentVal = percentComplete + '%';
      // bar.html(percentVal);
      bar.width(percentVal);
      percent.html(percentVal);
      answer = percentVal;
    },
    complete: function(xhr) {
      bar.html(answer);
      status.html(xhr.responseText);
      $('button').removeAttr('disabled');
    }
  });
  // end progressbar
  // start sidebar
  $("#sidebar").mCustomScrollbar({
       theme: "minimal"
  });
  $('#sidebarCollapse').on('click', function () {
    $('#sidebar, #content-bar').toggleClass('active');
    $('.collapse.in').toggleClass('in');
    $('a[aria-expanded=true]').attr('aria-expanded', 'false');
  });
  // end sidebar
});

