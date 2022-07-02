 class Queries{
  String gerCharacters(){
    return """query personage {
  characters(page:1 ) {
    
    results {
      name
      id 
      type
      status
      species
      gender
      image
      location{
        name
        type
        dimension
        created
      }
      origin{
        name
        type
        dimension
        created
        
      }
      
    }
  }
  
  
}""";
  }
 }