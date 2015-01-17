# backgen - Generate a database and REST API backend #

Easily generates the data portion of your app, so you can get onto doing other
 things.


## Example: ##

`api/user.json`

```json
{
    "_info": {
        "id": "name"
    },
    "name": {
        "type": "string",
        "limit": 32
    },
    "password": {
        "type": "passhash",
        "hidden": true
    },
    "email": {
        "type": "string",
        "limit": 64
    },
    "friends": {
        "type": "list:user"
    }
}
```

---

`curl {url}/api/user/ncrosby.json`

```json
{
    "name": "ncrosby",
    "email": "nc@sourcecomb.com",
    "friends": [
        "rsteyn"
    ]
}
```

`curl {url}/api/user/rsteyn.json?expand=friends`

```json
{
    "name": "rsteyn",
    "email": "riley@steyn.co.nz",
    "friends": [
        {
            "name": "ncrosby",
            "email": "nc@sourcecomb.com",
            "friends": [
                "rstyen"
            ]
        }
    ]
}
```

`curl {url}/api/user/rsteyn.json?expand=friends&expand_style=map`

```json
{
    "name": "rsteyn",
    "email": "riley@steyn.co.nz",
    "friends": {
        "ncrosby": {
            "name": "ncrosby",
            "email": "nc@sourcecomb.com",
            "friends": [
                "rstyen"
            ]
        }
    }
}
```

`curl {url}/api/users.json`

```json
[
    "ncrosby",
    "rsteyn"
]
```
