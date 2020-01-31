$(function() {
  var password  = '.main-sign_up_pass';
  var passcheck = '#js-passcheck';
  
  $(passcheck).change(function() {
      if ($(this).prop('checked')) {
          $(password).attr('type','string');
      } else {
          $(password).attr('type','password');
      }
  });
});