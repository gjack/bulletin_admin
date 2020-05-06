class Offer < ApplicationRecord
  belongs_to :organization, dependent: :destroy
  belongs_to :created_by, class_name: 'Subscriber', optional: true
  belongs_to :updated_by, class_name: 'Subscriber', optional: true
end
