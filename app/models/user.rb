class User < ApplicationRecord
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    #emailが~@~.~になるための正規表示
    VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}+\z/i
    #passwordが半角英数字最低1文字以上、かつ、8文字以上32文字以下の正規表示
    has_secure_password
    validates :name, presence: true, length: {maximum: 15}
    validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}
    validates :password, presence: true, format: {with: VALID_PASSWORD_REGEX}
    
    has_many :topics
    has_many :favorites
    has_many :favorite_topics, through: :favorites, source: 'topic'
    #favoritesモデルはuser_idとtopic_idをもつ
    #user.favorite_topicsはuser_idがfavoritesモデルでtopic_idが入ったtopic内容を取得できる?
    has_many :comments
    has_many :comments_topics, through: :comments, source: 'topic'
end
