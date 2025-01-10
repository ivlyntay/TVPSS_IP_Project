package com.example.service;

import com.example.model.CrewMember;
import com.example.repository.CrewMemberDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class CrewMemberService {

    @Autowired
    private CrewMemberDao crewMemberDao;

    // Get all crew members
    public List<CrewMember> getAllCrewMembers() {
        return crewMemberDao.getAllCrewMembers();
    }

    // Get a crew member by ID
    public CrewMember getCrewMemberById(int id) {
        return crewMemberDao.getCrewMemberById(id);
    }

    // Save a new crew member
    public void saveCrewMember(CrewMember crewMember) {
        crewMemberDao.saveCrewMember(crewMember);
    }

    // Update an existing crew member
    public void updateCrewMember(CrewMember crewMember) {
        crewMemberDao.updateCrewMember(crewMember);
    }

    // Delete a crew member by ID
    public void deleteCrewMember(int id) {
        crewMemberDao.deleteCrewMember(id);
    }
}
