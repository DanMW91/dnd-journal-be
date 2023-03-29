module StringStrippable
  extend ActiveSupport::Concern

  included do
    before_validation :squish_fields

    def squish_fields
      changed.each do |key|
        self[key] = self[key].squish if self[key].respond_to?('squish')
      end
    end
  end
end
