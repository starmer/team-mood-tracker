$ ->
  $(".state i").click (event) ->
    event.preventDefault()
    $("#mood_state").val event.target.id
    $("#new_mood").submit()

  $("#mood_notes").focus ->
    $(this).val ""  if $(this).val() is "(Optional)"

  $("#edit_mood_69").submit ->
    $("#mood_notes").val ""  if $("#mood_notes").val() is "(Optional)"
