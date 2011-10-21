Kirby.Views.Series ||= {}

class Kirby.Views.Series.IndexView extends Backbone.View
  template : JST["backbone/templates/series/index"]
  id: '#series'

  initialize: () ->
    _.bindAll(this, 'addOne', 'addAll', 'render')
    @collection.bind('reset', @addAll)

  addAll: () ->
    @collection.each(@addOne)

  addOne: (series, index) ->
    view = new Kirby.Views.Series.SeriesView({model: series})
    series_view = @$(view.render().el).hide()
    @$('#series-list').append(series_view)
    series_view.delay(index*200).fadeIn(300)

  render: ->
    $(@el).html(@template(series: @collection.toJSON() ))
    @addAll()

    return this