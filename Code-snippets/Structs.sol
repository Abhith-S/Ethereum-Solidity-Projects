//SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

//contract to study structs, their initialization , get , set, reset
contract Structs{

    //crating a struct type Car
    struct Car{
        string model;
        uint year;
        address owner;
    }

    //create a variable of type Car
    Car public car;

    //create an array of type Car
    Car[] public cars;

    //create an address to struct(Car) array mapping
    mapping(address => Car[]) public carsByOwner;

    function structOperations()public {

        //initialize a struct
        //storing it in memory
        //should be in order of types declared in Car
        Car memory toyota = Car("innova", 2000, msg.sender);

        //initialize a struct using key value pair
        Car memory lamborghini = Car({ owner : msg.sender, model : "aventador", year : 2012 });

        //simply initialize a struct with no values, a struct with default values will be created
        Car memory tesla;

        //give values to each Car properties
        tesla.model = "cybertruck";
        tesla.year = 2021;
        tesla.owner = msg.sender;

        //as the structs are in memory they will be gone after function execution so we push then to an array
        cars.push(toyota);
        cars.push(lamborghini);
        cars.push(tesla);

        //can push struct to array while initialization
        cars.push(Car("ferrari",2012,msg.sender));

        //getting structs from cars array, lets take 0th element ie,toyota
        //we have to store it into a variable of Car type
        //we are loading it to memory for viewing them but if we want to modify them we have to laod them onto storage
        //Car memory _car = cars[0];
        Car storage _car = cars[0];

        _car.model;
        _car.year;
        _car.owner;

        //modify structs
        _car.year = 1980;

        //reset stuct value
        //we use delete function but it will only reset the value to default value
        delete _car.owner;

        //reset the entire struct
        delete cars[1];


    }


}
