# PoC Data Platform - The Weekdays

<img src="assets/images/e2e-data-platform-cover.png" alt="project-cover" style="border-radius: 10px;">

<p align="center">
    <a href="https://github.com/thanhENC/e2e-data-platform" target="_blank">
        <img alt="Static Badge" src="https://img.shields.io/badge/Github Repo-474747?logo=github"
    </a>
    <a href="https://linkedin.com/in/van-an-dinh" target="_blank">
        <img alt="Static Badge" src="https://img.shields.io/badge/Linkedin Post-0A66C2?logo=linkedin">
    </a>
    <a href="https://medium.com" target="_blank">
        <img src="https://img.shields.io/badge/Medium article-474747?logo=medium"
            alt="chat on Discord">
    </a>
    <a href="https://www.youtube.com/@thanhenc?sub_confirmation=1
    " target="_blank">
        <img src="https://img.shields.io/youtube/channel/views/UCFnCLybLtgDWKzJjpSmh1jw"
            alt="chat on Discord">
    </a>
</p>

Project overview: ... (updating)

## Author
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

<p align="center">
  <a href="./README.md"><img alt="README in English" src="https://img.shields.io/badge/English-d9d9d9"></a>
</p>

Project overview. Here's a list of the core features:
</br> </br>

**1. Feature 1**:
Feature 1 description.

<img src="assets/images/airflow-overview.png" alt="airflow-overview" style="border-radius: 10px;">
</br> </br>

**2. Feature 2**:
Feature 2 description.

![dataflow](assets/images/dataflow.svg)

## Services distribution

<img src="assets/images/airflow-job-detail.png" alt="airflow-job-detail" style="border-radius: 10px;">

<img src="assets/images/docker-map.svg" alt="docker-map" style="border-radius: 10px;">

<table style="width: 100%;">
  <tr>
    <th align="center">Service</th>
    <th align="center">Doc</th>
    <th align="center">Server-01</th>
    <th align="center">Server-02</th>
    <th align="center">Server-03</th>
  </tr>
  <tr>
    <td align="center">Airflow</td>
    <td align="center"><a href="airflow/README.md"><img alt="Airflow README" src="https://img.shields.io/badge/README-474747?logo=apache-airflow"></a></td>
    <td align="center">✅</td>
    <td align="center">❌</td>
    <td align="center">❌</td>
  </tr>
  <tr>
    <td align="center">Spark</td>
    <td align="center"><a href="docker/spark/README.md"><img alt="Spark README" src="https://img.shields.io/badge/README-474747?logo=apache-spark"></a></td>
    <td align="center">❌</td>
    <td align="center">✅</td>
    <td align="center">❌</td>
  </tr>
  <tr>
    <td align="center">Trino</td>
    <td align="center"><a href="docker/trino/README.md"><img alt="Trino README" src="https://img.shields.io/badge/README-474747?logo=trino"></a></td>
    <td align="center">❌</td>
    <td align="center">❌</td>
    <td align="center">✅</br>(required)</td>
  </tr>
  <tr>
    <td align="center">Lightdash</td>
    <td align="center"><a href="docker/lightdash/README.md"><img alt="Lightdash README" src="https://img.shields.io/badge/⚡ README-474747?logo=lightdash"></a></td>
    <td align="center">❌</td>
    <td align="center">❌</td>
    <td align="center">✅</td>
  </tr>
  <tr>
    <td align="center">DBT</td>
    <td align="center"><a href="dbt/README.md"><img alt="DBT README" src="https://img.shields.io/badge/README-474747?logo=dbt"></a></td>
    <td align="center">❌</td>
    <td align="center">❌</td>
    <td align="center">✅</td>
  </tr>
  <tr>
    <td align="center">Minio</td>
    <td align="center"><a href="docker/minio/README.md"><img alt="Minio README" src="https://img.shields.io/badge/README-474747?logo=minio"></a></td>
    <td align="center">❌</td>
    <td align="center">❌</td>
    <td align="center">✅</td>
  </tr>
  <tr>
    <td align="center">Nginx</td>
    <td align="center"><a href="docker/nginx/README.md"><img alt="Nginx README" src="https://img.shields.io/badge/README-474747?logo=nginx"></a></td>
    <td align="center">✅</td>
    <td align="center">✅</td>
    <td align="center">✅</br>(required)</td>
  </tr>
  <tr>
    <td align="center">Certbot</td>
    <td align="center"><a href="docker/certbot/README.md"><img alt="Certbot README" src="https://img.shields.io/badge/README-474747?logo=letsencrypt"></a></td>
    <td align="center">✅</td>
    <td align="center">✅</td>
    <td align="center">✅</td>
  </tr>
</table>

## Using Lightdash

<img src="assets/images/lightdash-dashboard-light.png" alt="lighdash-dashboard" style="border-radius: 10px;">

- **Cloud </br>**
  
<img src="assets/images/trino-cluster-overview.png" alt="trino-cluster-overview" style="border-radius: 10px;">

- **Self-hosting Lightdash </br>**
  
<img src="assets/pdf/spark-master-jobs-history.pdf" alt="docker-map" style="border-radius: 10px;">

<iframe width="100%" height="800" src="assets/pdf/spark-master-jobs-history.pdf"></iframe>

## Staying ahead

Star the project on GitHub and be instantly notified of new releases.

<img src="assets/images/git-star.gif" alt="git-star" style="border-radius: 10px;">

## Quick start

> Before installing these data services, make sure your machine meets the following minimum system requirements:
>
> - CPU >= 4 Core
> - RAM >= 8GB

</br>

The easiest way to start the E2e-data-platform services is to run [docker-compose.yml](docker/docker-compose.yaml) file. Before running the installation command, make sure that [Docker](https://docs.docker.com/get-docker/) and [Docker Compose](https://docs.docker.com/compose/install/) are installed on your machine:

```bash
cd docker
cp .env.example .env
docker compose up -d
```

After running, you can access the all services in your browser and start the initialization process.

> If you'd like to contribute to project or do additional development, refer to our [guide to deploying from source code]()

## Next steps

If you need to customize the configuration, please refer to the comments in our [.env.example](docker/.env.example) file and update the corresponding values in your `.env` file. Additionally, you might need to make adjustments to the `docker-compose.yaml` file itself, such as changing image versions, port mappings, or volume mounts, based on your specific deployment environment and requirements. After making any changes, please re-run `docker-compose up -d`. You can find the full list of available environment variables [here]().

## Contributing

For those who'd like to contribute code, see our [Contribution Guide]().
At the same time, please consider supporting me by sharing it on social media and at events and conferences.

**Contributors**

<a href="https://github.com/thanhENC/e2e-data-platform/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=thanhENC/m-commerce-hk5" />
</a>

## Community & contact

- [Github Discussion](https://github.com/thanhENC/e2e-data-platform/discussions). Best for: sharing feedback and asking questions.
- [GitHub Issues](https://github.com/thanhENC/e2e-data-platform/issues). Best for: bugs you encounter using this project, and feature proposals.
- [LinkedIn](https://linkedin.com/in/van-an-dinh). Best for: sharing your applications and hanging out with the community.

## Star history

[![Star History Chart](https://api.star-history.com/svg?repos=thanhENC/m-commerce-hk5&type=Date)](https://star-history.com/#thanhENC/m-commerce-hk5&Date)

## License

This repository is available under the [ThanhENC Open Source License](LICENSE), which is essentially MIT.
