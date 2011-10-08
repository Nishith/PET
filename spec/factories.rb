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

  factory :project, :class => Project do
    name 'Test project'
  end

  factory :lifecycle, :class => Lifecycle do
    id 1
    name 'Test lifecycle'
  end

  factory :lifecycle_phase, :class =>LifecyclePhase do
    id 1
    name 'Test lifecycle phase'
    lifecycle_id 1
  end

  factory :lifecycle_phase_deliverable, :class => LifecyclePhaseDeliverable do
    deliverable_type_id '1'
    lifecycle_phase_id 1
  end
end
