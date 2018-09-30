#DispatchWorkItem

DispatchWorkItem represents the work that will be executed on a queue

We can submit the work item for execution to DispatchQueue or DispatchGroup. DispatchWorkItem comes with a ability to cancel the operation. This is helpful in filter or serarch operations where if user types fast previous operation can be cancelled.


```
class FilterViewModel {
    
    var filterWorkItem:DispatchWorkItem?
    var worker = FilterWorker()}

extension FilterViewModel {
    
    func filter(for key:String) {
        var workItem:DispatchWorkItem!
        
        workItem = DispatchWorkItem { [weak self] in
            self?.worker.filter(for: key, completionHandler: { result in
                print(result)
                self?.filterWorkItem = nil
            })
        }
        filterWorkItem?.cancel()
        filterWorkItem = workItem
        DispatchQueue.global().asyncAfter(deadline: .now() + .milliseconds(250),
                                              execute: workItem)
    }
}

class FilterWorker {
    
    let data = ["archive",
                "catalog",
                "directory",
                "inventory",
                "prospectus",
                "brief",
                "bulletin",
                "calendar",
                "charts"]
    
    func filter(for text:String,completionHandler:@escaping ([String])->()) {
        DispatchQueue.global().asyncAfter(deadline:.now() + .milliseconds(1250)) { [weak self] in
            let filteredData = self?.data.filter{ $0.hasPrefix(text) } ?? [String]()
            completionHandler(filteredData)
        }
    }
}

let viewModel = FilterViewModel()
viewModel.filter(for: "brief")
viewModel.filter(for: "ar")
```


//Prints archive

The previous filter operation for brief is cancelled because immediately filter was asked for "ar"

