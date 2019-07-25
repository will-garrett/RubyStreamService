class Stream < ApplicationRecord
  #validations
  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :userId
end
