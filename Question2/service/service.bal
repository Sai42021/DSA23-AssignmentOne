import ballerina/grpc;

listener grpc:Listener libraryManagementEP = new (9090);

@grpc:ServiceDescriptor {
    descriptor: ROOT_DESCRIPTOR_LIBRARY,
    descMap: getDescriptorMapLibrary()
}
service "libraryManagement" on libraryManagementEP {
    private map<Book> books = {};
    private map<User> users = {};

    remote function add_book(Book request) returns Responds|error {
        string isbn = request.ISBN;
        if (self.books.hasKey(isbn)) {
            string book_exists_error_message = "Book with ISBN ${isbn} already exists";
            return error(book_exists_error_message);
        } else {
            self.books[isbn] = request;
            Responds response = {message: "Book added successfully"};
            return response;
        }
    }

    remote function create_users(User request) returns Responds|error {
        string userID = request.userID;
        if (self.users.hasKey(userID)) {
            string user_exists_error_message = "User with ID ${userID} already exists";
            return error(user_exists_error_message);
        } else {
            self.users[userID] = request;
            Responds response = {message: "User created successfully"};
            return response;
        }
    }

    remote function update_book(Book request) returns Responds|error {
        string isbn = request.ISBN;
        if (self.books.hasKey(isbn)) {
            self.books[isbn] = request;
            Responds response = {message: "Book updated successfully"};
            return response;
        } else {
            string no_book_error_message = "No book with ISBN ${isbn} exists";
            return error(no_book_error_message);
        }
    }

    remote function update_user(User request) returns Responds|error {
        string userID = request.userID;
        if (self.users.hasKey(userID)) {
            self.users[userID] = request;
            Responds response = {message: "User updated successfully"};
            return response;
        } else {
            string no_user_error_message = "No user with ID ${userID} exists";
            return error(no_user_error_message);
        }
    }

    remote function remove_user(string request) returns Responds|error {
        // Attempt to remove the user with the specified user ID from the user map
        User userIDToRemove = self.users.remove(request);
        return {
            message: "${userIDToRemove.firstName} deleted successfully"
        };
    }

    remote function remove_book(string request) returns Responds|error {
        // Attempt to remove the book with the specified ISBN from the books map
        Book ISBNToRemove = self.books.remove(request);
        return {
            message: "${ISBNToRemove.title} deleted successfully"
        };
    }

    remote function list_all_users() returns stream<User, error?>|error {
        stream<User, error?> userStream = stream from var user in self.users.toArray()
            select user;

        return userStream;
    }

    // remote function List_avaialable_books() returns map<Book> {
    //     // Get all books from the inventory and filter for those with status "available"
    //     map<Book> availableBooks = self.books.filter(b => b.status == "available");
    //     return availableBooks;
    // }

    remote function locate_book(string request) returns Book?|error {
        // Attempt to retrieve the book with the specified ISBN from the book map
        Book isbn = self.books.get(request);
        if (self.books.hasKey(isbn.toString())) {
            return self.books[isbn.toString()];
        } else {
            return error("No book with ISBN ${isbn} is available");
        }
    }

    remote function borrow_book(Book request) returns Responds|error {
        string isbn = request.ISBN;
        Book? book = self.books[isbn];

        if (book != null && book.status == "available") {
            book.status = "borrowed";
            Responds response = {message: "Book borrowed successfully"};
            return response;
        } else {
            return error("Book with ISBN ${isbn} is not available for borrowing");
        }
    }
   
}

