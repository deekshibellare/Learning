#Run time santization tools

###Address Sanitizer

The Address Sanitizer finds memory corruptions and other memory errors at runtime. The Address Sanitizer replaces the malloc and free functions with custom implementations that allow regions surrounding the requested memory to be checked for invalid access.

```char *ptr = malloc(10);
    ptr[18] = a;
```

In the aboove code ptr is updating value at 12th index which might update memory location occupied by other objects. Swift checks for these runtime issues but Swift can be used with other lanaguages including C which might introduce these kind of errors

So Enabiling Address Santizer in Schema -> Run -> Diagonistics will help idnetify such erros


###Thread Sanitizer

Thread Sanitizer is a tool that detects data races. A data race occurs when 2 instructions/statements from different threads access the same memory location, at least one of these accesses is a write and there is no synchronization that is mandating any particular order among these accesses.


    var currentScore:Int?
    override func updateScore() {
        DispatchQueue.main.async {  [weak self] in
            self?.currentScore = 10
        }
        DispatchQueue.global().async {  [weak self] in
            self?.currentScore = 20
        }
        

In the above example two threads updating current score and no ordering or locks are spacified. This is a potential race condition and enabling thread santizier points you to the the race condition

###Main Thread API checker

The Main Thread Checker is a standalone tool for Swift and C languages that detects invalid usage of AppKit, UIKit, and other APIs on a background thread. Updating UI on a thread other than the main thread is a common mistake that can result in missed UI updates, visual defects, data corruptions, and crashes.

At app launch, the Main Thread Checker dynamically replaces the implementations of methods that should only be called on the main thread with a version that prepends the check

```class ViewController: UIViewController {
 @IBOutlet weak var titleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.global().async {  [weak self] in
            self?.titleLabel.text = "Hai"
        }
    } 
}
```

Title label is updated from the thread in global queue which is invalid usage as all UI components need to updated in main thread. Running main thread checker allows you to check for invalid usages.