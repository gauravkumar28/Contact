class Email < ActiveRecord::Base
  attr_accessible :email_url
  validates :email_url, uniqueness: true
  validates_length_of :email, :within => 6..100
  belongs_to :contact
end
