class Distillery < ApplicationRecord
    has_many :gins

    include AlgoliaSearch

    algoliasearch do
      # all attributes will be sent
    end

    #allows for human/seo friendly URLs. Takes the name field and writes to the slug field  
    extend FriendlyId
    friendly_id :distillery_name, use: [:slugged, :finders]


    private
    def should_generate_new_friendly_id?
    slug.nil? || distillery_name_changed?
    end

end
