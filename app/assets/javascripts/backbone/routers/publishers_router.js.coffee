class Kirby.Routers.PublishersRouter extends Backbone.Router
  initialize: (options) ->
    @publishers = new Kirby.Collections.PublishersCollection()
    @publishers.reset options.publishers

  routes:
    "/new"      : "newPublisher"
    "/index"    : "index"
    "/:id/edit" : "edit"
    "!/publishers/:id"      : "show"

  newPublisher: ->
    @view = new Kirby.Views.Publishers.NewView(collection: @publishers)
    $("#publishers").html(@view.render().el)

  show: (id) ->
    publisher = @publishers.get(id)
    @view = new Kirby.Views.Publishers.ShowView(model: publisher)
    $("#publishers").append(@view.render().el)
    publisher.series ||= new Kirby.Collections.SeriesCollection()
    publisher.series.url = '/publishers/'+publisher.id+'/series.json'
    publisher.series.fetch(
      success: (result) ->
        @view = new Kirby.Views.Series.IndexView(collection: result)
        $('#publishers').append(@view.render().el)
    )
    
  edit: (id) ->
    publisher = @publishers.get(id)

    @view = new Kirby.Views.Publishers.EditView(model: publisher)
    $("#publishers").html(@view.render().el)
  