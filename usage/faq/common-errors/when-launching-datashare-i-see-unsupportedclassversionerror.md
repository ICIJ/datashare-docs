# When I launch datashare I see a `UnsupportedClassVersionError` error

When you launch datashare you see the following stacktrace:

```java
java.lang.UnsupportedClassVersionError: org/icij/datashare/DynamicClassLoader has been compiled by a more recent version of the Java Runtime (class file version 61.0), this version of the Java Runtime only recognizes class file versions up to 55.0
	at java.lang.ClassLoader.defineClass1(java.base@11.0.23/Native Method)
	at java.lang.ClassLoader.defineClass(java.base@11.0.23/ClassLoader.java:1022)
	at java.security.SecureClassLoader.defineClass(java.base@11.0.23/SecureClassLoader.java:174)
	at jdk.internal.loader.BuiltinClassLoader.defineClass(java.base@11.0.23/BuiltinClassLoader.java:800)
	at jdk.internal.loader.BuiltinClassLoader.findClassOnClassPathOrNull(java.base@11.0.23/BuiltinClassLoader.java:698)
	at jdk.internal.loader.BuiltinClassLoader.loadClassOrNull(java.base@11.0.23/BuiltinClassLoader.java:621)
	at jdk.internal.loader.BuiltinClassLoader.loadClass(java.base@11.0.23/BuiltinClassLoader.java:579)
	at jdk.internal.loader.ClassLoaders$AppClassLoader.loadClass(java.base@11.0.23/ClassLoaders.java:178)
	at java.lang.ClassLoader.loadClass(java.base@11.0.23/ClassLoader.java:527)
	at java.lang.Class.forName0(java.base@11.0.23/Native Method)
	at java.lang.Class.forName(java.base@11.0.23/Class.java:398)
	at java.lang.ClassLoader.initSystemClassLoader(java.base@11.0.23/ClassLoader.java:1981)
	at java.lang.System.initPhase3(java.base@11.0.23/System.java:2091)
```

This indicates that java (more specifically the Java Runtime Environment or JRE) is too old for datashare.

For example datashare is compiled in version 17 since version 17.1.0. Thus, if you have a JRE from a previous datashare installation or a JRE previously installed in your machine, you have to upgrade it to the 17 version.

