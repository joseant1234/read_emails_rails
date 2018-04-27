class Attachment < ApplicationRecord

	has_attached_file :file, default_url: nil
  	#validates_attachment_content_type :file, content_type: /\Aimage\/.*\z/
  	do_not_validate_attachment_file_type :file
end
