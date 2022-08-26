class Actor < ActiveRecord::Base
    has_many :characters, dependent: :destroy
    has_many :shows, through: :characters

    def full_name
        "#{first_name} #{last_name}"
    end

    def list_roles
        self.characters.map do |character|
            "#{character[:name]} - #{Show.find_by(id: (character[:show_id])).name}"
        end
    end
end