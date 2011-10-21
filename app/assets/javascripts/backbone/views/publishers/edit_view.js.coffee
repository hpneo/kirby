Kirby.Views.Publishers ||= {}

class Kirby.Views.Publishers.EditView extends Backbone.View
  template : JST["backbone/templates/publishers/edit"]
  
  events :
    "submit #edit-publisher" : "update"
    
  update : (e) ->
    e.preventDefault()
    e.stopPropagation()
    
    @model.save(null,
      success : (publisher) =>
        @model = publisher
        window.location.hash = "/#{@model.id}"
    )
    
  render : ->
    $(this.el).html(this.template(@model.toJSON() ))
    
    this.$("form").backboneLink(@model)
    
    return this