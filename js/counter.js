(function() {

  window.Counter = function() {
    return {
      LOAD_TIME: new Date().getTime(),
      INCOME_PER_SECOND: 7605.3076529473,
      DEATHS_PER_SECOND: 0.25462962962962965,
      load_time: new Date().getTime(),
      calculateDeath: function(seconds) {
        return Math.floor(seconds * this.DEATHS_PER_SECOND);
      },
      calculateMoney: function(seconds) {
        return (seconds * this.INCOME_PER_SECOND).formatMoney(0, '.', ',');
      },
      drawDeath: function(seconds) {
        var number_dead;
        number_dead = this.calculateDeath(seconds);
        $('#death').html(number_dead);
        return $('.children').html(this.deathGramar(number_dead));
      },
      drawMoney: function(seconds) {
        return $('#money').html(this.calculateMoney(seconds));
      },
      deathGramar: function(number_dead) {
        if (number_dead === 1) {
          return 'child has';
        } else {
          return 'children have';
        }
      },
      draw: function() {
        var seconds_elapsed,
          _this = this;
        seconds_elapsed = (new Date().getTime() - this.LOAD_TIME) / 1000.0;
        this.drawDeath(seconds_elapsed);
        this.drawMoney(seconds_elapsed);
        return requestAnimationFrame(function() {
          return _this.draw();
        });
      }
    };
  };

}).call(this);
