class Need < ApplicationRecord
  belongs_to :organization, dependent: :destroy
  belongs_to :created_by, class_name: 'Subscriber', optional: true
  belongs_to :updated_by, class_name: 'Subscriber', optional: true

  before_save :initialize_author

  private

  def initialize_author
    if Subscriber.current_subscriber
      self.created_by_id = Subscriber.current_subscriber.id
      self.updated_by_id = Subscriber.current_subscriber.id
    end
  end
end
