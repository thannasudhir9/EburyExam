/**
 * @description       : 
 * @author            : Sudhir Kumar Thanna
 * @group             : 
 * @last modified on  : 04-12-2022
 * @last modified by  : Sudhir Kumar Thanna
**/
@isTest
global class MockHttpResponseGenerator implements HttpCalloutMock {
    // Implement this interface method
    global HTTPResponse respond(HTTPRequest req) {
        // Optionally, only send a mock response for a specific endpoint
        // and method.
        System.assertEquals('http://data.fixer.io/api/latest?access_key=c1dcf3ed205b67b261a2dcbefc8dea5c&format=1', req.getEndpoint());
        System.assertEquals('GET', req.getMethod());
        
        // Create a fake response
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody('{"success":true,"timestamp":1649773024,"base":"EUR","date":"2022-04-12","rates":{"AED":3.997056,"AFN":95.728118,"ALL":121.186954,"AMD":514.875871,"ANG":1.96149,"ZWL":350.410841}}');
        res.setStatusCode(200);
        return res;
    }
}