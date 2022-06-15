class Trip
  attr_reader :time_in_days, :time_in_hours, :readable_time, :origin, :destination

  def initialize(data, from, to)
    if data[:route][:legs].present?
      @readable_time = ActiveSupport::Duration.build(data[:route][:legs][0][:time]).inspect
      @time_in_hours = (data[:route][:legs][0][:time] / 3600.0).round
      @time_in_days = (data[:route][:legs][0][:time] / 86_400).round
    else
      @readable_time = 'Impossible route'
    end
    @origin = from
    @destination = to
  end

  def over_two_days?
    @time_in_hours > 47
  end
end
