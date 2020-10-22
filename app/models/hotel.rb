class Hotel < ApplicationRecord
  belongs_to :admin, class_name: 'User', optional: true
end
