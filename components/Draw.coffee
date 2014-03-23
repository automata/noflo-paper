noflo = require 'noflo'

class Draw extends noflo.Component
  description: 'Draws the current Paper.js scene graph'
  icon: 'pencil-square'
  constructor: ->
    @inPorts =
      draw: new noflo.Port 'object'

    @inPorts.draw.on('data', @draw)

  draw: (data) =>
    if paper
      paper.view.draw()

exports.getComponent = -> new Draw
