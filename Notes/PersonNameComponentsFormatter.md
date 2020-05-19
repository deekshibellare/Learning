# PersonNameComponentsFormatter

```let personNameComponentFormatter = PersonNameComponentFormatter()
let nameComponets = PersonNameComponents()
nameComponets.familyName = "Bellare"
nameComponets.givenName = "Deekshith"
formatter.string(from: nameComponents)
```
Displays Deekshith Bellare
But if locale is changed where family name gets perfrance then it will be used

For example In China, there is no space between familyname and givenName


4 types of display style

Default
Short
Long
Abbreviated


