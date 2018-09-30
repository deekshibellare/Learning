# DispatchGroup

Sometimes we need to perform a group of operations before certain operations. For example following task requires to send a set of reports to be sent to a set of users. This requires submitting a post request for each report. Since these operations are asynchronous and can result in a  callback in any order, it's hard to find when all operations are completed.

The simple solution is the use of DispatchGroup()
And apply enter() and leave() methods..

When all operations are completed, notify() will be fired.


```
func shareReports(_ reports: [Report],
                  with users: [User],
                  completion: @escaping ([ReportShareResult]) -> Void) {
    

    var reportShareResults = [ReportShareResult]()
    
    let userDicts = users.compactMap { u -> JSONDictionary? in
        if let memberID = u.projectMemberID {
            let userDict = ["userID" : memberID as AnyObject]
            return userDict
        }
        return nil
    }
    var body = JSONDictionary()
    body["recipients"] = userDicts as AnyObject
    
    let requestGroup = DispatchGroup()
    
    for report in reports {
        guard let reportID = report.id else {
            continue
        }
        let sendURL = "\(baseURL)/\(reportID)/send"
        
        requestGroup.enter()
        manager.postRequest(sendURL,
                            body: body,
                            completion: { (responseDict, error) in
                                let shareResult = ReportShareResult(report: report,
                                                                    error: error,
                                                                    recipients: responseDict?["recipients"])
                                reportShareResults.append(shareResult)
                                
                                requestGroup.leave()
        })
    }
    
    requestGroup.notify(queue: DispatchQueue.main) {
        completion ( reportShareResults )
        return
    }
}
```
