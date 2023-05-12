const e = require('express');
const express = require('express');
const cors = require('cors');
const PORT=3000;

const fs = require('fs')
const readline = require('readline')
var dataFile='file.txt'


var Arrp=[];
read()

const app = express();

app.listen(PORT);
app.use(cors({
    origin: '*',
    methods: ['GET','POST','DELETE','UPDATE','PUT','PATCH']
}));
app.use(express.json());

app.get('/persons', async (req, res) => {
    try {
        res.send(Arrp);
    }
    catch (err) {
        res.status(500).send(err.message);
    }
});

app.get('/persons/:id', async (req, res) => {
    try {
        index=Arrp.findIndex((obj=>obj.id==req.params.id))
        if(index==-1)throw 'no person with this id'
        let filteredPerson = Arrp.filter( function(val) { 
            if(val.id == req.params.id) { 
                return val;
            }
        })
        res.send(filteredPerson);
    }
    catch (err) {
        res.send(err.toString('ascii'));
    }
});

app.post('/persons', async (req, res) => {
    try {
        const {id,name,email,gender,age} = req.body;
        if(id==null || name==null || gender==null || age==null || email==null) throw 'you must provide all the requirements (id, name, email, gender,age)'
        const ADD ={
            id: id,
            name: name,
            email: email,
            gender: gender,
            age:age
        }
        index=Arrp.findIndex((obj=> obj.id ==ADD.id))
        if(index!=-1) throw 'There is a person with same id'
        Arrp.push(ADD)
        write()
        res.send("New data added Successfuly");
    }
    catch (err) {
        res.status(500).send(err.toString('ascii'));
    }
});

app.put('/persons/:id', async (req, res) => {
    try {
        const newId = req.body["id"];
        const newName = req.body["name"];
        const newEmail = req.body["email"];
        const newGender = req.body["gender"];
        const newAge = req.body["age"];
        index=Arrp.findIndex((obj=>obj.id==req.params.id));
        index2=Arrp.findIndex((obj=>obj.id==newId));
        if(index==-1) throw 'id not found'
        if(index2 !=-1 && index!=index2) throw 'new id already exists'
        if(newId) Arrp[index].id=newId;
        if(newName) Arrp[index].name=newName;
        if(newEmail) Arrp[index].email=newEmail;
        if(newGender) Arrp[index].gender=newGender;
        if(newAge) Arrp[index].age=newAge;
        write()
        console.log("Updated Successfuly")
        res.send('Update completed')
    }
    catch (err) {
        res.send(err.toString('ascii'));
    }
});


app.delete('/persons/:id', async (req, res) => {    
    try {
        index=Arrp.findIndex((obj=>obj.id==req.params.id))
        if(index==-1)throw 'there no such id'
        let filteredPersons = Arrp.filter( function(val) { 
            if(val.id != req.params.id) { 
                return val;
            }
        })
        Arrp=filteredPersons
        write()
        res.send('deleted Successfuly');
    }
    catch (err) {
        res.send(err.toString('ascii'));
    }
});





function arrayToString(array) {
    var str='';
    for(var i=0;i<array.length;i++){
        str+=toString(array[i]);
    }
    return str;
}

function toString(data){
    return data.id + '\n' + data.name + '\n' + data.email + '\n' + data.gender + '\n' + data.age + '\n';
}

function write(){
    fs.writeFile(dataFile, arrayToString(Arrp), (err) => {
    if (err) throw err;
    else{
        console.log("congrates,The file is updated")
        }
    })
}

function read(){
    const ReadLines = require('n-readlines');
    const readLines = new ReadLines(dataFile);
    let line;
    while ((line = readLines.next())) {
        var person={
            id :line.toString('ascii'),
            name :line=readLines.next().toString('ascii'),
            email :line=readLines.next().toString('ascii'),
            gender : line=readLines.next().toString('ascii'),
            age :line=readLines.next().toString('ascii')
        };
        Arrp.push(person)
    }
}