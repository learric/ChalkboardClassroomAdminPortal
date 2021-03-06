// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require tether
//= require bootstrap
//= require jquery_ujs
//= require turbolinks
//= require buzz/dist/buzz
//= require flipclock/compiled/flipclock
//= require angular/angular
//= require angular-animate/angular-animate
//= require angular-cookies/angular-cookies
//= require angular-route/angular-route
//= require angular-ui-router/release/angular-ui-router
//= require youtube-iframe-api/youtube-iframe-api
//= require angular-rails-templates
//= require_tree .

$(document).on('page:load', function () {
  $('[ng-app]').each(function () {
    var module = $(this).attr('ng-app');
    angular.bootstrap(this, [module]);
  });
});
