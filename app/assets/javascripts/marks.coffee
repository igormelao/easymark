$(document).on 'turbolinks:load', ->
    $('.date').datepicker({
      format: 'dd-mm-yyyy'
      autoclose: true
      todayHighlight: true
      language: 'fr'
    });
