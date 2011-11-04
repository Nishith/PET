HistoricalData.delete_all
(1..10).each do
  #High complexity
  types = ProjectPhaseDeliverable.all.collect {|p| p.deliverable_type_id}
  types.each do |t|
    rate = 5 + rand(5)
    size = 100 + rand(500)
    effort = rate * size
    HistoricalData.create!(:deliverable_type_id => t, :complexity => 3, :total_effort => effort, :production_rate => rate, :estimated_size => size)
  end
  #Medium complexity
  types = ProjectPhaseDeliverable.all.collect {|p| p.deliverable_type_id}
  types.each do |t|
    rate = 3 + rand(5)
    size = 100 + rand(500)
    effort = rate * size
    HistoricalData.create!(:deliverable_type_id => t, :complexity => 2, :total_effort => effort, :production_rate => rate, :estimated_size => size)
  end
  #Low complexity
  types = ProjectPhaseDeliverable.all.collect {|p| p.deliverable_type_id}
  types.each do |t|
    rate = 1 + rand(5)
    size = 100 + rand(500)
    effort = rate * size
    HistoricalData.create!(:deliverable_type_id => t, :complexity => 1, :total_effort => effort, :production_rate => rate, :estimated_size => size)
  end
end