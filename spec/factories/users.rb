FactoryBot.define do
  factory :user do
    name              {'test'}
    email {Faker::Internet.free_email}
    password              {'000000'}
    password_confirmation {password}
    school_name {"徳島プログラミング教室"}
    address {"徳島県徳島市松茂町"}
    telephone_number {"000-0000-0000"}
    teacher_name {"山田太郎"}
    school_content {"スクラッチをしています"}
  end
end
