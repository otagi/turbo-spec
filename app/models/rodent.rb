class Rodent < ApplicationRecord
  validates_presence_of :name
  after_commit :update_rodents_counter

  private

  def update_rodents_counter
    broadcast_replace_to :dashboard, target: 'rodents-counter', partial: 'dashboard/counter'
  end
end
