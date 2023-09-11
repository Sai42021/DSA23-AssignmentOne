import ballerina/http;
import ballerina/io;

type Lecturer readonly & record {
    string stuffNum;
    string stuffName;
    string title;
    string[] course;
};


type stuffNum string;

table<Lecturer> key(stuffNum) lecturers = table [];


service /course on new http:Listener(4000) {
    resource function post addLecturer(Lecturer lecturer) returns string {
        io:println(lecturer);
        error? err = lecturers.add(lecturer);
        if (err is error) {
            return string `Error, ${err.message()}`;
        }
        return string `${lecturer.stuffNum} saved successfully`;
    }

    resource function put updateLecturerDetails(Lecturer lecturer) returns string {
        io:println(lecturer);
        error? err = lecturers.put(lecturer);
        if (err is error) {
            return string `Error, ${err.message()}`;
        }
        return string `${lecturer.stuffNum} saved successfully`;
    }
    resource function get getAllLecturers() returns table<Lecturer> key(stuffNum) {
        return lecturers;
    }

    
    resource function get getLecturerByNumber(string stuffNum) returns Lecturer|string {
        foreach Lecturer lecturer in lecturers {
            if (lecturer.stuffNum === stuffNum) {
                return lecturer;
            }
        }
        return stuffNum + " is invalid";
    }

    resource function delete deleteLectuerByNumber/[string stuffNum]() returns string {
        table<Lecturer> lecturer1 = table [];
        foreach Lecturer lecturer in lecturers {
            if (lecturer.stuffNum !== stuffNum) {
                lecturer1.add(lecturer);
            }
        }
        lecturers = <table<Lecturer> key(stuffNum)>lecturer1;
        if (lecturers.length() === lecturer1.length()) {
            return stuffNum + " not found.";
        }
        return stuffNum + " successfuly deleted";
    }

// Retrieve all the lecturers that teach a certain course.
// Retrieve all the lecturers that sit in the same office. 
}