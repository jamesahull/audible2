<script type="text/javascript">
  

  var viewpost = {
    onReady: function() {
      $("#content").autosize();  
      $(".standard-submit").click(viewpost.submitPost);    
      $("#deleteStory").click(viewpost.deleteStory);
    },

    submitPost: function() {
      var action= $(this).attr('name');
      $("#formAction").val(action);
      $("#editPostForm").submit(); 
    },

    deleteStory: function() {
    var action= $(this).attr('name');
    var askDelete = confirm("Are you sure you want to delete this story?");
    if (askDelete==true) {
      $("#formAction").val(action);
      $("#editPostForm").submit();
      return true;}
    else {return false;}
    
    }
  };

  $( document ).ready( viewpost.onReady);
  
 </script>