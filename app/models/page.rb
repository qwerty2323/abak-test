# encoding: utf-8

##
# Wiki page
class Page < ActiveRecord::Base

  acts_as_tree :name_column => 'slug'

  attr_accessible :title, :slug, :content, :parent_id

  validates :title, :presence => true
  validates :slug, :presence  => true
  validates :slug, :exclusion => { :in => %w(add edit update create delete) }
  validates :slug, :format => { :with => /[a-zA-Zа-яА-Я0-9]+/i }

  ##
  # Obvious.
  def to_s
    self[:title]
  end

end
