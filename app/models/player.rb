class Player < ActiveRecord::Base
  has_many :games, through: :player_games
  has_many :player_games
  validates :password, :username, presence: true
  validates :username, length: { minimum: 5 }
  validates_uniqueness_of :username

  def self.authenticate(username, password)
    # if email and password correspond to a valid user, return that user
    # otherwise, return nil
    user = self.find_by username: username #find_by can't use count
    if !user.nil?
      if user.password == password
        return user
      end
    end
    return nil
  end
end
