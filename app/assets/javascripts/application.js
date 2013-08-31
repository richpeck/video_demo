// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.core
//= require jquery.ui.draggable
//= require turbolinks
//= require jquery-fileupload/basic
//= require confirm
//= require_tree ./jquery


/*-- Modal Popups --*/
$("a[rel*=leanModal]").leanModal( { top: 300, overlay : 0.8, closeButton: ".modal_close" } );
