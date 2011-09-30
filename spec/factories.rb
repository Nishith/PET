FactoryGirl.define do
  factory :developer, :class => User do
    email 'testD@test.com'
    name 'Developer'
    role 'developer'
    password  '123456'
  end

  factory :admin, :class => User do
    email 'testA@test.com'
    name 'Admin'
    role 'admin'
    password  '123456'
  end

  factory :manager, :class => User do
    email 'testM@test.com'
    name 'Manager'
    role 'manager'
    password  '123456'
  end
end
