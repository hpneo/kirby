Kirby.Views.Home ||= {}

class Kirby.Views.Home.WelcomeView extends Backbone.View
  template : JST["backbone/templates/home/welcome"]
  id: '#publishers'

  initialize: () ->
    _.bindAll(this, 'addOne', 'addAll', 'render')
    @options.publishers.bind('reset', @addAll)

  addAll: () ->
    @options.publishers.each(@addOne)

  addOne: (publisher, index) ->
    view = new Kirby.Views.Home.PublisherView({model: publisher})
    publisher_view = @$(view.render().el).hide()
    @$('#publishers-list').append(publisher_view)
    publisher_view.delay(index*500).fadeIn(800)

  render: ->
    $(@el).html(@template(publishers: @options.publishers.toJSON() ))
    @addAll()

    return this