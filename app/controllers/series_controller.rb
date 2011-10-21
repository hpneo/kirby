class SeriesController < InheritedResources::Base
  respond_to :json, :html, :js

  belongs_to :publisher, :optional => true
end