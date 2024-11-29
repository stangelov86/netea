db = db.getSiblingDB('testdb');
db.test.insertOne({ msg: "MongoDB is working!" });