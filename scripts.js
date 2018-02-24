// function editDefinition () {
//   var edit = prompt('What would you like to change your definition to?')
// }
//
// function addDefition(){
//   var add = prompt("What definition would you like to add?")
// }

$(document).ready(function(){
  $("#add").click(function(event) {
    event.preventDefault();
      $('.newdef').toggle();
      });
    });
