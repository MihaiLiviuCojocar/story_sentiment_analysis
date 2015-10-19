require 'mongoid'

class Company
  include Mongoid::Document

  field :name,       type: String
  field :tickerCode, type: String

  store_in collection: 'company'

  def latest_price
    'N/A'
  end

  def latest_stories
    'N/A'
  end

  def as_of
    'N/A'
  end
end