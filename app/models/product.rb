# frozen_string_literal: true

class Product < ApplicationRecord
  include PgSearch::Model

  validates_presence_of :name, :price

  pg_search_scope :search_by_name, against: :name, using: { dmetaphone: {}, trigram: {}, tsearch: { prefix: true, any_word: true }}
end
