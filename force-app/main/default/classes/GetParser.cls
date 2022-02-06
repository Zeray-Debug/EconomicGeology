public  class GetParser {

    //Start by setting and getting the appropriate paramater for each inner class in the overall wrapper class 
    public class RequestParam {
        //automatically set the appropriate properties 
        public String ParamaterName {get; set;}
        public String ParamaterValue {get; set;}

        //Set the parser logic in the actual constructor for the class when instantiating it 
        //Also instatitate the JSON Parser class in the actual constructor automatically 
        public RequestParam(JSONParser parser) {
            //Let the compiler realize the end of the first object in the array 
            while (parser.nextToken() != System.JSONToken.END_OBJECT ) {
                //Make sure the current token being pointed to is an actual field name for the control flow 
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME ) {
                    //return the textual representation of th ecurrent token or null if there's no token 
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL ) {
                        if (text == 'ParamaterName') {
                            //pass the the field name into a variable for implementation later 
                            ParamaterName = parser.getText();
                        }

                        else if (text == 'ParamaterValue') {
                            ParamaterValue = parser.getText();
                        }

                        else {
                            System.debug(LoggingLevel.WARN, 'RequestParam consuming unrecognized propert: ' +text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }

    //Write logic for the other arrays following the same logic
    public class Results {
        public string Statistic {get; set;}
        public string UnitOfMeasure {get; set;}
        public string PublicTable {get; set;}
        public String UTCProductionTime {get; set;} 
        public String NoteRef {get; set;}
        public List<Dimensions> Dimensions {get; set;}
        public List<Data> Data {get; set;}
        public List<Notes> Notes {get; set;}

        public Results(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT ) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'Statistic') {
							Statistic = parser.getText();
						} else if (text == 'UnitOfMeasure') {
							UnitOfMeasure = parser.getText();
						} else if (text == 'PublicTable') {
							PublicTable = parser.getText();
						} else if (text == 'UTCProductionTime') {
							UTCProductionTime = parser.getText();
						} else if (text == 'NoteRef') {
							NoteRef = parser.getText();
						} else if (text == 'Dimensions') {
							Dimensions = arrayOfDimensions(parser);
						} else if (text == 'Data') {
							Data = arrayOfData(parser);
						} else if (text == 'Notes') {
							Notes = arrayOfNotes(parser);
						} else {
							System.debug(LoggingLevel.WARN, 'Results consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class BEAAPI {
		public Request Request {get;set;} 
		public Results Results {get;set;} 

		public BEAAPI(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'Request') {
							Request = new Request(parser);
						} else if (text == 'Results') {
							Results = new Results(parser);
						} else {
							System.debug(LoggingLevel.WARN, 'BEAAPI consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class Request {
		public List<RequestParam> RequestParam {get;set;} 

		public Request(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'RequestParam') {
							RequestParam = arrayOfRequestParam(parser);
						} else {
							System.debug(LoggingLevel.WARN, 'Request consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class Dimensions {
		public String Name {get;set;} 
		public String DataType {get;set;} 
		public String IsValue {get;set;} 

		public Dimensions(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'Name') {
							Name = parser.getText();
						} else if (text == 'DataType') {
							DataType = parser.getText();
						} else if (text == 'IsValue') {
							IsValue = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'Dimensions consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class Data {
		public String Code {get;set;} 
		public String GeoFips {get;set;} 
		public String GeoName {get;set;} 
		public String TimePeriod {get;set;} 
		public String CL_UNIT {get;set;} 
		public String UNIT_MULT {get;set;} 
		public String DataValue {get;set;} 

		public Data(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'Code') {
							Code = parser.getText();
						} else if (text == 'GeoFips') {
							GeoFips = parser.getText();
						} else if (text == 'GeoName') {
							GeoName = parser.getText();
						} else if (text == 'TimePeriod') {
							TimePeriod = parser.getText();
						} else if (text == 'CL_UNIT') {
							CL_UNIT = parser.getText();
						} else if (text == 'UNIT_MULT') {
							UNIT_MULT = parser.getText();
						} else if (text == 'DataValue') {
							DataValue = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'Data consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public BEAAPI BEAAPI {get;set;} 

	public GetParser(JSONParser parser) {
		while (parser.nextToken() != System.JSONToken.END_OBJECT) {
			if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
				String text = parser.getText();
				if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
					if (text == 'BEAAPI') {
						BEAAPI = new GetParser(parser);
					} else {
						System.debug(LoggingLevel.WARN, 'GetParser consuming unrecognized property: '+text);
						consumeObject(parser);
					}
				}
			}
		}
	}
	
	public class Notes {
		public String NoteRef {get;set;} 
		public String NoteText {get;set;} 

		public Notes(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'NoteRef') {
							NoteRef = parser.getText();
						} else if (text == 'NoteText') {
							NoteText = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'Notes consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	
	public static GetParser parse(String json) {
		System.JSONParser parser = System.JSON.createParser(json);
		return new GetParser(parser);
	}
	
	public static void consumeObject(System.JSONParser parser) {
		Integer depth = 0;
		do {
			System.JSONToken curr = parser.getCurrentToken();
			if (curr == System.JSONToken.START_OBJECT || 
				curr == System.JSONToken.START_ARRAY) {
				depth++;
			} else if (curr == System.JSONToken.END_OBJECT ||
				curr == System.JSONToken.END_ARRAY) {
				depth--;
			}
		} while (depth > 0 && parser.nextToken() != null);
	}
	





    private static List<RequestParam> arrayOfRequestParam(System.JSONParser p) {
        List<RequestParam> res = new List<RequestParam>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new RequestParam(p));
        }
        return res;
    }


    private static List<Notes> arrayOfNotes(System.JSONParser p) {
        List<Notes> res = new List<Notes>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new Notes(p));
        }
        return res;
    }


    private static List<Dimensions> arrayOfDimensions(System.JSONParser p) {
        List<Dimensions> res = new List<Dimensions>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new Dimensions(p));
        }
        return res;
    }






    private static List<Data> arrayOfData(System.JSONParser p) {
        List<Data> res = new List<Data>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new Data(p));
        }
        return res;
    }


}