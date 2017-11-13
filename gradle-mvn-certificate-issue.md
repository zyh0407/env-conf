Using gradle to build 30+ java projects for about 7 months, everything works perfectly. But today suddenly it gives:

```
...
org.gradle.api.internal.artifacts.repositories.resolver.DefaultExternalResourceArtifactResolver.downloadStati
cResource(DefaultExternalResourceArtifactResolver.java:97)
        ... 118 more
Caused by: javax.net.ssl.SSLPeerUnverifiedException: Host name 'repo1.maven.org' does not match the certificate subject
provided by the peer (CN=repo.maven.apache.org, O="Sonatype, Inc", L=Fulton, ST=MD, C=US)
        at org.apache.http.conn.ssl.SSLConnectionSocketFactory.verifyHostname(SSLConnectionSocketFactory.java:465)
```

Spending a couple of hours, after checking maven JIRA, it points out the problem, after run the below command, 
it resumes to work again

```
sudo killall -HUP mDNSResponder
```
