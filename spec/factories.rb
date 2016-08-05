FactoryGirl.define do

    factory :default_user, class: User do
      username "default_user"
      password "default_password"
      password_confirmation "default_password"
    end

    factory :default_store, class: Store do
      name "Auchan"
      address "Paris"
    end

    factory :default_visit, class: Visit do
      report "default report"
      user :default_user
      store :default_store
    end

end
