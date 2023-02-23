
import ballerina/http;
import ballerina/time;

listener http:Listener httpListener = new (8080);

service / on httpListener {

    resource function get greeting() returns string {
        return "Hello :, World";
    }

    resource function get greeting/[string name]() returns string {
        return "Hello : " + name;
    }

    resource function post greeting(@http:Payload json payload) returns json|error {
        string name = "";

        name = check payload.name;

        time:Utc currentTime = time:utcNow();
        string customTime = time:utcToString(currentTime);
        json response = {
            name: name,
            message: "Hello",
            date: customTime
};
        return response;
    }

}

