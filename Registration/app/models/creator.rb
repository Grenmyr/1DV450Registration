class Creator < ActiveRecord::Base
  belongs_to :event

  def serializable_hash (options={})
    options = {
        only: [:name, :submits],
        methods: [:self_link]
    }.update(options)
    json = super(options)
    #HATEOAS
    json['url'] = Rails.application.routes.url_helpers.api_v1_creator_path(self)
    return json
  end

end
