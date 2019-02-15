package edu.mcw.rgd.model;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class OntoTermIdStr {
	
	static public String TERM_ID_PATTERN = "(.*)\\((.+):(\\d+)\\)"; 
	static public String ID_PATTERN = "(.+):(\\d+)"; 
	private String term;
	private Long id;
	private String fullId;
	/**
	 * @return the fullId
	 */
	public String getFullId() {
		return fullId;
	}

	/**
	 * @param fullId the fullId to set
	 */
	public void setFullId(String fullId) {
		this.fullId = fullId;
	}

	private String cat;
	
	/**
	 * @return the term
	 */
	public String getTerm() {
		return term;
	}

	/**
	 * @param term the term to set
	 */
	public void setTerm(String term) {
		this.term = term;
	}

	/**
	 * @return the id
	 */
	public Long getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * @return the cat
	 */
	public String getCat() {
		return cat;
	}

	/**
	 * @param cat the cat to set
	 */
	public void setCat(String cat) {
		this.cat = cat;
	}

	public OntoTermIdStr(String fullStr) {
		analyzeFullStr(fullStr);
	}
	
	private void analyzeFullStr(String fullStr) {

		 Pattern p = Pattern.compile(TERM_ID_PATTERN);
		 Matcher m = p.matcher(fullStr);
		 if (m.find()) { // Match for ONT_TERM(CAT:ID) 
			 setTerm(m.group(1));
            if(m.group(2).toUpperCase().equals("DOID")){
                setCat("RDO");
                setId(new Long(m.group(3)));

                setFullId("DOID:"+ m.group(3));
            }
            else {
			 setCat(m.group(2).toUpperCase());
			 setId(new Long(m.group(3)));
			 setFullId(padId(getCat(), getId()));
            }
		 } else { // Match for CAT:ID
			 p = Pattern.compile(ID_PATTERN);
			 m = p.matcher(fullStr);
			 if (m.find()) {
                if(m.group(1).equals("DOID")){

                    setCat("RDO");
                    setId(new Long(m.group(2)));
                    setFullId("DOID:"+ m.group(2));
                }
                else {

				 setCat(m.group(1));
				 setId(new Long(m.group(2)));
				 setFullId(padId(getCat(), getId()));
                }
			 } else // Just the term
			 {
				 setTerm(fullStr);
			 }
		 }
	}
	
	private String padId(String cat, Long id) {
        if (cat.equalsIgnoreCase("chebi") || cat.equalsIgnoreCase("doid")) {
			return cat + ":" + id;
		} else {

			return cat + ":" + String.format("%07d", id);
		}

	}
	
	static public void main(String[] args) {
		OntoTermIdStr str = new OntoTermIdStr("rattus");
		System.out.println("term:"+str.getTerm());
		System.out.println("id:"+str.getId());
		System.out.println("cat:"+str.getCat());
		System.out.println("full id:"+str.getFullId());
	}
}
