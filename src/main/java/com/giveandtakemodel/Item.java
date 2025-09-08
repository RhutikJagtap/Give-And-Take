package com.giveandtakemodel;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Item {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String itemName;
	private String category;
	private String description;
	@Column(name = "`condition`")
	private String condition;
	private String type; // Sell, Exchange, Donate
	private int ownerId; // user id of the owner
	private String status; // Pending, Approved, Exchanged
	private String imagePath; // path to uploaded image
	private Date addedDate; // when item was added
	private Date updatedDate; // when item was last updated

	// Default constructor
	public Item() {
	}

	// Parameterized constructor
	public Item(int id, String itemName, String category, String description, String condition, String type,
			int ownerId, String status, String imagePath, Date addedDate, Date updatedDate) {
		this.id = id;
		this.itemName = itemName;
		this.category = category;
		this.description = description;
		this.condition = condition;
		this.type = type;
		this.ownerId = ownerId;
		this.status = status;
		this.imagePath = imagePath;
		this.addedDate = addedDate;
		this.updatedDate = updatedDate;
	}

	// Getters and Setters
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return itemName;
	}

	public void setName(String itemName) {
		this.itemName = itemName;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	
	public int getOwnerId() {
		return ownerId;
	}

	public void setOwnerId(int ownerId) {
		this.ownerId = ownerId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public Date getAddedDate() {
		return addedDate;
	}

	public void setAddedDate(Date addedDate) {
		this.addedDate = addedDate;
	}

	public Date getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	@Override
	public String toString() {
		return "Item [id=" + id + ", itemName=" + itemName + ", category=" + category + ", description=" + description
				+ ", condition=" + condition + ", type=" + type + ", ownerId=" + ownerId + ", status=" + status
				+ ", imagePath=" + imagePath + ", addedDate=" + addedDate + ", updatedDate=" + updatedDate + "]";
	}
	
	
	
}
