class Customer < ActiveRecord::Base
  
  has_many :orders
  
  attr_reader :card_type, :credit_card, :card_number, :card_verification, :card_expires_on
  
  attr_accessor :password
  attr_accessible :email, :password
  
  before_save :create_hashed_password
  after_save :clear_password
  
  validates_presence_of :email, :password
  validates_uniqueness_of :email
  
  EMAIL_REGEX = /^[A-ZA-Z0-9._%+-]+@[A-ZA-Z0-9.-]+\.[A-Z]{2,4}$/i
  # new "sexy" validations

  validates :first_name, :presence => true, :length => {:maximum => 25 }
  validates :last_name, :presence => true, :length => {:maximum => 50 }
  validates :email, :presence => true, :length => {:maximum => 100 }, :format => EMAIL_REGEX, :confirmation => true, :uniqueness => true

  # only on create, so other attributes of this user can be changed
  validates_length_of :password, :within=> 8..25, :on => :create

  
  scope :named, lambda {|first,last| where(:first_name => first, :last_name => last)}
  scope :sorted, order("customers.last_name ASC, customers.first_name ASC")

    attr_protected :hashed_password, :salt

    def name
      "#{first_name} #{last_name}"
    end

    def self.make_salt(email="")
      Digest::SHA1.hexdigest("Use #{email} with #{Time.now} to make salt")
    end

    def self.hash_with_salt(password="", salt="")
      Digest::SHA1.hexdigest("Put #{salt} on the #{password}")
    end

    def self.authenticate(email="", password="")
      customer = Customer.find_by_email(email)
      if customer && customer.password_match?(password)
        return customer
      else
        return false
      end
    end
    # Thie same password string with the same shash method andsalt
    # should always generate the same hashed_password.
    def password_match?(password="")
      hashed_password == Customer.hash_with_salt(password, salt)
    end

 


  private

  def create_hashed_password
    # Whenever :password has a value hashing is needed
    unless password.blank?
      # always use "self" when assigning values
      self.salt = Customer.make_salt(email) if salt.blank?
      self.hashed_password = Customer.hash_with_salt(password, salt)
    end
  end

  def clear_password
    # for security and b/c hashing is not needed
    self.password = nil
  end
  
end
