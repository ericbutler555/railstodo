// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require_tree .

jQuery(document).ready(function($){

  $('body').on('mouseenter', '.fa-circle', function(){
    $(this).addClass('fas fa-check-circle')
      .removeClass('far fa-circle')
      .css('color', '#28a745');
  });

  $('body').on('mouseleave', '.fa-check-circle:not(.done)', function(){
    $(this).addClass('far fa-circle')
      .removeClass('fas fa-check-circle')
      .attr('style', '');
  });

  $('[data-toggle="tooltip"]').tooltip();

  $('body').on('click', '.edit-btn', function(){
    $(this).closest('.list-group-item').children('.item-editor').slideToggle(200);
  });

});
