class Type < ActiveRecord::Base
  has_many :event_types
  has_many :events, through: :event_types

  def serializable_hash (options={})
    options = {
        only: [:name,:id],
        methods: [:self_link]
    }.update(options)
    json = super(options)
    #HATEOAS
    json['url'] = Rails.application.routes.url_helpers.api_v1_type_path(self)
    return json
  end

end
