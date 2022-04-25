package jdbc;

public class gDBDTO {

	private String gNum;
	private String gNicName;
	private String gTitle;
	private String gText; 
	private String gPNumber; 
	private String gTime; 

	public String getgNum() {
		return gNum;
	}

	public String getgNicName() {
		return gNicName;
	}

	public String getgTitle() {
		return gTitle;
	}

	public String getgText() {
		return gText;
	}

	public String getgPNumber() {
		return gPNumber;
	}

	public String getgTime() {
		return gTime;
	}
	   public gDBDTO(String gNum, String gNicName, String gTitle, String gText, String gPNumber, String gTime) {
		      super();
		      this.gNum = gNum;
		      this.gNicName = gNicName;
		      this.gTitle = gTitle;
		      this.gText = gText;
		      this.gPNumber = gPNumber;
		      this.gTime = gTime;
		   }



	}