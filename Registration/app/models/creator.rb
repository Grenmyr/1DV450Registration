class Creator < ActiveRecord::Base
  has_many :event
  has_secure_password
  validates :password_digest, presence:true
  validates :username, presence: true

  def serializable_hash (options={})
    options = {
        only: [:id, :name, :submits],
        methods: [:self_link]
    }.update(options)
    json = super(options)
    #HATEOAS
    json['url'] = Rails.application.routes.url_helpers.api_v1_creator_path(self)
    return json
  end

end
