package com.klef.jfsd.springboot.model;

import java.sql.Blob;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.Lob;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name="Candidate_Detailed")
public class Candidate {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long candidateId;
    
    @Column(name = "candidateName",nullable=false)
    private String candidateName;
    @Column(name = "state",nullable=false)
    private String state;
    @Column(name = "party",nullable=false)
    private String party;
    @Column(name = "district",nullable=false)
    private String district;
    
    @ManyToOne
    @JoinColumn(name = "electionId")
    private Election election;

    @Column(name="party_image",nullable=false)  // @Lob annotation tells JPA to treat this as a large object (BLOB)
    private Blob image;  // Store image as byte array (BLOB)

    // Getters and setters
    

	public Long getCandidateId() {
		return candidateId;
	}

	public void setCandidateId(Long candidateId) {
		this.candidateId = candidateId;
	}

	public String getCandidateName() {
		return candidateName;
	}

	public void setCandidateName(String candidateName) {
		this.candidateName = candidateName;
	}

	public String getParty() {
		return party;
	}

	public void setParty(String party) {
		this.party = party;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public Election getElection() {
		return election;
	}

	public void setElection(Election election) {
		this.election = election;
	}

	public Blob getImage() {
		return image;
	}

	public void setImage(Blob image) {
		this.image = image;
		
	}
}
