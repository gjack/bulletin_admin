class Need < ApplicationRecord
  belongs_to :organization, dependent: :destroy
  belongs_to :created_by, class: 'Subscriber', optional: true
  belongs_to :updated_by, class: 'Subscriber', optional: true
end
