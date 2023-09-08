//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 < 0.9.0;

contract Portfolio{

    struct Project{
        uint id;
        string name;
        string description;
        string image;
        string githubLink;
    }

    struct Education{
        uint id;
        string dates;
        string degree;
        string knowledgeAcquire;
        string institutionName;
    }

    Project[3] public projects;
    Education[3] public educationDetails;

    string public imageLink = "QmP1teHQsijVxtN3VUzH5ya3J7yxacdwoSk8666SFvp5Du";
    string public description = "over 6 month of practicle experience";
    string public resumeLink = "QmWqgKCY7KSnYs4VU3RBvBaiXZ32exMX6BoijiU8jTej1P";
    uint projectCount;
    uint educationCount;
    address public manager;

    constructor(){
        manager = msg.sender;
    }

    modifier onlyManager(){
        require(manager==msg.sender, "you are not the manager");
                _;
    }

    function insertProject(string calldata _name, string calldata _description, string calldata _image, string calldata _githubLink) external 
    {
        require(projectCount<3, "Only 3 project are allowed");
        projects[projectCount] = Project(projectCount, _name, _description, _image, _githubLink);
        projectCount++;
    }

    function changeProject(string calldata _name, string calldata _description, string calldata _image, string calldata _githubLink, uint _projectCount) external 
    {
        require(_projectCount>=0 && _projectCount<3, "Only 3 project are allowed");
        projects[projectCount] = Project(_projectCount, _name, _description, _image, _githubLink);
        projectCount++;
    }

    function allProjects() external view returns(Project[3] memory){
        return projects;
    }

    // for Education section

    function insertEducation(string calldata _dates, string calldata _degree, string calldata _knowledgeAcquire, string calldata _institutionName) external 
    {
        require(projectCount<3, "Only 3 project are allowed");
        educationDetails[educationCount] = Education(educationCount, _dates, _degree, _knowledgeAcquire, _institutionName);
        educationCount++;
    }

    function changeEducation(string calldata _dates, string calldata _degree, string calldata _knowledgeAcquire, string calldata _institutionName, uint _edDetails) external 
    {
        require(_edDetails>=0 && _edDetails<3, "Only 3 project are allowed");
        educationDetails[_edDetails] = Education(_edDetails, _dates, _degree, _knowledgeAcquire, _institutionName);
        projectCount++;
    }

    function allEducationsDetails() external view returns(Education[3] memory){
        return educationDetails;
    }

    function changeDescription(string calldata _description)  external{
        description = _description;
    }

    function changeImageLink(string calldata _imageLink)  external{
        imageLink = _imageLink;
    }
    function changeResume(string calldata _resumeLink)  external{
        resumeLink = _resumeLink;
    }


    function donate() public payable {
        payable(manager).transfer(msg.value);
    }
}