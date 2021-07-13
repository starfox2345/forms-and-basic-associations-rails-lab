class Song < ActiveRecord::Base
  # add associations here
  has_many :notes
  belongs_to :artist
  belongs_to :genre

#   class Post < ActiveRecord::Base
#     def category_name=(name)
#       self.category = Category.find_or_create_by(name: name)
#     end
 
#     def category_name
#        self.category ? self.category.name : nil
#     end
#  end 

# Post.create({
#   category_name: params[:post][:category_name],
#   content: params[:post][:content]
# }) 

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def note_contents=(contents)
    contents.each do |content|
      if !content.blank?
        note = Note.create(content: content, song_id: self.id)
        self.notes << note
      end
    end
  end

  def note_contents
    self.notes.map { |note| note.content}
  end

end
