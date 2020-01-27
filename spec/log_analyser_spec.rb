require_relative '../app/log_analyser'

describe LogAnalyser do
  subject(:test_log_file) { LogAnalyser.new('./logs/test_log_file.log') }

  context 'when open a log file' do
    it 'should raise an error "File not found"' do
      expect { LogAnalyser.new('wrong_path_to_file.log') }.to raise_error('File not found')
    end
  end

  context 'when analyse a log file' do
    describe '#calculate_all_visits' do
      let(:expectation) { ['/home 3 all visits', '/help_page/1 3 all visits', '/about/2 3 all visits'] }
      it 'should return an array with descending order of all visits' do
        expect(test_log_file.calculate_all_visits).to eql(expectation)
      end
    end

    describe '#calculate_unique_visits' do
      let(:expectation) { ['/about/2 3 unique visits', '/help_page/1 2 unique visits', '/home 1 unique visits'] }
      it 'should return an array with descending order of unique visits' do
        expect(test_log_file.calculate_unique_visits).to eql(expectation)
      end
    end
  end
end
