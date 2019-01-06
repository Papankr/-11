# frozen_string_literal: true

class Ticket < ApplicationRecord
  validates :number, presence: true, uniqueness: true
end
