// $(document).ready(function() {
//   // This is called after the document has loaded in its entirety
//   // This guarantees that any elements we bind to will exist on the page
//   // when we try to bind to them

// //   // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
// // });


$(document).ready(function()
{ 
  setTimeout(function()
  {
    populate_available_rooms();
  }, 2000);

  function populate_available_rooms()
  {
    console.log("test")
    $.ajax(
    {
      url:'/available_room',
      type: "GET",
      success:function(result)
      {
        $(".show_available_room").html(result);
      },
      error: function(jqXHR, textStatus, errorThrown) 
      {

      }
    });
  };
});