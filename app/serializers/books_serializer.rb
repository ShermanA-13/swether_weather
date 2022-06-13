class BooksSerializer
  def self.message(quantity)
    message = if quantity <= 0
                'Invalid Quantity'
              else
                quantity
              end
  end

  def self.book_response(forecast, books, location, quantity)
    hash = {
      "data":
      {
        "id": nil,
        "type": 'books',
        "message": message(quantity),
        "attributes":
        {
          "destination": location.to_s,
          "forecast":
          {
            "summary": forecast[:current][:weather][0][:description],
            "temperature": forecast[:current][:temp]
          },
          "total_books_found": books[:numFound],
          "books": books[:docs].shift(quantity).map do |book|
            {
              "isbn": book[:isbn],
              "title": book[:title],
              "publisher": book[:publisher]
            }
          end
        }
      }
    }
  end
end
