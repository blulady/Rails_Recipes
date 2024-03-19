# frozen_string_literal: true

class ReviewBlueprint < Blueprinter::Base
    identifier :id
    fields :comment, :rating, :user_id
    association :user, blueprint: UserBlueprint, view: :normal
    view :with_recipes do
        fields :comment, :rating, :date, :user
    end
    # TADA associate user with review so I can pass the user to the front end with the review
    # associations :user, blueprint: UserBlueprint, view: :normal
    view :details_page do
        association :user, blueprint: UserBlueprint, view: :normal
    end
end
