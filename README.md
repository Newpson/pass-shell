![](https://i.imgur.com/hXNBoHH.png)

## Fast access to your pass' password storage

**Lets say that:**
* *primary info* will be username, e-mail, phone number, etc.
* *account type* will be service name or its domain (e.g. github, google, office-ssh)
* *account name* will be some labels for multiple accounts of the same type (e.g. main, office, youtube)

**Use:**

* **`ppass`** *`add`* `<account>`
It will generate you a password for specified account and copy it to clipboard for 45 seconds.
* **`ppass`** `<account>` *`u`*
It will copy specified account's *primary info* to clipboard for 45 seconds.
* **`ppass`** `<account>` *`p`*
It will copy specified account's password to clipboard for 45 seconds.

**File structure in password store:**
```
Password Store
├─ account-type-1
│  └─ primary-info-1.gpg
├─ account-type-2
│  └─ primary-info-2.gpg
└─ account-type-3
   ├─ account-name-1
   │  └─ primary-info-3.1.gpg
   └─ account-name-1
      └─ primary-info-3.2.gpg
```

------------


### TODO
- [x] Add account existence check
- [ ] Make the *`p`* key optional
