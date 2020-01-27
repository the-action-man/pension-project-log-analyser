
class LogParser
  def parse(path_to_file)
    file = open_file(path_to_file)
    evaluate_data_container(file)
  end

  private

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

