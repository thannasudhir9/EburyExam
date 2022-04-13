/**
 * @description       : 
 * @author            : Sudhir Kumar Thanna
 * @group             : 
 * @last modified on  : 04-12-2022
 * @last modified by  : Sudhir Kumar Thanna
**/
@IsTest
public with sharing class TestFixerTradeController {
    @isTest static void testCallout() {
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        
        // Call method to test.
        // This causes a fake response to be sent
        // from the class that implements HttpCalloutMock. 
        HttpResponse res = FixerTradeController.getTradeInformationHTTPResponse();
        
        // Verify response received contains fake values
        String contentType = res.getHeader('Content-Type');
        System.assert(contentType == 'application/json');
        String actualValue = res.getBody();
        String expectedValue = '{"success":true,"timestamp":1649773024,"base":"EUR","date":"2022-04-12","rates":{"AED":3.997056,"AFN":95.728118,"ALL":121.186954,"AMD":514.875871,"ANG":1.96149,"ZWL":350.410841}}';
        System.assertEquals(actualValue, expectedValue);
        System.assertEquals(200, res.getStatusCode());
    }

    @isTest static void testCalloutTradeRates() {
        
        Test.startTest();
        Map<String,String> mapObj = FixerTradeController.getTradeInformation();
        Test.stopTest();
        System.debug( 'INR is>>> ' + mapObj.get('INR'));
        String inrVal = mapObj.get('INR');
        System.assert(inrVal != null, 'Fetched INR Value Succesfully - check passed');
    }
}
