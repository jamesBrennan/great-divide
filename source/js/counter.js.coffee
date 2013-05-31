window.Counter = () ->
  LOAD_TIME: new Date().getTime()
  INCOME_PER_SECOND: 7605.3076529473
  DEATHS_PER_SECOND: 0.25462962962962965

  load_time: new Date().getTime()

  calculateDeath: (seconds) ->
    Math.floor(seconds * @DEATHS_PER_SECOND)

  calculateMoney: (seconds) ->
    (seconds * @INCOME_PER_SECOND).formatMoney(0, '.', ',')

  drawDeath: (seconds) ->
    number_dead = @calculateDeath(seconds)
    $('#death').html number_dead
    $('.children').html @deathGramar(number_dead)

  drawMoney: (seconds) ->
    $('#money').html @calculateMoney(seconds)

  deathGramar: (number_dead) ->
    if number_dead == 1 then 'child has' else 'children have'

  draw: () ->
    seconds_elapsed = (new Date().getTime() - @LOAD_TIME) / 1000.0
    @drawDeath(seconds_elapsed)
    @drawMoney(seconds_elapsed)
    requestAnimationFrame => @draw()
