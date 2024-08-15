class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def build_artist(name:)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    artist.name if artist
  end

  def artist_name=(new_name)
    build_artist(name: new_name)
  end

  def note_contents
    notes.map do |note|
     note.content
    end
  end

  def note_contents=(content_strings)
    content_strings.each do |content|
      note = Note.find_or_create_by(content: content)
      self.notes << note
    end
  end
end
