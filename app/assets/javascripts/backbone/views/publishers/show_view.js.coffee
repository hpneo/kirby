Kirby.Views.Publishers ||= {}

class Kirby.Views.Publishers.ShowView extends Backbone.View
  template: JST["backbone/templates/publishers/show"]

  render: ->
    $(this.el).html(@template(@model.toJSON() ))
    return this