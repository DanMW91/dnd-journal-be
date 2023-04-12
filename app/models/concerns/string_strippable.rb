module StringStrippable
  extend ActiveSupport::Concern

  included do
    before_validation :strip_fields

    def strip_fields
      changed.each do |key|
        self[key] = self[key].strip if self[key].respond_to?('strip')
      end
    end
  end
end
