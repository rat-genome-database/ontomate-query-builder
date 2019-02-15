package edu.mcw.rgd.model;

public class CuratableCondition {
	private String PmId;
	private Boolean Curatable;
	private String userKey;
	private String action;
	private String ontoId;
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
	 * @return the ontoId
	 */
	public String getOntoId() {
		return ontoId;
	}

	/**
	 * @param ontoId the ontoId to set
	 */
	public void setOntoId(String ontoId) {
		this.ontoId = ontoId;
	}

	/**
	 * @return the action
	 */
	public String getAction() {
		return action;
	}

	/**
	 * @param action the action to set
	 */
	public void setAction(String action) {
		this.action = action;
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
	 * @return the curatable
	 */
	public Boolean getCuratable() {
		return Curatable;
	}

	/**
	 * @param curatable the curatable to set
	 */
	public void setCuratable(Boolean curatable) {
		Curatable = curatable;
	}

	/**
	 * @return the pmId
	 */
	public String getPmId() {
		return PmId;
	}

	/**
	 * @param pmId the pmId to set
	 */
	public void setPmId(String pmId) {
		PmId = pmId;
	}

}
