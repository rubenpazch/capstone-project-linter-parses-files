require_relative '../lib/modules/validations_helper'

describe LineValidations do
  let(:line) { '/*comment*/\n' }
  describe 'check_is_comment?' do
    context 'when line is a comment' do
      it 'return true if line have an open comment code' do
        expect(LineValidations.check_is_comment?(line)).to be true
      end
      it 'return true if line have a close comment code' do
        expect(LineValidations.check_is_comment_close?(line)).to be true
      end
    end
  end
end
