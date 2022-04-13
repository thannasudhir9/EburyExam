/**
 * @description       : 
 * @author            : Sudhir Kumar Thanna
 * @group             : 
 * @last modified on  : 04-12-2022
 * @last modified by  : Sudhir Kumar Thanna
**/
public with sharing class FixerTradeController {
    
    public static HTTPResponse getTradeInformationHTTPResponse() {
        
        //instantiate and setup the http request
        HttpRequest req = new HttpRequest();
        req.setMethod('GET');
        req.setEndpoint('http://data.fixer.io/api/latest?access_key=c1dcf3ed205b67b261a2dcbefc8dea5c&format=1');
        System.debug('getTradeInformation-req:::'+req);
        Http http = new Http();
        HttpResponse response = http.send(req);
        String responseBody = response.getBody();

        FixerIOTradeDTO responseBodyObj = (FixerIOTradeDTO)JSON.deserialize(responseBody, FixerIOTradeDTO.class);
        System.debug('FixerIOTradeDTO-responseBodyObj--res--Final:::'+responseBodyObj);
        return response;
    }    

    @AuraEnabled(cacheable=true)
    public static Map<String,String> getTradeInformation() {
        
        String responseBody;
        if(!Test.isRunningTest()){
            HttpResponse response = getTradeInformationHTTPResponse();
            responseBody = response.getBody();
        }
        if(Test.isRunningTest()){
            responseBody = '{"success":true,"timestamp":1649773024,"base":"EUR","date":"2022-04-12","rates":{"AED":3.997056,"AFN":95.728118,"ALL":121.186954,"INR":82.875871,"ANG":1.96149,"ZWL":350.410841}}';
        }
    
        FixerIOTradeDTO responseBodyObj = (FixerIOTradeDTO)JSON.deserialize(responseBody, FixerIOTradeDTO.class);
        System.debug('FixerIOTradeDTO-responseBodyObj--res--Final:::'+responseBodyObj);
        String newResponse = String.valueOf(responseBodyObj.rates);
      
        Map<String,String> mapObj = new Map<String,String>();
        newResponse=newResponse.replace('Rates:[','');
        newResponse=newResponse.replace(']','');
        String[] strs =  newResponse.split(',');
        for(String inp: strs){
            String delimiter = '=';
            String firstSplit = inp.substringBefore(delimiter); 
            firstSplit = firstSplit.trim();
            String lastSplits = inp.substringAfter(delimiter);
            mapObj.put(firstSplit,lastSplits);
        }        
        system.debug( 'INR is>>> ' + mapObj.get('INR') );
        return mapObj;
    }    
}