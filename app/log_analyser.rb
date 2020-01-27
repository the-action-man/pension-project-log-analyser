class LogAnalyser
  def initialize(path_to_file)
    @data = parse(path_to_file)
  end

  def calculate_all_visits
    ordered_data = make_order(@data, :all)
    calculate_log_data(ordered_data, :all, 'all visits')
  end

  def calculate_unique_visits
    ordered_data = make_order(@data, :unique)
    calculate_log_data(ordered_data, :unique, 'unique views')
  end

  private

  def parse(path_to_file)
    file = open_file(path_to_file)
    evaluate_data_container(file)
  end

  def calculate_log_data(data, type, message)
    data.map! { |key, value| "#{key} #{value[type]} #{message}" }
  end

  def make_order(data, type)
    data.sort_by { |_key, value| value[type] }.reverse
  end

  def evaluate_data_container(file)
    empty_data_container = Hash.new { |hash, key| hash[key] = Hash.new(0) }
    data_container = fill_container(empty_data_container, :all, file)
    fill_container(data_container, :unique, file.uniq)
  end

  def fill_container(data_container, type, file)
    file.each { |line| data_container[line.split(' ')[0]][type] += 1 }
    data_container
  end

  def open_file(path_to_file)
    raise 'File not found' unless File.exist?(path_to_file)

    File.open(path_to_file).map(&:strip)
  end
end
