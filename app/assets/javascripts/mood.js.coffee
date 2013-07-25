$ ->
  $(".state i").click (event) ->
    event.preventDefault()
    $("#mood_state").val event.target.id
    $("#new_mood").submit()

  $("#mood_notes").focus ->
    $(this).val ""  if $(this).val() is "(Optional)"

  $("#edit_mood_69").submit ->
    $("#mood_notes").val ""  if $("#mood_notes").val() is "(Optional)"

  $("#start_date, #end_date").keyup ->
    unless rawChartDataKeys.indexOf($(this).val()) is -1
      drawChart()
      $("#permalink")[0].href = "?start_date=" + $("#start_date").val() + "&end_date=" + $("#end_date").val()


