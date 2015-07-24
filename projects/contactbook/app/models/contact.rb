class Contact < ActiveRecord::Base
  attr_accessible :name, :phone
  validates :name, :phone, presence: true
  has_many :emails
  accepts_nested_attributes_for :emails, allow_destroy: true

  def self.search(search)
	  if search
	    find(:all, :conditions => ['phone LIKE ?', "%#{search}%"])
	  else
	    find(:all)
	  end
	end
end
