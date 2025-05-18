package com.klef.jfsd.springboot.model;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.UniqueConstraint;

@Entity
@Table(name = "votes")
public class Vote {
	    @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private Long id;

	    @ManyToOne
	    @JoinColumn(name = "user_id", nullable = false)
	    private User user;

	    @ManyToOne
	    @JoinColumn(name = "candidate_id", nullable = false)
	    private Candidate candidate;

	    @ManyToOne
	    @JoinColumn(name = "election_id", nullable = false)
	    private Election election;

	    @Column(name = "voted_at", nullable = false)
	    private LocalDateTime votedAt;

		public Long getId() {
			return id;
		}

		public void setId(Long id) {
			this.id = id;
		}

		public User getUser() {
			return user;
		}

		public void setUser(User user) {
			this.user = user;
		}

		public Candidate getCandidate() {
			return candidate;
		}

		public void setCandidate(Candidate candidate) {
			this.candidate = candidate;
		}

		public Election getElection() {
			return election;
		}

		public void setElection(Election election) {
			this.election = election;
		}

		public LocalDateTime getVotedAt() {
			return votedAt;
		}

		public void setVotedAt(LocalDateTime votedAt) {
			this.votedAt = votedAt;
		}

	    // Getters and setters
}
