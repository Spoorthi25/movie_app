class Movie < ApplicationRecord
    belongs_to :user
    validates :movie_name, presence: true, length: {minimum: 6,maximum: 100}
    validates :description, presence: true,length: {minimum: 10,maximum: 300}
    validates :actor_name, presence: true,length: {minimum: 6,maximum: 100}
    validates :director_name, presence: true,length: {minimum: 6,maximum: 100}
    validates :movie_language, presence: true,length: {minimum: 6,maximum: 100}

    def self.search_by(search_term)
        where("LOWER(movie_name) LIKE :search_term OR LOWER(actor_name) LIKE :search_term  OR LOWER(show_time) LIKE :search_term  OR LOWER(director_name) LIKE :search_term   OR LOWER(movie_language) LIKE :search_term",
        search_term: "%#{search_term.downcase}%")
        end
    end