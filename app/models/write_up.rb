class WriteUp < ApplicationRecord
  belongs_to :campaign

  has_many :write_up_mentions
  has_many :characters, through: :write_up_mentions, source: :write_up_mentionable, source_type: 'Character'

  validates :session_number, presence: true, uniqueness: { scope: :campaign }

  after_create :compare_key_words

  def scan_write_up_for_key_words
    return unless max_length_key_word

    compare_key_words
  end

  private

  def max_length_key_word
    KeyWord.where(campaign: campaign).maximum('word_count')
  end

  def existing_key_words
    write_up_mentions.map(&:write_up_mentionable).flat_map { |resource| resource&.key_words&.map{ |kw| kw.key_word.downcase }}.reject { |word| word.blank? }
  end

  def compare_key_words
    campaign_keywords.filter { |campaign_kw| !existing_key_words.include?(campaign_kw.key_word.downcase) }.each do |key_word|
      match = /\b#{key_word.key_word}\b/i.match(content)

      next unless match

      WriteUpMention.find_or_create_by!(
        write_up_mentionable: key_word.key_wordable,
        write_up: self,
        key_word: KeyWord.find_by(key_word: key_word.key_word)
      )
    end
  end

  def campaign_keywords
    @campaign_keywords ||= KeyWord.where(campaign: campaign)
  end
end
