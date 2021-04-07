pragma solidity >=0.4.0 <0.7.0;

contract healthrecords{
    
    //define and iniatialising the value
    
     address owner;
    
    //creation of the modifier
    
   /* modifier onlyOwner(){
        require(msg.sender==owner);
        _;
    }*/
 
    
    //creation of the array
    
     Doctor[]public doctor;
     Medicalinfo[]public medicalinfo;
     Person[]public person;
     Information[]public information;
    
    //creation of the constructor by entering the dummy data
    
    constructor()public{
        owner=msg.sender;
        heatlhtracking("Dr. Rohit Gandhi",6);
        medicalinformation(112,2);
        addperson(1,"Vvek","Pandey",21);
   
    }
    
    //creation of the structure
    
        struct Person{
        uint _id;
        string  _firstname;
        string  _lastname;
        uint _age;
        }
        
        struct Information{
        string _visitreason;
        uint _admissiondate;
        uint _dischargedate;
        uint _billnumber;
        string _hospitalname;
        }
        
        struct Doctor{
            string _doctorname;
            uint256 _doctorvisits;
          
        }
        
        struct Medicalinfo{
              uint256 _medicalbills;
              uint256 _insuranceexpirydate;
        }
        
        //defining the array
        
         function addperson(uint _id,string memory _firstname,string memory _lastname,uint _age)private
        {
            person.push(Person(_id,_firstname,_lastname,_age));
        }
        
       
        function heatlhtracking(string memory _doctorname,uint256 _doctorvisits) private
        {
            doctor.push(Doctor(_doctorname,_doctorvisits));
        }
        
          
        function medicalinformation(uint256 _medicalbills,uint256 _insuranceexpirydate) private
        {
            medicalinfo.push(Medicalinfo(_medicalbills,_insuranceexpirydate));
        }
        
        function addinfomation(string memory _visitreason,uint _admissiondate,uint _dischargedate,uint _billnumber,string memory _hospitalname) public
        {
            information.push(Information(_visitreason,_admissiondate,_dischargedate,_billnumber,_hospitalname));
            require(msg.sender==owner);
        }
        
      //creation of the event
    
      event patientEvent(
          uint indexed Personid
        );
        
    function patient(uint _Personid) public
    {   
       require(msg.sender==owner);
         
        //require valid Patient
    
        //require(_Personid >0 && _Personid <= peopleCount);

        //emition of the event
        
        emit patientEvent(_Personid);
        
    }
}