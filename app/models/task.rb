class Task < ApplicationRecord
  belongs_to :user, dependent: :destroy
end
