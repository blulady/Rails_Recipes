# frozen_string_literal: true

class ReviewBlueprint < Blueprinter::Base
    identifier :id
    fields :comment, :rating
    view :normal do
        fields :comment, :rating, :date
    # TADA associate user with review so I can pass the user to the front end with the review
    # associations :user, blueprint: UserBlueprint, view: :normal
    end

end
