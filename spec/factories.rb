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

  factory :full_project, :class => Project do |project|
    project.name 'Test Full Project'
    project.project_phases {|phases| [phases.association(:project_phase),
                                      phases.association(:project_phase),
                                      phases.association(:project_phase)]}
  end

  factory :project_phase, :class => ProjectPhase do |phase|
    phase.sequence(:name){|n| "Test project phase #{n}" }
    phase.sequence(:position){|n| n}
    project_id 1
  end

  factory :full_phase, :class => ProjectPhase do |phase|
    phase.name "Test Project Phase"
    phase.position 1
    project_id 1
    phase.project_phase_deliverables {|deliverables| [deliverables.association(:project_phase_deliverable),
                                                      deliverables.association(:project_phase_deliverable),
                                                      deliverables.association(:project_phase_deliverable)]}
  end

  factory :project_phase_deliverable, :class => ProjectPhaseDeliverable do |deliverable|
    deliverable.sequence(:name){|n| "Test project deliverable #{n}" }
    deliverable.sequence(:position){|n| n}
    project_phase_id 1
  end

  factory :effort_log, :class => EffortLog do |effort_log|
    effort_log.date Date.today
    effort_log.effort 3.0
    effort_log.interrupt_time 0.5
    effort_log.comments "abcd"
    effort_log.project_phase_deliverable {|deliverable| deliverable.association(:project_phase_deliverable)}
  end

  factory :lifecycle, :class => Lifecycle do
    id 1
    name 'Test lifecycle'
  end

  factory :lifecycle_phase, :class =>LifecyclePhase do
    id 1
    name 'Test lifecycle phase'
    lifecycle_id 1
    position 1
  end

  factory :lifecycle_phase_deliverable, :class => LifecyclePhaseDeliverable do
    deliverable_type_id '1'
    lifecycle_phase_id 1
    position 1
  end
end
