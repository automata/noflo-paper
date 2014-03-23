noflo = require 'noflo'

class Point extends noflo.Component
  description: 'Creates a Paper.js Point object'
  icon: 'pencil-square'
  constructor: ->
    @x = null
    @y = null
    if paper
      @point = new paper.Point()

    @inPorts =
      array: new noflo.Port 'array'
      x: new noflo.Port 'number'
      y: new noflo.Port 'number'

    @inPorts.array.on('data', @setArray)
    @inPorts.x.on('data', @setX)
    @inPorts.y.on('data', @setY)

    @outPorts =
      point: new noflo.Port 'object'

  setArray: (data) =>
    if @point
      @point.x = @x = data[0]
      @point.y = @y = data[1]
      @compute()

  setX: (data) =>
    if @point
      @point.x = @x = data
      @compute()

  setY: (data) =>
    if @point
      @point.y = @y = data
      @compute()

  compute: () ->
    if @x? and @y?
      if @outPorts.point.isAttached()
        @outPorts.point.send @point

exports.getComponent = -> new Point
