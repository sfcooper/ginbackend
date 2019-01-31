class Botanical < ApplicationRecord

    has_many :botanicals_gin
    has_many :gins, through: :botanicals_gin
    
    #allows for human/seo friendly URLs. Takes the name field and writes to the slug field  
    extend FriendlyId
    friendly_id :botanical_name, use: [:slugged, :finders]


    private
    def should_generate_new_friendly_id?
    slug.nil? || botanical_name_changed?
    end
end
