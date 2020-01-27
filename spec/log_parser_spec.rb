require_relative '../app/log_parser'

describe LogParser do
  describe 'parsing should raise the error' do
    it '"File not found" error if the file has wrong path' do
      expect { LogParser.new.parse('wrong_path.rb') }.to raise_error('File not found')
    end
  end

  describe 'parsing returns' do
    subject(:log_parser_data) { LogParser.new.parse('./logs/test_log_file.log') }
    let(:expectation) {
      {
          "/about/2" => { all: 3, unique: 3 },
          "/help_page/1" => { all: 3, unique: 2 },
          "/home" => { all: 3, unique: 1 }
      }
    }
    it 'data from parsed file' do
      expect(log_parser_data).to include(expectation)
    end
  end
end