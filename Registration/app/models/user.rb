class User < ActiveRecord::Base
  has_one :api, dependent: :destroy
  validates :username, presence: true,  length: { in: 6..30 }
  validates :password, presence: true,  length: { in: 6..255 }
  validates :email, presence:true, length: { in: 4..255 }, uniqueness: true, email:true

  def info
    "#{ username } is called #{ password }"
  end

end
