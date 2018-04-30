## Single Node [Accumulo](https://accumulo.apache.org/) Instance On Docker

This work is based on [https://github.com/mraad/accumulo-docker](https://github.com/mraad/accumulo-docker)

### Build the container image

```shell
docker build -t jbcrail/accumulo-proxy:1.5.2 .
```

### Run the container

This will start Zookeeper, YARN, HDFS, Accumulo, and the Accumulo Thrift proxy.

```shell
docker run --name accumulo --rm -p 42424:42424 jbcrail/accumulo-proxy:1.5.2
```

### Connect to proxy

The username is `root` and the password is `secret`.
