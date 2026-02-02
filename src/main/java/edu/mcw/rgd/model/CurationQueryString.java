package edu.mcw.rgd.model;

import org.springframework.util.AutoPopulatingList;

public class CurationQueryString {
	private AutoPopulatingList<RgdIdCondition> qRgdIds;
	private AutoPopulatingList<OntoIdCondition> qOntoIds;
	private AutoPopulatingList<RefRgdIdCondition> qRefRgdIds;
	private String qCond;
	private String qGeneCond;
	private Boolean qLooseMatch = false;
	private String qSource;
	/**
	 * @return the qLooseMatch
	 */
	public Boolean getqLooseMatch() {
		return qLooseMatch;
	}

	/**
	 * @param qLooseMatch the qLooseMatch to set
	 */
	public void setqLooseMatch(Boolean qLooseMatch) {
		this.qLooseMatch = qLooseMatch;
	}

	private String userKey;
	private String userId;
	/**
	 * @return the userId
	 */
	public String getUserId() {
		return userId;
	}

	/**
	 * @param userId the userId to set
	 */
	public void setUserId(String userId) {
		this.userId = userId;
	}

	private String userFullName;

	/**
	 * @return the userFullName
	 */
	public String getUserFullName() {
		return userFullName;
	}

	/**
	 * @param userFullName the userFullName to set
	 */
	public void setUserFullName(String userFullName) {
		this.userFullName = userFullName;
	}

	/**
	 * @return the userKey
	 */
	public String getUserKey() {
		return userKey;
	}
	/**
	 * @param userKey the userKey to set
	 */
	public void setUserKey(String userKey) {
		this.userKey = userKey;
	}
	/**
	 * @return the qCond
	 */
	public String getqCond() {
		return qCond;
	}
	/**
	 * @param qCond the qCond to set
	 */
	public void setqCond(String qCond) {
		this.qCond = qCond;
	}
	private String curHost;
	
	/**
	 * @return the qRgdIds
	 */
	public AutoPopulatingList<RgdIdCondition> getqRgdIds() {
		return qRgdIds;
	}
	/**
	 * @param qRgdIds the qRgdIds to set
	 */
	public void setqRgdIds(AutoPopulatingList<RgdIdCondition> qRgdIds) {
		this.qRgdIds = qRgdIds;
	}
	/**
	 * @return the qOntoIds
	 */
	public AutoPopulatingList<OntoIdCondition> getqOntoIds() {
		return qOntoIds;
	}
	/**
	 * @param qOntoIds the qOntoIds to set
	 */
	public void setqOntoIds(AutoPopulatingList<OntoIdCondition> qOntoIds) {
		this.qOntoIds = qOntoIds;
	}
	/**
	 * @return the curHost
	 */
	public String getCurHost() {
		return curHost;
	}
	/**
	 * @param curHost the curHost to set
	 */
	public void setCurHost(String curHost) {
		this.curHost = curHost;
	}
	/**
	 * @return the qRefRgdIds
	 */
	public AutoPopulatingList<RefRgdIdCondition> getqRefRgdIds() {
		return qRefRgdIds;
	}
	/**
	 * @param qRefRgdIds the qRefRgdIds to set
	 */
	public void setqRefRgdIds(AutoPopulatingList<RefRgdIdCondition> qRefRgdIds) {
		this.qRefRgdIds = qRefRgdIds;
	}

	/**
	 * @return the qGeneCond
	 */
	public String getqGeneCond() {
		return qGeneCond;
	}

	/**
	 * @param qGeneCond the qGeneCond to set
	 */
	public void setqGeneCond(String qGeneCond) {
		this.qGeneCond = qGeneCond;
	}

	public String getqSource() {
		return qSource;
	}

	public void setqSource(String qSource) {
		this.qSource = qSource;
	}
}
