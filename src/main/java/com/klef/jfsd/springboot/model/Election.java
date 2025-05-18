package com.klef.jfsd.springboot.model;

import java.time.LocalDate;
import jakarta.persistence.*;

@Entity
@Table(name = "election_Detailed")
public class Election {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column(length = 100, nullable = false)
    private Long codenum;
    @Column(length = 100, nullable = false)
    private String name;

    @Column(length = 100, nullable = false)
    private String state;

    @Column(length = 100)
    private String district;

    @Column(name = "start_date", nullable = false)
    private LocalDate startDate;

    @Column(name = "end_date", nullable = false)
    private LocalDate endDate;

    @Column(name="active")
    private boolean active;

    // Getters and setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getState() { return state; }
    public void setState(String state) { this.state = state; }

    public String getDistrict() { return district; }
    public void setDistrict(String district) { this.district = district; }

    public LocalDate getStartDate() { return startDate; }
    public void setStartDate(LocalDate startDate) { this.startDate = startDate; }

    public LocalDate getEndDate() { return endDate; }
    public void setEndDate(LocalDate endDate) { this.endDate = endDate; }

    public boolean isActive() { return active; }
    public void setActive(boolean active) { this.active = active;
    }
	public Long getCodenum() {
		return codenum;
	}
	public void setCodenum(Long codenum) {
		this.codenum = codenum;
	}
}
