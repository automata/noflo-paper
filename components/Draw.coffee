noflo = require 'noflo'
paper = require 'paper'

class Draw extends noflo.Component
  constructor: ->
    @inPorts =
      draw: new noflo.Port 'object'

    @inPorts.draw.on('data', @draw)

  draw: (data) =>
    paper.view.draw()

exports.getComponent = -> new Draw
