$ ->
  $(".state i").click (event) ->
    event.preventDefault()
    $("#mood_state").val event.target.id
    $("#new_mood").submit()