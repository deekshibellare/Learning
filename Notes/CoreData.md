#CoreData

Core data is a framework that manages the object graph and persist that object graph by writing it to disk

Core data has:

* Managed Object Model
* Managed Object Context
* Persistent Store Coordinator
* Persistent Store


*Managed Object Model*: it represents the data model of our application, it contains information about models or entities of the object graph, what attributes they have, how they relate to each other.

*Persistent Store Coordinator*: it persist data to disk and ensures that persistent store and data model are compatible

Handles managed object context and store interaction

*Managed Object Context*: it manages a collection of model objects. it is like a workbench where we work with model objects, we load them, we manipulate them and save them on workbench. 

Fetch data is done using NSFetchRequest

Inserting
```
guard let entity = NSEntityDescription.entity(forEntityName: "Person", in: context) else {return }
let newPerson = NSManagedObject(entity: entity, insertInto: context)
```

Fetching 

```
let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
let result = try? context.fetch(request)

```

##Faults

Faults are placeholders
A fault will be converted into a realized object (“fired”) automatically by the Core Data framework in most cases when it is necessary to do so, e.g. when accessing a property of the object.