# Performance considerations

Improving the performance of Datashare involves several techniques and configurations to ensure efficient data processing. Keep in mind extracting text from multiple file types and images is an heavy process. Below are some tips to enhance the speed and performance of your Datashare setup.

* Run the SCAN stage and INDEX stage separately: this allows for more focused resource usage and efficiency during each phase.
* For the INDEX stage, distribute the workload across several servers: A recommended setup includes using a [`g4dn.8xlarge`](https://instances.vantage.sh/aws/ec2/g4dn.8xlarge) instance (which offers 32 CPUs and 128 GB of memory) along with a remote Redis and a remote ElasticSearch instance.
* Given that ElasticSearch can be a bottleneck due to its high CPU and memory consumption, consider hosting it on a remote server to alleviate the load on your primary processing unit.
* Make use of the `--parallelism` and `--parserParallelism` options to parallelize processing:\
  On a `g4dn.8xlarge`, setting both to 14 is recommended for balanced performance.
* Tweak the `JAVA_OPTS` environment variable to better suit your machine's configuration. For a `g4dn.8xlarge`, using `-Xms10g -Xmx50g` provides a good starting point for JVM memory allocation.
* If the language of your documents is known, set it explicitly using the `--language` option (options include FRENCH, ENGLISH, etc.). This prevents Datashare from having to guess the document language, saving processing time.
* Similarly, for OCR tasks, use the `--ocrLanguage` option (such as `fra`, `eng`, etc.) to specify the language. This enables Tesseract to use the most efficient model for the given language.
* OCR (Optical Character Recognition) is often resource-intensive. If unnecessary, disable it using `--ocr false` to improve overall processing speed.
* For projects dealing with large PST files or archives, extracting them beforehand can significantly ease the processing burden on Datashare.
* To split PST files into many smaller files, utilize [`readpst`](https://linux.die.net/man/1/readpst) with options like `readpst -reD <Filename>.pst`, which aids in more manageable processing.

A few examples:

* `JAVA_OPTS=-Xms10g -Xmx50g datashare --mode CLI --stage INDEX`
* `datashare --mode CLI --stage INDEX --parallelism 12 --parserParallelism 12`
* `datashare --mode CLI --stage INDEX --language FRENCH --ocrLanguage fra`
