class User < ActiveRecord::Base
  has_one :api, dependent: :destroy

  before_save { self.email = email.downcase }

  validates :username, presence: true,  length: { in: 3..30 }
  validates :password, presence: true,  length: { in: 6..255 }
  # using case_sensitive false here to make sure if user write email with Upper or Lowercase does't matter, Also using Email:true
  # which is a gem (gem 'email_validator') that handle regex for emails.
  validates :email, presence:true, length: { in: 4..255 }, uniqueness: { case_sensitive: false }, email:true
  validates :password_digest, presence:true

  #Create logics for password handling , and also hash it and store it in password_digest field.
  has_secure_password

  def info
    "#{ username } is called #{ password }"
  end
end
