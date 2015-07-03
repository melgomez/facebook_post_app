class ImportPost
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations
  
  attr_accessor :file, :user_id
  
  def initialize( attributes = {} )
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end
  
  def save
    if imported_posts.map(&:valid?).all?
      imported_posts.each(&:save!)
      true
    else
      imported_posts do |post, index|
        post.errors.full_messages.each do |message|
          errors.add :base, "Row #{index+2}: #message"
        end
      end
    end
  end
  
  def imported_posts
    @imported_posts ||= load_imported_posts
  end
  
  def load_imported_posts
    spreadsheet = open_spreadsheet
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).map do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      post = Post.find_by_id(row["id"]) || Post.new
      post.attributes = row.to_hash.slice(*row.to_hash.keys)
      post.user = User.find_by_oauth_token(user_id)
      post
    end
  end
  
  def open_spreadsheet
    case File.extname(file.original_filename)
    when ".csv" then Roo::CSV.new(file.path, file_warning: :ignore)
    when ".xls" then Roo::Excel.new(file.path, file_warning: :ignore)
    when ".xlsx" then Roo::Excelx.new(file.path, file_warning: :ignore)
    else
      raise "Unknown file type: #{file.original_filename}"
    end
  end
  
  def persisted?
    false
  end
end
