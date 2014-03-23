noflo = require 'noflo'

class Path extends noflo.Component
  description: 'Creates a Paper.js Path object'
  icon: 'pencil-square'
  constructor: ->
    if paper
      @path = new paper.Path()

    @inPorts =
      strokeColor: new noflo.Port 'string'
      fillColor: new noflo.Port 'string'
      moveTo: new noflo.Port 'object'
      lineTo: new noflo.Port 'object'
      add: new noflo.Port 'object'

    @inPorts.strokeColor.on('data', @setStrokeColor)
    @inPorts.fillColor.on('data', @setFillColor)
    @inPorts.moveTo.on('data', @moveTo)
    @inPorts.lineTo.on('data', @lineTo)
    @inPorts.add.on('data', @add)

    @outPorts =
      path: new noflo.Port 'object'

  setStrokeColor: (data) =>
    if @path
      @path.strokeColor = data
      @compute()

  setFillColor: (data) =>
    if @path
      @path.fillColor = data
      @compute()

  moveTo: (data) =>
    if @path
      @path.moveTo(data)
      @compute()
  
  lineTo: (data) =>
    if @path
      @path.lineTo(data)
      @compute()

  add: (data) =>
    if @path
      @path.add(data)
      @compute()

  compute: () ->
    if @outPorts.path.isAttached()
      @outPorts.path.send @path

exports.getComponent = -> new Path
