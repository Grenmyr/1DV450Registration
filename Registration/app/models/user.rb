class User < ActiveRecord::Base
  has_one :api, dependent: :destroy
  validates :username, presence: true,  length: { in: 6..30 }
  validates :password, presence: true,  length: { in: 6..255 }

  def info
    "#{ username } is called #{ password }"
  end

end
