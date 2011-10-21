class Kirby.Models.Series extends Backbone.Model
  paramRoot: 'series'

  defaults:
    name: null
    publisher_id: null
  
class Kirby.Collections.SeriesCollection extends Backbone.Collection
  model: Kirby.Models.Series
  url: '/series'