/**
 * @description       : 
 * @author            : Sangram Keshari Upadhyaya
 * @group             : 
 * @last modified on  : 04-01-2024
 * @last modified by  : Sangram Keshari Upadhyaya
 * Modifications Log
 * Ver   Date         Author                      Modification
 * 1.0   04-01-2024   Sangram Keshari Upadhyaya   Initial Version
**/

public class Employee {

    private Long eId;
    private String eName;
    private Integer eAge;
    private Integer eYearJoined;
    
    // Constructor to set Employee values
    public Employee(Long Id, String Name, Integer Age, Integer yearJoined) {

        eId = Id;
        eName = Name;
        eAge = Age;
        eYearJoined = yearJoined;

    }

    // This returns the employee Id
    public Long getId(){
        return eId;
    }

    // This returns the employee name
    public String getName(){
        return eName;
    }

    // This returns the employee age
    public Integer getAge(){
        return eAge;
    }

    // This returns the employee's year of Joining
    public Integer getJoiningYear(){
        return eYearJoined;
    }

}