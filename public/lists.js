
$(document).ready(function() {


  console.log('list javascript loaded');


function editItem (id) {
    console.log(id+"edit");
  $(id+"edit").click(function() {

    //ANIMATIONS BELOW

    console.log('edit button clicked');

    $(id+"edit").hide('fast', function() {
      //animation occured
    });
    $(id+"text").hide('fast', function() {
      //animation occured
    });

    var itemText = $(id+"text").text();

    $(id+"input").attr('placeholder', itemText);

    $(id+"input").show('fast', function() {
      //animation occured
    });

    $(id+"check").show('fast', function() {
      //animation occured
    });

    $(id+"delete").show('fast', function() {
      //animation occured
    });

  });
  }


  function renameItem () {


    $(id+"check").click(function() {
        console.log("check button clicked");

        var newText = $(id+"input").val();

        console.log($(id+"input").val());

        $(id+"text").text(newText);

        $(id+"input").hide('fast', function() {
          //animation occured
        });

        $(id+"text").show('fast', function() {
          //animation occured
        });

        $(id+"check").hide('fast', function() {
          //animation occured
        });

        $(id+"delete").hide('fast', function() {
          //animation occured
        });

        $(id+"edit").show('fast', function() {
          //animation occured
        });


    });

  }

  function deleteItem(id) {

  }





}); //end of script
