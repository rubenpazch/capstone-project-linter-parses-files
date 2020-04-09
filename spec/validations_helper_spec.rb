require_relative '../lib/modules/validations_helper'
require_relative '../lib/list_errors'

describe LineValidations do
  let(:line_nil) { nil }
  let(:line_empty) { '' }
  let(:line_white_space) { ' ' }
  let(:line) { '/*comment*/\n' }
  let(:line_with_new_line) { "/*comment*/\n" }
  let(:line_with_space_on_open_comment) { '/* comment */\n' }
  let(:line_not_new_line) { '/*comment*/' }
  let(:line_not_comment) { '.button {\n' }
  let(:line_is_new_line_code) { '\n' }
  let(:arr) { ['/*comment*/', '/*comment*/'] }

  describe 'check_is_comment?' do
    context 'when line is given' do
      it 'return true if line have an open comment code' do
        expect(LineValidations.check_is_comment?(line)).to be true
      end
      it 'return false if line is an open comment code' do
        expect(LineValidations.check_is_comment?(line_not_comment)).to be false
      end
    end
    context 'when line is NOT given' do
      it 'return false if line is nil' do
        expect(LineValidations.check_is_comment?(line_empty)).to be false
      end
    end
  end

  describe 'check_is_comment_close?' do
    context 'when line is given' do
      it 'return true if line have a close comment code' do
        expect(LineValidations.check_is_comment_close?(line)).to be true
      end
      it 'return false if line is not a close comment code' do
        expect(LineValidations.check_is_comment_close?(line_not_comment)).to be false
      end
    end
    context 'when line is NOT given' do
      it 'return false if line is nil' do
        expect(LineValidations.check_is_comment_close?(line_empty)).to be false
      end
    end
  end

  describe 'check_if_have_new_line?' do
    context 'when line is given' do
      it 'return true if line have a new line code' do
        expect(LineValidations.check_if_have_new_line?(line)).to be true
      end
      it 'return false if line not have a new line code' do
        expect(LineValidations.check_if_have_new_line?(line_not_new_line)).to be false
      end
    end
    context 'when line is NOT given' do
      it 'return false if line is nil' do
        expect(LineValidations.check_if_have_new_line?(line_empty)).to be false
      end
    end
  end

  describe 'comment_white_space_inside_after' do
    context 'when line is given' do
      it 'return nil if line is a new line code' do
        expect(LineValidations.comment_white_space_inside_after(line_is_new_line_code, 1)).to be nil
      end
      it 'return nil if line is empty' do
        expect(LineValidations.comment_white_space_inside_after(line_empty, 1)).to be nil
      end
      it 'return nil if line is white space' do
        expect(LineValidations.comment_white_space_inside_after(line_white_space, 1)).to be nil
      end
      it 'return error class if line is need space after the open comment' do
        expect(LineValidations.comment_white_space_inside_after(line, 1)).to be_an_instance_of(Error)
      end
      it 'return nil if line is have an space after open comment' do
        expect(LineValidations.comment_white_space_inside_after(line_with_space_on_open_comment, 1)).to be nil
      end
    end
    context 'when line is NOT given' do
      it 'return false if line is nil' do
        expect(LineValidations.comment_white_space_inside_after(line_nil, 1)).to be nil
      end
    end
  end

  describe 'comment_white_space_inside_before' do
    context 'when line is given' do
      it 'return nil if line is a new line code' do
        expect(LineValidations.comment_white_space_inside_before(line_is_new_line_code, 1)).to be nil
      end
      it 'return nil if line is empty' do
        expect(LineValidations.comment_white_space_inside_before(line_empty, 1)).to be nil
      end
      it 'return nil if line is white space' do
        expect(LineValidations.comment_white_space_inside_before(line_white_space, 1)).to be nil
      end
      it 'return instance error class if line is need space after the open comment' do
        expect(LineValidations.comment_white_space_inside_before(line, 1)).to be_an_instance_of(Error)
      end
      it 'return nil if line is have an space after open comment' do
        expect(LineValidations.comment_white_space_inside_before(line_with_space_on_open_comment, 1)).to be nil
      end
    end
    context 'when line is NOT given' do
      it 'return false if line is nil' do
        expect(LineValidations.comment_white_space_inside_before(line_nil, 1)).to be nil
      end
    end
  end

  describe 'unexpected_missing_end_of_source_nwln' do
    context 'when lines is given' do
      it 'return instance error class if line is need space after the open comment' do
        expect(LineValidations.unexpected_missing_end_of_source_nwln(line_not_new_line, 1)).to be_an_instance_of(Error)
      end
    end
    context 'when lines is NOT given' do
      it 'return false if line is nil' do
        expect(LineValidations.unexpected_missing_end_of_source_nwln(line_with_new_line, 1)).to be nil
      end
    end
  end

  describe 'expected_empty_line_before_comment' do
    context 'when array is given' do
      it 'return instance linter class if line is need space after the open comment' do
        expect(LineValidations.expected_empty_line_before_comment(arr)).to be_an_instance_of(Linters)
      end
    end
  end

  describe 'expected_indentation_of_zero_spaces' do
    context 'when array is given' do
      it 'return instance linter class if line is need space after the open comment' do
        expect(LineValidations.expected_indentation_of_zero_spaces(arr)).to be_an_instance_of(Linters)
      end
    end
  end
end
