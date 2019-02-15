package edu.mcw.rgd.model;

public class FieldQueryCondition {

	/**
	 * @return the fieldName
	 */
	public String getFieldName() {
		return fieldName;
	}
	/**
	 * @param fieldName the fieldName to set
	 */
	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}
	/**
	 * @return the fieldValue
	 */
	public String getFieldValue() {
		return fieldValue;
	}
	/**
	 * @param fieldValue the fieldValue to set
	 */
	public void setFieldValue(String fieldValue) {
		this.fieldValue = fieldValue.replaceAll("\\(XP:", "\\(HP:");
	}
	/**
	 * @return the isOntologyTerm
	 */
	public boolean isOntologyTerm() {
		return isOntologyTerm;
	}
	/**
	 * @param isOntologyTerm the isOntologyTerm to set
	 */
	public void setOntologyTerm(boolean isOntologyTerm) {
		this.isOntologyTerm = isOntologyTerm;
	}
	/**
	 * @return the includeSynonyms
	 */
	public boolean isIncludeSynonyms() {
		return includeSynonyms;
	}
	/**
	 * @param includeSynonyms the includeSynonyms to set
	 */
	public void setIncludeSynonyms(boolean includeSynonyms) {
		this.includeSynonyms = includeSynonyms;
	}
	/**
	 * @return the includeChildTerms
	 */
	public boolean isIncludeChildTerms() {
		return includeChildTerms;
	}
	/**
	 * @param includeChildTerms the includeChildTerms to set
	 */
	public void setIncludeChildTerms(boolean includeChildTerms) {
		this.includeChildTerms = includeChildTerms;
	}
	/**
	 * @return the notCondition
	 */
	public boolean isNotCondition() {
		return notCondition;
	}
	/**
	 * @param notCondition the notCondition to set
	 */
	public void setNotCondition(boolean notCondition) {
		this.notCondition = notCondition;
	}
	/**
	 * @return the booleanOpt
	 */
	public String getBooleanOpt() {
		return booleanOpt;
	}
	/**
	 * @param booleanOpt the booleanOpt to set
	 */
	public void setBooleanOpt(String booleanOpt) {
		this.booleanOpt = booleanOpt;
	}
	private String fieldName;
	private String fieldValue;
	private boolean isOntologyTerm;
	private boolean includeSynonyms;
	private boolean includeChildTerms;
	private boolean notCondition;
	private String booleanOpt="AND";
	
	
}
