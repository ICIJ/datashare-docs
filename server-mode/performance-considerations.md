# Performance considerations

Improving the performance of Datashare involves several techniques and configurations to ensure efficient data processing. Extracting text from multiple file types and images is an heavy process so be aware that even if we take care of getting the best performances possible with [Apache Tika](https://tika.apache.org/) and [Tesseract OCR](https://tesseract-ocr.github.io/), this process can be expensive. Below are some tips to enhance the speed and performance of your Datashare setup.

### **Separate Processing Stages**

Execute the SCAN and INDEX stages independently to optimize resource allocation and efficiency.

_Examples:_

```bash
datashare --mode CLI --stage SCAN --redisAddress redis://redis:6379 --busType REDIS
datashare --mode CLI --stage INDEX --redisAddress redis://redis:6379 --busType REDIS
```

### **Distribute the INDEX Stage**

Distribute the INDEX stage across multiple servers to handle the workload efficiently. We often use multiple[`g4dn.8xlarge`](https://instances.vantage.sh/aws/ec2/g4dn.8xlarge) instances (32 CPUs, 128 GB of memory) with a remote Redis and a remote ElasticSearch instance to alleviate processing load.

For projects like the [Pandora Papers](https://www.icij.org/investigations/pandora-papers/) (2.94 TB), we ran the INDEX stage to up to 10 servers at the same time which cost ICIJ several thousand of dollars.\


<figure><img src="../.gitbook/assets/How big is the Pandora Papers leak (Twitter)(2).jpg" alt=""><figcaption></figcaption></figure>

### **Leverage Parallelism**

Datashare offer `--parallelism` and `--parserParallelism` options to enhance processing speed.

_Example (for `g4dn.8xlarge` with 32 CPUs):_

```bash
datashare --mode CLI --stage INDEX --parallelism 14 --parserParallelism 14
datashare --mode CLI --stage NLP --parallelism 14 --nlpParallelism 14
```

### **Optimize ElasticSearch**

ElasticSearch can significantly consume CPU and memory, potentially becoming a bottleneck. For production instance of Datashare, we recommend deploying ElasticSearch on a remote server to improve performances.

### **Adjust JAVA\_OPTS**

You can fine-tune the `JAVA_OPTS` environment variable based on your system's configuration to optimize Java Virtual Machine memory usage.\
\
_Example (for `g4dn.8xlarge8`with 120 GB Memory):_

```shell
JAVA_OPTS="-Xms10g -Xmx50g" datashare --mode CLI --stage INDEX
```

### **Specify Document Language**

If the document language is known, explicitly setting it can save processing time.

* **Use `--language`** for general language setting (e.g., `FRENCH`, `ENGLISH`).

_Example:_

```bash
datashare --mode CLI --stage INDEX --language FRENCH
datashare --mode CLI --stage INDEX --language CHINESE
datashare --mode CLI --stage INDEX --language GREEK
```

### **Manage OCR Tasks Wisely**

OCR tasks are resource-intensive. If not needed, disabling OCR can significantly improve processing speed. You can disable OCR with `--ocr false`.

_Example:_

```bash
datashare --mode CLI --stage INDEX --ocr false
```

### **Efficient Handling of Large Files**

Large PST files or archives can hinder processing efficiency. We recommend extract these files before processing with Datashare. If they are too many of them, keep in mind Datashare will be able to extract them anyway.

_Example to split Outlook PST files in multiple `.eml` files with_ [_readpst_](https://linux.die.net/man/1/readpst)_:_

```shell
readpst -reD <Filename>.pst
```
