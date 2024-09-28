# Trino Password File

### Description:
This is a simple example of how to use a password file with Trino. The password file is a simple text file that contains the username and password for the Trino user. The password file is mounted into the Trino container and the Trino configuration is updated to use the password file.

### Instructions:
1. Install [htpasswd](https://httpd.apache.org/docs/2.4/programs/htpasswd.html) on server

    ```bash
    sudo apt-get install apache2-utils
    ```
2. Create a password file with the username and password for the Trino user. The password file should be named `password.db`

    ```bash
    touch password.db
    ```
3. Add or update the username and password for the Trino user in the password file

    ```bash
    htpasswd -B -C 10 password.db username
    ```
    Then enter the password for the new user

### Example:
In this project, there are 04 users
| Username | Password | Catalog |
|----------|----------|---------|
| `admin`  | `admin`  | `system`, `postgres`, `delta` |
| `delta.user`  | `123456789`  | `system`, `delta` |
| `postgres.user`  | `123456789`  | `system`, `postgres` |
| `dbt.user` | `123456789`  | `system`, `postgres`, `delta` |

### Resources:
- [Trino Password File](https://trino.io/docs/current/security/password-file.html)

---
```
   {
        "title": "Trino Password File",
        "title_metadata": "Trino Password File",
        "version": "1.0",
        "type": "guide",
        "author": "@thanhENC"
   } 
```
