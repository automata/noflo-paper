noflo = require 'noflo'
paper = require 'paper'

class Setup extends noflo.Component
  constructor: ->
    @inPorts =
      element: new noflo.Port 'object' # dom canvas

    @inPorts.element.on('data', @setup)

  setup: (element) =>
    paper.setup(element)
    

exports.getComponent = -> new Setup
