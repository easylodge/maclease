class Maclease::Document < Maclease::Base

  attr_accessor :application_id, :document_class, :file_content, :author, :description, :comments, :purpose

  PURPOSE = %w(FOR_APPROVAL, FOR_SETTLEMENT).freeze

  validate_reference_field(:purpose)
end
