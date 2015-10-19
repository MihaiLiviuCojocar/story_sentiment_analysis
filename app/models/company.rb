require 'mongoid'

class Company
  include Mongoid::Document

  field :name,       type: String
  field :tickerCode, type: String

  store_in collection: 'company'

  NOT_AVAILABLE_YET = 'N/A'

  def latest_price
    @latest_price || NOT_AVAILABLE_YET
  end

  def latest_stories
    @latest_stories || []
  end

  def as_of
    @as_of || NOT_AVAILABLE_YET
  end

  def price_units
    @price_units || NOT_AVAILABLE_YET
  end

  def story_feed_uri
    @story_feed_uri || NOT_AVAILABLE_YET
  end

  def retrieve_data
    parsed = JSON.parse(CompanyDetailsReader.new(tickerCode).retrieve_data)
    @latest_price   = parsed["latestPrice"]
    @price_units    = parsed["priceUnits"]
    @as_of          = parsed["asOf"]
    @story_feed_uri = parsed["storyFeedUrl"]

    if has_stories?
      stories = JSON.parse(CompanyNewsFeedRader.new(story_feed_uri).retrieve_data)
      stories.each do |story|
        add_story(Story.new(
          id: story["id"],
          headline: story["headline"],
          body: story["body"])
        )
      end
    end
    self
  end

  private

  def add_story(story)
    @latest_stories = latest_stories.append(story)
  end

  def has_stories?
    story_feed_uri != NOT_AVAILABLE_YET
  end
end