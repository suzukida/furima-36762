FactoryBot.define do
  factory :user do
    name              {'test'}
    email                 {'test@example'}
    password              {'aa000000'}
    password_confirmation {password}
    last_name{'清水'}
    first_name{'しょうた'}
    last_kana{'シミズ'}
    first_kana{'ショウタ'}
    birthday{'1994-10-20'}
  end
end