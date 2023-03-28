module StringStrippable
  extend ActiveSupport::Concern

  included do
    before_validation :squish_fields

    def squish_fields
      changed.each do |key, value|
        self[key] = value.squish if value.respond_to?("squish")
      end
    end
  end
end
