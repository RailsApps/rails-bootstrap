class Visitor < ActiveRecord::Base
  has_no_table
  column :favorite, :string
  column :comment, :string
  validates_presence_of :favorite

  IMAGE_LABELS = ['San Francisco', 'Sydney', 'Paris']

  def update_spreadsheet
    connection = GoogleDrive.login(ENV["GMAIL_USERNAME"], ENV["GMAIL_PASSWORD"])
    ss = connection.spreadsheet_by_title('Rails-Bootstrap-Example')
    if ss.nil?
      ss = connection.create_spreadsheet('Rails-Bootstrap-Example')
    end
    ws = ss.worksheets[0]
    last_row = 1 + ws.num_rows
    ws[last_row, 1] = Time.now
    ws[last_row, 2] = self.favorite
    ws[last_row, 3] = self.comment
    ws.save
  end

end
