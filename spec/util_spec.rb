require_relative '../lib/modules/util'

describe FileValidation do
  let(:line) { 'font-size: 14px;' }
  let(:line_one_space) { ' font-size: 14px;' }
  let(:line_two_space) { '  font-size: 14px;' }
  let(:line_three_space) { '   font-size: 14px;' }
  let(:line_four_space) { '    font-size: 14px;' }
  let(:line_nil) { '' }

  describe 'index_white_space_string' do
    context 'when line is given' do
      it 'return 2 if index is zero' do
        expect(Util.index_white_space_string(line)).to be 2
      end
      it 'return 2 if index is zero' do
        expect(Util.index_white_space_string(line_one_space)).to be 2
      end
      it 'return counter of index' do
        expect(Util.index_white_space_string(line_two_space)).to be 3
      end
      it 'return counter of index' do
        expect(Util.index_white_space_string(line_three_space)).to be 4
      end
      it 'return counter of index' do
        expect(Util.index_white_space_string(line_four_space)).to be 5
      end
    end
    context 'when line is NOT given' do
      it 'return 2 if line is empty' do
        expect(Util.index_white_space_string(line_nil)).to be 2
      end
    end
  end
end
