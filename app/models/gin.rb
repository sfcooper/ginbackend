class Gin < ApplicationRecord
    belongs_to :distillery

    validates :gin_name, :snippet, :description, presence: true

    include AlgoliaSearch

    algoliasearch do
      attributesForFaceting [:abv]
    end

    #allows for human/seo friendly URLs. Takes the name field and writes to the slug field  
    extend FriendlyId
    friendly_id :gin_name, use: [:slugged, :finders]


    private
    def should_generate_new_friendly_id?
    slug.nil? || gin_name_changed?
    end
end
