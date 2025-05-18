package com.klef.jfsd.springboot.service;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Candidate;
import com.klef.jfsd.springboot.model.Election;
import com.klef.jfsd.springboot.model.User;
import com.klef.jfsd.springboot.model.Vote;
import com.klef.jfsd.springboot.repository.CandidateRepository;
import com.klef.jfsd.springboot.repository.ElectionRepository;
import com.klef.jfsd.springboot.repository.UserRepository;
import com.klef.jfsd.springboot.repository.VoterRepository;

@Service
public class VoterServiceImpl implements VoterService {

    @Autowired
    private VoterRepository voteRepository;

    @Override
    public boolean hasUserVoted(User user, Election election) {
        return voteRepository.existsByUserAndElection(user, election);
    }

    @Override
    public void castVote(User user, Candidate candidate) {
        if (hasUserVoted(user, candidate.getElection())) {
            throw new IllegalStateException("User has already voted in this election");
        }

        Vote vote = new Vote();
        vote.setUser(user);
        vote.setCandidate(candidate);
        vote.setElection(candidate.getElection());
        vote.setVotedAt(LocalDateTime.now());

        voteRepository.save(vote);
    }

    @Override
    public Map<Long, Integer> getVoteCountsForAllCandidates() {
        List<Object[]> results = voteRepository.countAllGroupByCandidateId();
        Map<Long, Integer> voteCounts = new HashMap<>();
        
        for (Object[] result : results) {
            Long candidateId = (Long) result[0];
            Integer count = ((Number) result[1]).intValue();
            voteCounts.put(candidateId, count);
        }
        
        return voteCounts;
    }

    @Override
    public Integer getVoteCountForCandidate(Long candidateId) {
        return voteRepository.countByCandidateId(candidateId);
    }
}
   
