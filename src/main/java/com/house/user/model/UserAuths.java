package com.house.user.model;

import java.util.Date;

public class UserAuths {
    private String id;

    private String uid;

    private String identityType;

    private String identifier;

    private String credential;

    private Long regIp;

    private Date regTime;

    private Integer login;

    private Date updateTime;

    private Long lastLoginIp;

    private Date lastLoginTime;

    private Byte status;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid == null ? null : uid.trim();
    }

    public String getIdentityType() {
        return identityType;
    }

    public void setIdentityType(String identityType) {
        this.identityType = identityType == null ? null : identityType.trim();
    }

    public String getIdentifier() {
        return identifier;
    }

    public void setIdentifier(String identifier) {
        this.identifier = identifier == null ? null : identifier.trim();
    }

    public String getCredential() {
        return credential;
    }

    public void setCredential(String credential) {
        this.credential = credential == null ? null : credential.trim();
    }

    public Long getRegIp() {
        return regIp;
    }

    public void setRegIp(Long regIp) {
        this.regIp = regIp;
    }

    public Date getRegTime() {
        return regTime;
    }

    public void setRegTime(Date regTime) {
        this.regTime = regTime;
    }

    public Integer getLogin() {
        return login;
    }

    public void setLogin(Integer login) {
        this.login = login;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Long getLastLoginIp() {
        return lastLoginIp;
    }

    public void setLastLoginIp(Long lastLoginIp) {
        this.lastLoginIp = lastLoginIp;
    }

    public Date getLastLoginTime() {
        return lastLoginTime;
    }

    public void setLastLoginTime(Date lastLoginTime) {
        this.lastLoginTime = lastLoginTime;
    }

    public Byte getStatus() {
        return status;
    }

    public void setStatus(Byte status) {
        this.status = status;
    }

	@Override
	public String toString() {
		return "UserAuths [id=" + id + ", uid=" + uid + ", identityType=" + identityType + ", identifier=" + identifier
				+ ", credential=" + credential + ", regIp=" + regIp + ", regTime=" + regTime + ", login=" + login
				+ ", updateTime=" + updateTime + ", lastLoginIp=" + lastLoginIp + ", lastLoginTime=" + lastLoginTime
				+ ", status=" + status + "]";
	}
    
}