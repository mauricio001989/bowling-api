class User < ApplicationRecord
  # == Callbacks ============================================================
  before_save :downcase_email

  # == Relationships ========================================================
  has_many :bowling_games, dependent: :destroy

  # == Validations ==========================================================
  validates :name, :document, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP },
                    uniqueness: { case_sensitive: false }

  private

  # == Instance Methods =====================================================
  def downcase_email
    email.downcase!
  end
end
