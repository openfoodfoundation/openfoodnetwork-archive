Darkswarm.directive "ofnExtensibleHeight", ->
  restrict: 'C'
  scope:
    collapsed: false
    toggle: ->
      collapsed = !collapsed
  link: (scope, elem, attrs) ->
    console.log('collapsed: ' + scope.collapsed)
    scope.toggle()
    console.log('collapsed: ' + scope.collapsed)
    height = elem.height()
    console.log height
    #elem.text height
