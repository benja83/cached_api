class Api::V1::DateService
  INTERVAL = %w(year month day hour minute second)

  def date_pretty_diff(from_time, to_time)
    delta = get_diff_value_by_interval(from_time, to_time)
    result = []
    delta.each_index do |i|
      unless delta[i] <= 0
        result << delta[i]
        interval = delta[i] >= 1 ? INTERVAL[i].pluralize  : INTERVAL[i]
        result << interval
      end
    end
    result.join(' ')
  end

  def get_diff_value_by_interval(from_time, to_time)
    INTERVAL.map do |interval|
      distance_in_seconds = (to_time.to_i - from_time.to_i).round(1)
      delta = (distance_in_seconds / 1.send(interval)).floor
      delta -= 1 if from_time + delta.send(interval) > to_time
      from_time += delta.send(interval)
      delta
    end
  end
end
