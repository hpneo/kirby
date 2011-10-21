Kirby.Views.Publishers ||= {}

class Kirby.Views.Publishers.NewView extends Backbone.View    
  template: JST["backbone/templates/publishers/new"]
  
  events:
    "submit #new-publisher": "save"
    
  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )
    
  save: (e) ->
    e.preventDefault()
    e.stopPropagation()
      
    @model.unset("errors")
    
    @collection.create(@model.toJSON(), 
      success: (publisher) =>
        @model = publisher
        window.location.hash = "/#{@model.id}"
        
      error: (publisher, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )
    
  render: ->
    $(this.el).html(@template(@model.toJSON() ))
    
    this.$("form").backboneLink(@model)
    
    return this