require 'mongoid'

class Company
  include Mongoid::Document

  field :name,       type: String
  field :tickerCode, type: String
end