class Customer < ActiveRecord::Base
  attr_accessible :client_code, :client_id, :member_id 
  belongs_to :member
  belongs_to :client
    validates :client_code, :client_id , :member_id , 
  :presence => true
end
