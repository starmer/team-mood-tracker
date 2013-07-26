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
      renderNotes()

  renderNotes();

renderNotes = ->
  $("#notes_table").html ""
  startIndex = rawChartDataKeys.indexOf($("#start_date").val())
  endIndex = rawChartDataKeys.indexOf($("#end_date").val())
  i = startIndex

  while i <= endIndex
    tmp = []
    moodsByDate = rawMoodData[rawChartDataKeys[i]]
    j = 0

    while j < moodsByDate.length
      mood = moodsByDate[j]
      $("#notes_table").append "<tr><td class=\"icon\"><i class=\"icon-" + getIcon(mood.state) + " icon-3x\"></i></td><td>" + mood.notes + "</td><td class=\"date\">" + rawChartDataKeys[i] + "</td></tr>"  if mood.notes
      j++
    i++

getIcon = (state) ->
  icons =
    happy: "smile"
    indifferent: "meh"
    sad: "frown"

  icons[state]