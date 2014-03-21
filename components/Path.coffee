noflo = require 'noflo'
paper = require 'paper'

class Path extends noflo.Component
  constructor: ->
    @path = new paper.Path()

    @inPorts =
      strokeColor: new noflo.Port 'object'
      moveTo: new noflo.Port 'object'
      lineTo: new noflo.Port 'object'

    @inPorts.strokeColor.on('data', @setStrokeColor)
    @inPorts.moveTo.on('data', @moveTo)
    @inPorts.lineTo.on('data', @lineTo)

  setStrokeColor: (data) =>
    @path.strokeColor = data

  moveTo: (data) =>
    @path.moveTo(data)
  
  lineTo: (data) =>
    @path.lineTo(data)

exports.getComponent = -> new Path
