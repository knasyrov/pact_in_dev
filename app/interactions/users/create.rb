class Users::Create < ActiveInteraction::Base
  #object :user

  string :email
  string :patronymic
  string :name
  integer :age
  string :nationality
  string :country
  string :gender

  string :surname, default: ''
  string :interests, default: ''
  string :skills, default: ''
  string :full_name, default: ''

  validate :email_uniqueness
  validates :email, :name, :patronymic, :age, :nationality, :country, :gender, presence: true
  validates :age, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 90 }
  validates :gender, inclusion: { in: %w(male female) }


  def execute
    puts '!!!!!!!!!!!'
    full_name = [surname, name, patronymic].reject(&:blank?).map(&:strip).join(' ')
    user = User.create(inputs.slice(:email, :name, :patronymic, :age, :nationality, :country, :gender).merge(full_name: full_name))
    user.skills = skills.split(',').map(&:strip).map { |e| Skill.find_or_create_by(name: e) }
    user.interests = interests.split(',').map(&:strip).map { |e| Interest.find_or_create_by(name: e) }
    user
  end   
  
  private
  
  def email_uniqueness
    errors.add(:email, 'not unique') unless email_unique?
  end

  def email_unique?
    !User.exists?(email: email)
  end
end
