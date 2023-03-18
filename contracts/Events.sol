// SPDX-License-Identifier: MIT
pragma solidity 0.8.9;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
  
contract Events is ERC721, Ownable {
  string public Base_uri;
  uint tickets; // 100

  struct Ticket_creator{
    string event_name;
    uint ticket_price;
    uint start_date;
    uint event_date;
    uint event_end_date;
  }
  struct stringArgs{
    string name;
    string symbol;
  }

  // User details struct
  struct User{
    string name;
    uint contact_details;
    string city;
    address user_account;
  }

  User[] public users;

  
    // mapping(string=>uint) TicketPriceCatagry;   //[upper]= 10000
    mapping(string=>uint[2]) ticketRange;  // ticketRange[upper]=[50,100]

    struct Ticketcat{
      string cat;
      uint price;
      uint start_range;
      uint end_range;}

        //[upper]= 10000

      // [
      //   cat:"lower",
      //   price:10000,
      //   start_range:1,
      //   end_range:25
      // },{
      //  cat: "upper",  
      //   price:15000,
      //   start_range:26,
      //   end_range:50
      // }]

      Ticketcat[] ticketscatogeris;


  

   //  [lower, midile , upper]

 constructor(stringArgs memory _strings, Ticket_creator memory ticket_creator,uint _number_of_ticket,Ticketcat[] memory _tickccat)
 ERC721(_strings.name,_strings.symbol)

 {
    ticket_creator.event_name;
    ticket_creator.ticket_price;
    ticket_creator.start_date;
    ticket_creator.event_date;
    ticket_creator.event_end_date;
    tickets=_number_of_ticket;
    
  
    for (uint i = 0; i < _tickccat.length; i++) {

      require(_tickccat[i].start_range != _tickccat[i+1].start_range,"");
      // require(_tickccat[i].end_range = _tickccat[i+1].end_range,"");
 
    }
 
 }

 function RegisterUser(string memory _name,uint _contact_details,string memory _city,address _user_account)public{
    users.push(User(_name,_contact_details,_city,_user_account));
 }
  
 function mint(address _to, uint256 _tokenId, string memory uri) external  {
  //  require(_tokenId<= tickets.number_of_ticket,"");
   super._mint(_to, _tokenId);
   Base_uri = uri;
 }  
}