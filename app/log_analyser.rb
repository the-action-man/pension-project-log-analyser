require_relative 'log_parser'

class LogAnalyser
  ALL_VISITS = 'all visits'
  UNIQUE_VISITS = 'unique visits'

  attr_reader :data

  def initialize(path_to_file)
    @data = LogParser.new.parse(path_to_file)
  end

  def calculate_all_visits
    ordered_data = make_order(data, :all)
    calculate_log_data(ordered_data, :all, ALL_VISITS)
  end

  def calculate_unique_visits
    ordered_data = make_order(data, :unique)
    calculate_log_data(ordered_data, :unique, UNIQUE_VISITS)
  end

  private

  def calculate_log_data(data, type, message)
    data.map! { |key, value| "#{key} #{value[type]} #{message}" }
  end

  def make_order(data, type)
    data.sort_by { |_key, value| value[type] }.reverse
  end
end
