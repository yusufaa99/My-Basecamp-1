
class Notification < ApplicationRecord
    belongs_to :user
    validates :title, :message, presence: true
  
    before_create :set_default_status
  
    private
  
    def set_default_status
      self.read_status = false if read_status.nil?
    end
end
  
  