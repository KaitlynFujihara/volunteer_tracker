$(document).ready(function(){
  $('#main.logo').hover()

  $("#create").submit(function() {
    if ($("#projectinput").val()) === "") {
        alert('You need to type in a project!');
        return false;
    }
})
