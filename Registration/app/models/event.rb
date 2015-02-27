class Event < ActiveRecord::Base

  has_many :event_types
  has_many :types, through: :event_types
  has_many :positions
  belongs_to :creator

  validates :name, presence: true,  length: { in: 3..100 }, uniqueness: true
  validates :amount, presence: true
  validates :edible, presence: true


  def serializable_hash (options={})
    options = {
        only: [:name, :edible,:amount, :creators_id,  :created_at, :updated_at],
        methods: [:self_link]
    }.update(options)
    json = super(options)
    #HATEOAS
    json['url'] = Rails.application.routes.url_helpers.api_v1_event_path(self)
    return json
  end

  def all_by_date
   #Todo implement code to return in order by date.
  end
end
