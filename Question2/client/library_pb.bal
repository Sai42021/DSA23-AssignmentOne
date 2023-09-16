import ballerina/grpc;
import ballerina/protobuf.types.empty;
import ballerina/protobuf.types.wrappers;

public isolated client class libraryManagementClient {
    *grpc:AbstractClientEndpoint;

    private final grpc:Client grpcClient;

    public isolated function init(string url, *grpc:ClientConfiguration config) returns grpc:Error? {
        self.grpcClient = check new (url, config);
        check self.grpcClient.initStub(self, ROOT_DESCRIPTOR_LIBRARY, getDescriptorMapLibrary());
    }

    isolated remote function add_book(Book|ContextBook req) returns Responds|grpc:Error {
        map<string|string[]> headers = {};
        Book message;
        if req is ContextBook {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("LibraryManagement.libraryManagement/add_book", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <Responds>result;
    }

    isolated remote function add_bookContext(Book|ContextBook req) returns ContextResponds|grpc:Error {
        map<string|string[]> headers = {};
        Book message;
        if req is ContextBook {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("LibraryManagement.libraryManagement/add_book", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <Responds>result, headers: respHeaders};
    }

    isolated remote function create_users(User|ContextUser req) returns Responds|grpc:Error {
        map<string|string[]> headers = {};
        User message;
        if req is ContextUser {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("LibraryManagement.libraryManagement/create_users", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <Responds>result;
    }

    isolated remote function create_usersContext(User|ContextUser req) returns ContextResponds|grpc:Error {
        map<string|string[]> headers = {};
        User message;
        if req is ContextUser {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("LibraryManagement.libraryManagement/create_users", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <Responds>result, headers: respHeaders};
    }

    isolated remote function update_book(Book|ContextBook req) returns Responds|grpc:Error {
        map<string|string[]> headers = {};
        Book message;
        if req is ContextBook {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("LibraryManagement.libraryManagement/update_book", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <Responds>result;
    }

    isolated remote function update_bookContext(Book|ContextBook req) returns ContextResponds|grpc:Error {
        map<string|string[]> headers = {};
        Book message;
        if req is ContextBook {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("LibraryManagement.libraryManagement/update_book", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <Responds>result, headers: respHeaders};
    }

    isolated remote function update_user(User|ContextUser req) returns Responds|grpc:Error {
        map<string|string[]> headers = {};
        User message;
        if req is ContextUser {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("LibraryManagement.libraryManagement/update_user", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <Responds>result;
    }

    isolated remote function update_userContext(User|ContextUser req) returns ContextResponds|grpc:Error {
        map<string|string[]> headers = {};
        User message;
        if req is ContextUser {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("LibraryManagement.libraryManagement/update_user", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <Responds>result, headers: respHeaders};
    }

    isolated remote function remove_user(string|wrappers:ContextString req) returns Responds|grpc:Error {
        map<string|string[]> headers = {};
        string message;
        if req is wrappers:ContextString {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("LibraryManagement.libraryManagement/remove_user", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <Responds>result;
    }

    isolated remote function remove_userContext(string|wrappers:ContextString req) returns ContextResponds|grpc:Error {
        map<string|string[]> headers = {};
        string message;
        if req is wrappers:ContextString {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("LibraryManagement.libraryManagement/remove_user", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <Responds>result, headers: respHeaders};
    }

    isolated remote function remove_book(string|wrappers:ContextString req) returns Responds|grpc:Error {
        map<string|string[]> headers = {};
        string message;
        if req is wrappers:ContextString {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("LibraryManagement.libraryManagement/remove_book", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <Responds>result;
    }

    isolated remote function remove_bookContext(string|wrappers:ContextString req) returns ContextResponds|grpc:Error {
        map<string|string[]> headers = {};
        string message;
        if req is wrappers:ContextString {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("LibraryManagement.libraryManagement/remove_book", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <Responds>result, headers: respHeaders};
    }

    isolated remote function locate_book(string|wrappers:ContextString req) returns Book|grpc:Error {
        map<string|string[]> headers = {};
        string message;
        if req is wrappers:ContextString {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("LibraryManagement.libraryManagement/locate_book", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <Book>result;
    }

    isolated remote function locate_bookContext(string|wrappers:ContextString req) returns ContextBook|grpc:Error {
        map<string|string[]> headers = {};
        string message;
        if req is wrappers:ContextString {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("LibraryManagement.libraryManagement/locate_book", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <Book>result, headers: respHeaders};
    }

    isolated remote function borrow_book(Book|ContextBook req) returns Responds|grpc:Error {
        map<string|string[]> headers = {};
        Book message;
        if req is ContextBook {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("LibraryManagement.libraryManagement/borrow_book", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <Responds>result;
    }

    isolated remote function borrow_bookContext(Book|ContextBook req) returns ContextResponds|grpc:Error {
        map<string|string[]> headers = {};
        Book message;
        if req is ContextBook {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("LibraryManagement.libraryManagement/borrow_book", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <Responds>result, headers: respHeaders};
    }

    isolated remote function list_all_users() returns stream<User, grpc:Error?>|grpc:Error {
        empty:Empty message = {};
        map<string|string[]> headers = {};
        var payload = check self.grpcClient->executeServerStreaming("LibraryManagement.libraryManagement/list_all_users", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, _] = payload;
        UserStream outputStream = new UserStream(result);
        return new stream<User, grpc:Error?>(outputStream);
    }

    isolated remote function list_all_usersContext() returns ContextUserStream|grpc:Error {
        empty:Empty message = {};
        map<string|string[]> headers = {};
        var payload = check self.grpcClient->executeServerStreaming("LibraryManagement.libraryManagement/list_all_users", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, respHeaders] = payload;
        UserStream outputStream = new UserStream(result);
        return {content: new stream<User, grpc:Error?>(outputStream), headers: respHeaders};
    }
}

public class UserStream {
    private stream<anydata, grpc:Error?> anydataStream;

    public isolated function init(stream<anydata, grpc:Error?> anydataStream) {
        self.anydataStream = anydataStream;
    }

    public isolated function next() returns record {|User value;|}|grpc:Error? {
        var streamValue = self.anydataStream.next();
        if (streamValue is ()) {
            return streamValue;
        } else if (streamValue is grpc:Error) {
            return streamValue;
        } else {
            record {|User value;|} nextRecord = {value: <User>streamValue.value};
            return nextRecord;
        }
    }

    public isolated function close() returns grpc:Error? {
        return self.anydataStream.close();
    }
}

public client class LibraryManagementRespondsCaller {
    private grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendResponds(Responds response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextResponds(ContextResponds response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public client class LibraryManagementUserCaller {
    private grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendUser(User response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextUser(ContextUser response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public client class LibraryManagementBookCaller {
    private grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendBook(Book response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextBook(ContextBook response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public type ContextUserStream record {|
    stream<User, error?> content;
    map<string|string[]> headers;
|};

public type ContextUser record {|
    User content;
    map<string|string[]> headers;
|};

public type ContextBook record {|
    Book content;
    map<string|string[]> headers;
|};

public type ContextResponds record {|
    Responds content;
    map<string|string[]> headers;
|};

public type User record {|
    string userID = "";
    string firstName = "";
    string lastName = "";
|};

public type Book record {|
    string ISBN = "";
    string title = "";
    string author_1 = "";
    string author_2 = "";
    string location = "";
    string status = "";
|};

public type BookISBN record {|
    string ISBN = "";
|};

public type Responds record {|
    string message = "";
|};

const string ROOT_DESCRIPTOR_LIBRARY = "0A0D6C6962726172792E70726F746F12114C6962726172794D616E6167656D656E741A1E676F6F676C652F70726F746F6275662F77726170706572732E70726F746F1A1B676F6F676C652F70726F746F6275662F656D7074792E70726F746F229A010A04426F6F6B12120A044953424E18012001280952044953424E12140A057469746C6518022001280952057469746C6512190A08617574686F725F311803200128095207617574686F723112190A08617574686F725F321804200128095207617574686F7232121A0A086C6F636174696F6E18052001280952086C6F636174696F6E12160A06737461747573180620012809520673746174757322580A045573657212160A067573657249441801200128095206757365724944121C0A0966697273744E616D65180220012809520966697273744E616D65121A0A086C6173744E616D6518032001280952086C6173744E616D6522240A08526573706F6E647312180A076D65737361676518012001280952076D657373616765221E0A08426F6F6B4953424E12120A044953424E18012001280952044953424E3289050A116C6962726172794D616E6167656D656E7412400A086164645F626F6F6B12172E4C6962726172794D616E6167656D656E742E426F6F6B1A1B2E4C6962726172794D616E6167656D656E742E526573706F6E647312440A0C6372656174655F757365727312172E4C6962726172794D616E6167656D656E742E557365721A1B2E4C6962726172794D616E6167656D656E742E526573706F6E647312430A0B7570646174655F626F6F6B12172E4C6962726172794D616E6167656D656E742E426F6F6B1A1B2E4C6962726172794D616E6167656D656E742E526573706F6E647312430A0B7570646174655F7573657212172E4C6962726172794D616E6167656D656E742E557365721A1B2E4C6962726172794D616E6167656D656E742E526573706F6E647312480A0B72656D6F76655F75736572121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A1B2E4C6962726172794D616E6167656D656E742E526573706F6E647312480A0B72656D6F76655F626F6F6B121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A1B2E4C6962726172794D616E6167656D656E742E526573706F6E647312430A0E6C6973745F616C6C5F757365727312162E676F6F676C652E70726F746F6275662E456D7074791A172E4C6962726172794D616E6167656D656E742E55736572300112440A0B6C6F636174655F626F6F6B121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A172E4C6962726172794D616E6167656D656E742E426F6F6B12430A0B626F72726F775F626F6F6B12172E4C6962726172794D616E6167656D656E742E426F6F6B1A1B2E4C6962726172794D616E6167656D656E742E526573706F6E6473620670726F746F33";

public isolated function getDescriptorMapLibrary() returns map<string> {
    return {"google/protobuf/empty.proto": "0A1B676F6F676C652F70726F746F6275662F656D7074792E70726F746F120F676F6F676C652E70726F746F62756622070A05456D70747942540A13636F6D2E676F6F676C652E70726F746F627566420A456D70747950726F746F50015A057479706573F80101A20203475042AA021E476F6F676C652E50726F746F6275662E57656C6C4B6E6F776E5479706573620670726F746F33", "google/protobuf/wrappers.proto": "0A1E676F6F676C652F70726F746F6275662F77726170706572732E70726F746F120F676F6F676C652E70726F746F62756622230A0B446F75626C6556616C756512140A0576616C7565180120012801520576616C756522220A0A466C6F617456616C756512140A0576616C7565180120012802520576616C756522220A0A496E74363456616C756512140A0576616C7565180120012803520576616C756522230A0B55496E74363456616C756512140A0576616C7565180120012804520576616C756522220A0A496E74333256616C756512140A0576616C7565180120012805520576616C756522230A0B55496E74333256616C756512140A0576616C756518012001280D520576616C756522210A09426F6F6C56616C756512140A0576616C7565180120012808520576616C756522230A0B537472696E6756616C756512140A0576616C7565180120012809520576616C756522220A0A427974657356616C756512140A0576616C756518012001280C520576616C756542570A13636F6D2E676F6F676C652E70726F746F627566420D577261707065727350726F746F50015A057479706573F80101A20203475042AA021E476F6F676C652E50726F746F6275662E57656C6C4B6E6F776E5479706573620670726F746F33", "library.proto": "0A0D6C6962726172792E70726F746F12114C6962726172794D616E6167656D656E741A1E676F6F676C652F70726F746F6275662F77726170706572732E70726F746F1A1B676F6F676C652F70726F746F6275662F656D7074792E70726F746F229A010A04426F6F6B12120A044953424E18012001280952044953424E12140A057469746C6518022001280952057469746C6512190A08617574686F725F311803200128095207617574686F723112190A08617574686F725F321804200128095207617574686F7232121A0A086C6F636174696F6E18052001280952086C6F636174696F6E12160A06737461747573180620012809520673746174757322580A045573657212160A067573657249441801200128095206757365724944121C0A0966697273744E616D65180220012809520966697273744E616D65121A0A086C6173744E616D6518032001280952086C6173744E616D6522240A08526573706F6E647312180A076D65737361676518012001280952076D657373616765221E0A08426F6F6B4953424E12120A044953424E18012001280952044953424E3289050A116C6962726172794D616E6167656D656E7412400A086164645F626F6F6B12172E4C6962726172794D616E6167656D656E742E426F6F6B1A1B2E4C6962726172794D616E6167656D656E742E526573706F6E647312440A0C6372656174655F757365727312172E4C6962726172794D616E6167656D656E742E557365721A1B2E4C6962726172794D616E6167656D656E742E526573706F6E647312430A0B7570646174655F626F6F6B12172E4C6962726172794D616E6167656D656E742E426F6F6B1A1B2E4C6962726172794D616E6167656D656E742E526573706F6E647312430A0B7570646174655F7573657212172E4C6962726172794D616E6167656D656E742E557365721A1B2E4C6962726172794D616E6167656D656E742E526573706F6E647312480A0B72656D6F76655F75736572121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A1B2E4C6962726172794D616E6167656D656E742E526573706F6E647312480A0B72656D6F76655F626F6F6B121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A1B2E4C6962726172794D616E6167656D656E742E526573706F6E647312430A0E6C6973745F616C6C5F757365727312162E676F6F676C652E70726F746F6275662E456D7074791A172E4C6962726172794D616E6167656D656E742E55736572300112440A0B6C6F636174655F626F6F6B121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A172E4C6962726172794D616E6167656D656E742E426F6F6B12430A0B626F72726F775F626F6F6B12172E4C6962726172794D616E6167656D656E742E426F6F6B1A1B2E4C6962726172794D616E6167656D656E742E526573706F6E6473620670726F746F33"};
}

