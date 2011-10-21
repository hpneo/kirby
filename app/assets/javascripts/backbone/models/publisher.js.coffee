class Kirby.Models.Publisher extends Backbone.Model
  paramRoot: 'publisher'

  defaults:
    name: null
  
class Kirby.Collections.PublishersCollection extends Backbone.Collection
  model: Kirby.Models.Publisher
  url: '/publishers'