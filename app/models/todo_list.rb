class TodoList < ApplicationRecord
  validates :title, presence: true
  validates :archive, inclusion: { in: [ true, false ] }

  before_create :set_archive_to_false

  private

    def set_archive_to_false
      self.archive = false
    end

end
