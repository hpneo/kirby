Kirby.Views.Home ||= {}

class Kirby.Views.Home.PublisherView extends Backbone.View
  template : JST["backbone/templates/home/publisher"]
  tagName: 'li'

  render: ->
    $(this.el).html(@template(@model.toJSON() ))    
    return this