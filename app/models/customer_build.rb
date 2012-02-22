class CustomerBuild < ActiveRecord::Base
  has_many :customer_build_items
  belongs_to :customer
end