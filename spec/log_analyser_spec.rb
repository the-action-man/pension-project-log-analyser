require_relative '../app/log_analyser'

describe LogAnalyser do
  test_log_file = LogAnalyser.new('./logs/test_log_file.log')

  context 'when open a log file' do
    it 'should raise an error "File not found"' do
      expect { LogAnalyser.new('wrong_path_to_file.log') }.to raise_error('File not found')
    end
  end

  context 'when analyse a log file' do
    describe '#calculate_all_visits' do
      ten_items_parsed_and_sorted = ['/home 3 all visits', '/help_page/1 3 all visits', '/about/2 3 all visits']
      it 'should return an array with descending order of all views' do
        expect(test_log_file.calculate_all_visits).to eql(ten_items_parsed_and_sorted)
      end
    end

    describe '#calculate_unique_visits' do
      it 'should return an array with descending order of unique views' do
        ten_items_parsed_and_sorted = ['/about/2 3 unique views', '/help_page/1 2 unique views', '/home 1 unique views']
        expect(test_log_file.calculate_unique_visits).to eql(ten_items_parsed_and_sorted)
      end
    end
  end
end
