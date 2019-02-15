package edu.mcw.rgd.service;

import edu.mcw.rgd.model.CuratableCondition;

public class PubMedDbService {

	
	public static String getCuratableFromHbase(CuratableCondition curCond) {
		setFetchedToHbase(curCond);

		try {
			String curatable = HBaseService.getHbaseField(curCond.getPmId(), "c:y");
			return curatable;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public static String setCuratableToHbase(String Pmid, Boolean value) {
		
		try {
			String hbaesValue = value ? "Y" : "N"; 
			HBaseService.setHbaseField(Pmid, "c:y", hbaesValue);
			return hbaesValue;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public static String getVisitedFromHbase(CuratableCondition curCond) {
		try {
			return HBaseService.getHbaseField(curCond.getPmId(), "c:z"); 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	
	public static void setVisitedToHbase(CuratableCondition curCond) {
		if (curCond.getAction().equals("close")) return; 
		HBaseService.logActionToHbase(curCond, "c:z");
	}
	
	public static void setCuratedToHbase(CuratableCondition curCond) {
		HBaseService.logActionToHbase(curCond, "c:c");
	}
	
	public static void setFetchedToHbase(CuratableCondition curCond) {
		HBaseService.logActionToHbase(curCond, "c:f");
	}
	
	public static void setOpenPubmedToHbase(CuratableCondition curCond) {
		HBaseService.logActionToHbase(curCond, "c:p");
	}
	
	public static void setOpenFullTextToHbase(CuratableCondition curCond) {
		HBaseService.logActionToHbase(curCond, "c:q");
	}

	public static void setSkynetVisitedToHbase(CuratableCondition curCond) {
		if (curCond.getAction().equals("close")) return; 
		HBaseService.logActionToHbase(curCond, "s:z");
	}
	
	public static void setSkynetFetchedToHbase(CuratableCondition curCond) {
		HBaseService.logActionToHbase(curCond, "s:f");
	}
	
	public static void setSkynetOpenPubmedToHbase(CuratableCondition curCond) {
		HBaseService.logActionToHbase(curCond, "s:p");
	}
	
	public static void setSkynetOpenFullTextToHbase(CuratableCondition curCond) {
		HBaseService.logActionToHbase(curCond, "s:q");
	}

	public static String getSkynetCuratableFromHbase(CuratableCondition curCond) {
		setSkynetFetchedToHbase(curCond);

		try {
			String curatable = HBaseService.getHbaseField(curCond.getPmId(), "s:y");
			return curatable;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public static String setSkynetCuratableToHbase(String Pmid, Boolean value) {
		
		try {
			String hbaesValue = value ? "Y" : "N"; 
			HBaseService.setHbaseField(Pmid, "s:y", hbaesValue);
			return hbaesValue;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
