class Kirby.Routers.HomeRouter extends Backbone.Router
  initialize: (options) ->
    @publishers = new Kirby.Collections.PublishersCollection()
    @publishers.reset options.publishers
  
  routes:
    ""  : "welcomeHome"
  
  welcomeHome: ->
    @view = new Kirby.Views.Home.WelcomeView(publishers: @publishers)
    $("#publishers").html(@view.render().el)
