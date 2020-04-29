class Need < ApplicationRecord
  belongs_to :organization, dependent: :destroy
  belongs_to :created_by, class: 'User', optional: true
  belongs_to :updated_by, class: 'User', optional: true
end
