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
<table style="background-color:rgba(255, 255, 255, 0.8); border-radius:10px; border: 2px solid #000; overflow:hidden; color:#333;">
  <tr>
    <td>
      <img src="https://avatars.githubusercontent.com/u/44209630" style="border-radius:50%;width:250px" />
    </td>
    <td>
      <p>I'm <strong>Van-An Dinh</strong>, but I prefer to be called <strong>Thanh</strong>.</p>
      <p>I’m always excited to connect with like-minded individuals and professionals in the data community. Feel free to reach out or follow my work on the following platforms:</p>
      <p>
        <a href="https://github.com/thanhENC" target="_blank">
          <img src="https://img.shields.io/badge/@thanhENC-474747?logo=github" alt="GitHub" style="margin-right:10px" />
        </a>
        <a href="https://linkedin.com/in/van-an-dinh" target="_blank">
          <img src="https://img.shields.io/badge/@vanandinh-0A66C2?logo=linkedin" alt="LinkedIn" style="margin-right:10px" />
        </a>
        <a href="https://www.youtube.com/@thanhenc?sub_confirmation=1" target="_blank">
          <img src="https://img.shields.io/badge/@thanhenc-FF0000?logo=youtube" alt="YouTube" />
        </a>
      </p>
    </td>
  </tr>
</table>
