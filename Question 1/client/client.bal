import ballerina/io;
import ballerina/http;

public type Lecturer record {
    string staffNum?;
    string staffName?;
    string title?;
    Course course?;
    string officeNumber?;
};

public type Course record {
    string courseCode?;
    string courseName?;
    string nqfLevel?;
};

public function main() returns error? {
    http:Client lecturerClient = check new ("localhost:4000/lecturers");

    io:println("1. Add Lecturer");
    io:println("2. Update Lecturer");
    io:println("3. Delete Lecturer");
    io:println("4. View All Lecturers");
    io:println("5. View Lecturer By Staff Number");
    io:println("6. View Lecturers Teaching a Course");
    io:println("7. View Lecturers in an Office");
    string option = io:readln("Choose an option: ");

    match option {
        "1" => {
            Lecturer lecturer = {};
            lecturer.staffNum = io:readln("Enter Staff Number: ");
            lecturer.staffName = io:readln("Enter Staff Name: ");
            lecturer.title = io:readln("Enter Title: ");
            lecturer.officeNumber = io:readln("Enter Office Number: ");
            lecturer.course = {
                courseCode: io:readln("Enter Course Code: "),
                courseName: io:readln("Enter Course Name: "),
                nqfLevel: io:readln("Enter National Qualifications Framework level: ")
            };
            check addLecturer(lecturerClient, lecturer);
        }
        "2" => {
            Lecturer lecturer = {};
            lecturer.staffNum = io:readln("Enter Staff Number: ");
            lecturer.staffName = io:readln("Enter Staff Name: ");
            lecturer.title = io:readln("Enter Title: ");
            lecturer.officeNumber = io:readln("Enter Office Number: ");
            lecturer.course = {
                courseCode: io:readln("Enter Course Code: "),
                courseName: io:readln("Enter Course Name: "),
                nqfLevel: io:readln("Enter National Qualifications Framework level: ")
            };
            check updateLecturer(lecturerClient, lecturer);
        }
        "3" => {
            string staffNum = io:readln("Enter Staff Number: ");
            check deleteLecturer(lecturerClient, staffNum);
        }
        "4" => {
            check getAllLecturers(lecturerClient);
        }
        "5" => {
            string staffNum = io:readln("Enter Staff Number: ");
            check getLecturerByStaffNum(lecturerClient, staffNum);
        }
        "6" => {
            string courseCode = io:readln("Enter Course Code: ");
            check getLecturersTeachingCourse(lecturerClient, courseCode);
        }
        "7" => {
            string officeNumber = io:readln("Enter Office Number: ");
            check getLecturersInOffice(lecturerClient, officeNumber);
        }
        _ => {
            io:println("Invalid Key");
            check main();
        }
    }
}


public function addLecturer(http:Client http, Lecturer lecturer) returns error? {
    if (http is http:Client) {
        string message = check http->/addLecturer.post(lecturer);
        io:println(message);
    }
}

public function updateLecturer(http:Client http, Lecturer lecturer) returns error? {
    if (http is http:Client) {
        string message = check http->/updateLecturerDetails.put(lecturer);
        io:println(message);
    }
}

public function deleteLecturer(http:Client http, string staffNum) returns error? {
    if (http is http:Client) {
        string message = check http->/deleteLectuerByNumber.get(staffNum = staffNum);
        io:println(message);
    }
}

public function getAllLecturers(http:Client http) returns error? {
    if (http is http:Client) {
        table<Lecturer> lecturers = check http->/getAllLecturers.get();
        foreach Lecturer lecturer in lecturers {
            io:println("--------------------------");
            io:println("Staff Number: ", lecturer.staffNum);
            io:println("Staff Name: ", lecturer.staffName);
            io:println("Title: ", lecturer.title);
            io:println("Office Number: ", lecturer.officeNumber);
            io:println("Course: ", lecturer.course);
        }
    }
}

public function getLecturerByStaffNum(http:Client http, string staffNum) returns error? {
    if (http is http:Client) {
        Lecturer|string lecturer = check http->/getLecturerByNumber.get(staffNum = staffNum);
        if (lecturer is Lecturer) {
            io:println("--------------------------");
            io:println("Staff Number: ", lecturer.staffNum);
            io:println("Staff Name: ", lecturer.staffName);
            io:println("Title: ", lecturer.title);
            io:println("Course: ", lecturer.course);
            io:println("Office Number: ", lecturer.officeNumber);
        } else {
            io:println(lecturer);
        }
    }
}

public function getLecturersTeachingCourse(http:Client http, string courseCode) returns error? {
    if (http is http:Client) {
        table<Lecturer> lecturers = check http->/getLecturersTeachingCourse.get({courseCode});
        foreach Lecturer lecturer in lecturers {
            io:println("--------------------------");
            io:println("Staff Number: ", lecturer.staffNum);
            io:println("Staff Name: ", lecturer.staffName);
            io:println("Title: ", lecturer.title);
            io:println("Office Number: ", lecturer.officeNumber);
            io:println("Course: ", lecturer.course);
        }
    }
}

public function getLecturersInOffice(http:Client http, string officeNumber) returns error? {
    if (http is http:Client) {
        table<Lecturer> lecturers = check http->/getLecturersInOffice.get({officeNumber});
        foreach Lecturer lecturer in lecturers {
            io:println("--------------------------");
            io:println("Staff Number: ", lecturer.staffNum);
            io:println("Staff Name: ", lecturer.staffName);
            io:println("Title: ", lecturer.title);
            io:println("Office Number: ", lecturer.officeNumber);
            io:println("Course: ", lecturer.course);
        }
    }
}
