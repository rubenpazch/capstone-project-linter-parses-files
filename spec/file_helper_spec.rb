require_relative '../lib/modules/file_helper'

describe FileValidation do
  let(:file_nil) { nil }
  let(:file_empty) { '' }
  let(:file_with_content) { 'testing' }
  let(:file_type_scss) { '//testing//file.scss' }
  let(:file_type_not_scss) { '//testing//file.css' }
  let(:file_readable) { 'C:\wamp64\www\capstone-project-linter-parses-files\spec\examples\file_with_lines.scss' }
  let(:file_not_readable) { 'C:\wamp64\www\capstone-project-linter-parses-files\spec\examples\file_not_readable.scss' }
  # rubocop:disable Layout/LineLength
  let(:file_without_lines) { 'C:\wamp64\www\capstone-project-linter-parses-files\spec\examples\file_without_lines.scss' }
  # rubocop:enable Layout/LineLength
  let(:file_not_exist) { 'C:\wamp64\www\capstone-project-linter-parses-files\spec\examples\not_exists.scss' }

  describe 'validate_path?' do
    context 'when file is given' do
      it 'return true if is valida path' do
        expect(FileValidation.validate_path?(file_with_content)).to be true
      end
    end
    context 'when file is NOT given' do
      it 'return false if path is empty' do
        expect(FileValidation.validate_path?(file_empty)).to be false
      end
      it 'return false if path is nil' do
        expect(FileValidation.validate_path?(file_nil)).to be false
      end
    end
  end

  describe 'file_is_sass_file?' do
    context 'when file is given' do
      it 'return true if the type of the file is scss' do
        expect(FileValidation.file_is_sass_file?(file_type_scss)).to be true
      end
      it 'return false if the type of the file is not scss' do
        expect(FileValidation.file_is_sass_file?(file_type_not_scss)).to be false
      end
    end
  end

  describe 'file_is_readable?' do
    context 'when file is given' do
      it 'return true if the file is readable' do
        expect(FileValidation.file_is_readable?(file_readable)).to be true
      end
    end
  end

  describe 'file_exists?' do
    context 'when file is given' do
      it 'return true if the file exists' do
        expect(FileValidation.file_exists?(file_readable)).to be true
      end
      it 'return false if the file not exists' do
        expect(FileValidation.file_exists?(file_not_exist)).to be false
      end
    end
  end

  describe 'file_have_zero_lines?' do
    context 'when file is given' do
      it 'return false if the file have more than 1 line' do
        expect(FileValidation.file_have_zero_lines?(file_readable)).to be false
      end
      it 'return true if the file have zero lines' do
        expect(FileValidation.file_have_zero_lines?(file_without_lines)).to be true
      end
    end
  end
end
