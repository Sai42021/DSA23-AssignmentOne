import ballerina/io;

libraryManagementClient ep = check new ("http://localhost:9090");

public function main() returns error? {
    // Create a Book instance to use in requests
    Book sampleBook = {
        ISBN: "1234567890",
        title: "Sample Book",
        author_1: "Author A",
        author_2: "Author B",
        location: "Library Shelf 1",
        status: "available"
    };

    Book sampleBook2 = {
        ISBN: "2233567890",
        title: "Sample Book2",
        author_1: "Sai",
        author_2: "Keith",
        location: "Library Shelf 11",
        status: "available"
    };

    Book sampleBook3 = {
        ISBN: "1234567700",
        title: "Sample Book",
        author_1: "Noku",
        author_2: "Wes",
        location: "Library Shelf 14",
        status: "available"
    };

    // Create a User instance to use in requests
    User sampleUser = {
        userID: "user1",
        firstName: "John", 
        lastName: "Doe"
    };

    User sampleUser2 = {
        userID: "user2",
        firstName: "Sai", 
        lastName: "Sem"
    };

    User sampleUser3 = {
        userID: "user1",
        firstName: "Keith", 
        lastName: "Johnson?"
    };

    // Add a book function
    Responds|error book = check addBook(sampleBook);
    io:println(book);
    Responds|error book2 = check addBook(sampleBook2);
    io:println(book2);
    Responds|error book3 = check addBook(sampleBook3);
    io:println(book3);

    // Create a user
    Responds|error user = createUser(sampleUser);
    io:println(user);
    Responds|error user2 = createUser(sampleUser2);
    io:println(user2);
    Responds|error user3 = createUser(sampleUser3);
    io:println(user3);

    // Update a book
    Responds|error bookResult = updateBook(sampleBook);
    io:println(bookResult);

    // Update a user
    Responds|error userResult = updateUser(sampleUser);
    io:println(userResult);

    // Remove a user
    Responds|error removeUserResult = removeUser("user1");
    io:println(removeUserResult);

    // Remove a book
    Responds|error removeBookResult = removeBook("1234567890");
    io:println(removeBookResult);

    // List all users
    stream<User, error?>|error listAllUsersResult = listAllUsers();
    io:println(listAllUsersResult);

    // List available books
    // map<Book>|error listAvailableBooksResult = listAvailableBooks();
    // io:println(listAvailableBooksResult);

    // Locate a book
    Book?|error locateBookResult = locateBook("1234567700");
    io:println(locateBookResult);

    // Borrow a book
    Responds|error borrowBookResult = borrowBook(sampleBook2);
    io:println(borrowBookResult);
}

// Add a book function
function addBook(Book book) returns Responds|error {
    Book addBookRequest = book;
    Responds addBookResponse = check ep->add_book(addBookRequest);
    return addBookResponse;
}

// create a new user function
function createUser(User user) returns Responds|error {
    User createUserRequest = user;
    Responds createUserResponse = check ep->create_users(createUserRequest);
    return createUserResponse;
}

// update book function
function updateBook(Book book) returns Responds|error {
    Book updateBookRequest = book;
    Responds updateBookResponse = check ep->update_book(updateBookRequest);
    return updateBookResponse;
}

// update user function
function updateUser(User user) returns Responds|error {
    User updateUserRequest = user;
    Responds updateUserResponse = check ep->update_user(updateUserRequest);
    return updateUserResponse;
}

// remove user function
function removeUser(string userID) returns Responds|error {
    string removeUserRequest = userID;
    Responds removeUserResponse = check ep->remove_user(removeUserRequest);
    return removeUserResponse;
}

// remove book function
function removeBook(string ISBN) returns Responds|error {
    string removeBookRequest = ISBN;
    Responds removeBookResponse = check ep->remove_book(removeBookRequest);
    return removeBookResponse;
}

// list all users function
function listAllUsers() returns stream<User, error?>|error {
    stream<User, error?> getAllUsersResponse = check ep->list_all_users();
    check getAllUsersResponse.forEach(function(User request) {
        io:println(request);
    });
    return getAllUsersResponse;
}

// list all available books function
// function listAvailableBooks() returns map<Book>|error{
//     map<Book>|error getAllBooksResponse = ep->List_avaialable_books();
//     check getAllBooksResponse.forEach(function(Book request) {
//         io:println(request);
//     });
//     return getAllBooksResponse;
// }

// locate book by title function
function locateBook(string ISBN) returns Book?|error {
    Book locateBookResponse = check ep->locate_book(ISBN);
    io:println(locateBookResponse);
    return locateBookResponse;
}

// borrow book function
function borrowBook(Book book) returns Responds|error {
    Responds borrowBookResponse = check ep->borrow_book(book);
    return borrowBookResponse;
}
