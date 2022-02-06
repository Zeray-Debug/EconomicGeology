public class TradeBalanceController {
    public string getTradeBalance() {
        //Instantiate a new http object
        http h = new Http();

        //Instatiate the request
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://apps.bea.gov/api/data/?&UserID=51FA3403-7466-4BFB-A714-92CECC10BFA1&method=GetData&datasetname=Regional&TableName=CAGDP9&LineCode=All&GeoFIPS=12103&Year=2020&ResultFormat=JSON');
        request.setMethod('GET');

        //Send the request and return a response
        HttpResponse response = h.send(request);

        if (response.getStatusCode() == 200) {
            //Deserialize the JSON String into collections of primitive data types 
            //Need to change the method call to the actual parser now that it's been changed  
            //Map<String, Object> results = EconomicParser.parseEcon(response.getBody());
        }
        return results;

    }
}
