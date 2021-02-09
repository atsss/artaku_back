class ApplicationRecord < ActiveRecord::Base
  acts_as_paranoid

  self.abstract_class = true

  class << self
    # FIXME: create concern
    def extract_youtube_id(url)
      url.match(%r{https://youtu.be/(.*)})[1]
    end
  end
end
