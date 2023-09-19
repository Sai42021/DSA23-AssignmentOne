import ballerina/http;
import ballerina/io;

type Lecturer record {
    readonly string staffNum;
    string staffName;
    string title;
    Course course;
    string officeNumber;
};

type Course record {
    readonly string courseCode;
    string courseName;
    string nqfLevel;
};

table<Lecturer> key(staffNum) lecturers = table [];

service /lecturers on new http:Listener(4000) {
    resource function post addLecturer(@http:Payload Lecturer lecturer) returns string {
        io:println(lecturer);
        error? err = lecturers.add(lecturer);
        if (err is error) {
            return string `Error, ${err.message()}`;
        }
        return string `${lecturer.staffNum} saved successfully`;
    }

    resource function put updateLecturerDetails(@http:Payload Lecturer lecturer) returns string {
        io:println(lecturer);
        error? err = lecturers.put(lecturer);
        if (err is error) {
            return string `Error, ${err.message()}`;
        }
        return string `${lecturer.staffNum} saved successfully`;
    }
    resource function get getAllLecturers() returns table<Lecturer> key(staffNum) {
        return lecturers;
    }

    resource function get getLecturerByNumber(string staffNum) returns Lecturer|string {
        foreach Lecturer lecturer in lecturers {
            if (lecturer.staffNum === staffNum) {
                return lecturer;
            }
        }
        return staffNum + " is invalid";
    }

    resource function delete deleteLectuerByNumber/[string staffNum]() returns string {
        table<Lecturer> lecturer1 = table [];
        foreach Lecturer lecturer in lecturers {
            if (lecturer.staffNum !== staffNum) {
                lecturer1.add(lecturer);
            }
        }
        lecturers = <table<Lecturer> key(staffNum)>lecturer1;
        if (lecturers.length() === lecturer1.length()) {
            return staffNum + " not found.";
        }
        return staffNum + " successfuly deleted";
    }

    resource function get getLecturersTeachingCourse(string courseCode) returns table<Lecturer> {
        table<Lecturer> lecturersTeachingCourse = table [];
        foreach Lecturer lecturer in lecturers {
            if (lecturer.course.courseCode == courseCode) {
                lecturersTeachingCourse.add(lecturer);
            }
        }
        return lecturersTeachingCourse;
    }
    resource function get getLecturersInOffice(string officeNumber) returns table<Lecturer> {
        table<Lecturer> lecturersInOffice = table [];
        foreach Lecturer lecturer in lecturers {
            if (lecturer.officeNumber == officeNumber) {
                lecturersInOffice.add(lecturer);
            }
        }
        return lecturersInOffice;
    }
}
