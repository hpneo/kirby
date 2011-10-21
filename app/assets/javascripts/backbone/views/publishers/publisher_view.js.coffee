Kirby.Views.Publishers ||= {}

class Kirby.Views.Publishers.PublisherView extends Backbone.View
  template: JST["backbone/templates/publishers/publisher"]
  
  events:
    "click .destroy" : "destroy"
      
  tagName: "tr"
  
  destroy: () ->
    @model.destroy()
    this.remove()
    
    return false
    
  render: ->
    $(this.el).html(@template(@model.toJSON() ))    
    return this