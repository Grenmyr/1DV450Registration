class Position < ActiveRecord::Base
  reverse_geocoded_by :lat, :lng
               #       :address => :location
  #after_validation :reverse_geocode



  belongs_to :event

  def serializable_hash (options={})
    options = {
        only: [:lat, :lng],
        methods: [:self_link]
    }.update(options)
    json = super(options)
    #HATEOAS
    json['url'] = Rails.application.routes.url_helpers.api_v1_position_path(self)
    return json
  end


end
