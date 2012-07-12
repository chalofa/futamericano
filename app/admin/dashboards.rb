ActiveAdmin::Dashboards.build do

  section 'Seasons' do
    ul do
      li "Current: #{Season.current.first}"
      li "Last: #{Season.where(state: :finished).last}" #TODO: move to scopes
      li "Next: #{Season.where(state: :pending).first}"
    end
  end

end
