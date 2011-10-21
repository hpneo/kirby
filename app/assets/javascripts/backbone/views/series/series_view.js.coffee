Kirby.Views.Series ||= {}

class Kirby.Views.Series.SeriesView extends Backbone.View
  template: JST["backbone/templates/series/series"]
      
  tagName: 'li'
  
  render: ->
    $(this.el).html(@template(@model.toJSON() ))    
    return this