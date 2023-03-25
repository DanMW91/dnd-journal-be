module KeyWordable
  extend ActiveSupport::Concern

  included do
    has_one :key_word, as: :key_wordable, dependent: :destroy
    belongs_to :campaign

    after_create :create_key_word

    private

    class_attribute :key_word_field

    def create_key_word
      KeyWord.create!(
        key_wordable: self,
        key_word: send(key_word_field),
        campaign: campaign,
        word_count: send(key_word_field).split(' ').length
      )
      update_write_ups
    end

    def update_write_ups
      WriteUp.where(campaign: campaign).each(&:scan_write_up_for_key_words)
    end

    def self.key_word_field(field)
      self.key_word_field = field
    end
  end
end
