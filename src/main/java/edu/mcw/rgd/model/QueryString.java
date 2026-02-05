package edu.mcw.rgd.model;

import org.apache.commons.lang3.StringEscapeUtils;
import org.springframework.util.AutoPopulatingList;

public class QueryString {
	private String qString;
	private String qAuthorStr;
	public String qSource;
	public String qOrganismNcbiId;
	private AutoPopulatingList<FieldQueryCondition> qFieldConditions;
	/**
	 * @return the qSortConditions
	 */
	public AutoPopulatingList<FieldSortCondition> getqSortConditions() {
		return qSortConditions;
	}

	/**
	 * @param qSortConditions the qSortConditions to set
	 */
	public void setqSortConditions(
			AutoPopulatingList<FieldSortCondition> qSortConditions) {
		this.qSortConditions = qSortConditions;
	}

	private AutoPopulatingList<FieldSortCondition> qSortConditions;
	private String qPMID;

	/**
	 * @return the qPMID
	 */
	public String getqPMID() {
		return qPMID;
	}

	/**
	 * @param qPMID
	 *            the qPMID to set
	 */
	public void setqPMID(String qPMID) {
		this.qPMID = qPMID;
	}

	/**
	 * @return the qFieldConditions
	 */
	public AutoPopulatingList<FieldQueryCondition> getqFieldConditions() {
		return qFieldConditions;
	}

	/**
	 * @param qFieldConditions
	 *            the qFieldConditions to set
	 */
	public void setqFieldConditions(
			AutoPopulatingList<FieldQueryCondition> qFieldConditions) {
		this.qFieldConditions = qFieldConditions;
	}

	/**
	 * @return the qTitleStr
	 */
	public String getqTitleStr() {
		return qTitleStr;
	}

	/**
	 * @param qTitleStr
	 *            the qTitleStr to set
	 */
	public void setqTitleStr(String qTitleStr) {
		this.qTitleStr = qTitleStr;
	}

	/**
	 * @return the qAbstractStr
	 */
	public String getqAbstractStr() {
		return qAbstractStr;
	}

	/**
	 * @param qAbstractStr
	 *            the qAbstractStr to set
	 */
	public void setqAbstractStr(String qAbstractStr) {
		this.qAbstractStr = qAbstractStr;
	}

	private String qTitleStr;
	private String qAbstractStr;

	/**
	 * @return the qDateFrom
	 */
	public String getqDateFrom() {
		return qDateFrom;
	}

	/**
	 * @param qDateFrom
	 *            the qDateFrom to set
	 */
	public void setqDateFrom(String qDateFrom) {
		this.qDateFrom = qDateFrom;
	}

	/**
	 * @return the qDateTo
	 */
	public String getqDateTo() {
		return qDateTo;
	}

	/**
	 * @param qDateTo
	 *            the qDateTo to set
	 */
	public void setqDateTo(String qDateTo) {
		this.qDateTo = qDateTo;
	}

	private String qDateFrom;
	private String qDateTo;

	/**
	 * @return the qAuthorStr
	 */
	public String getqAuthorStr() {
		return qAuthorStr;
	}

	/**
	 * @param qAuthorStr
	 *            the qAuthorStr to set
	 */
	public void setqAuthorStr(String qAuthorStr) {
		this.qAuthorStr = qAuthorStr;
	}

	/**
	 * @return the qString
	 */
	public String getqString() {
		return qString;
	}

	/**
	 * @param qString
	 *            the qString to set
	 */
	public void setqString(String qString) {
		this.qString = qString;
	}

	static public String toWholeWorld(String in) {
		if (in == null)
			return null;
		return StringEscapeUtils.escapeHtml4("\"" + in + "\"");
	}

	public String getqSource() {
		return qSource;
	}

	public void setqSource(String qSource) {
		this.qSource = qSource;
	}

	public String getqOrganismNcbiId() {
		return qOrganismNcbiId;
	}

	public void setqOrganismNcbiId(String qOrganismNcbiId) {
		this.qOrganismNcbiId = qOrganismNcbiId;
	}
}
