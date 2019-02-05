class Gin < ApplicationRecord

    before_create :is_alcoholic

    belongs_to :distillery
    has_many :botanicals_gin
    has_many :botanicals, through: :botanicals_gin

    validates :gin_name, :snippet, :description, presence: true
    validates :gin_name, uniqueness: true
    
    #determines if gin is alcoholic or not
    def is_alcoholic
      if abv == 0.0
        self.alcoholic = false
      else
        self.alcoholic = true
      end
    end

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
