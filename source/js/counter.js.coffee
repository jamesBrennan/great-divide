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
    grammar = @deathGrammar(number_dead)
    $('.children').html grammar.noun
    $('.has').html grammar.verb

  drawMoney: (seconds) ->
    $('#money').html @calculateMoney(seconds)

  deathGrammar: (number_dead) ->
    if number_dead == 1
      noun: 'CHILD'
      verb: 'HAS'
    else
      noun: 'CHILDREN'
      verb: 'HAVE'

  draw: () ->
    seconds_elapsed = (new Date().getTime() - @LOAD_TIME) / 1000.0
    @drawDeath(seconds_elapsed)
    @drawMoney(seconds_elapsed)
    requestAnimationFrame => @draw()
