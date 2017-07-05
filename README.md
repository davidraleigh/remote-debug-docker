# remote-debug-docker
Dockerfile and associated supervisord configuration files for remote debugging using ssh.

copy your public key to the directory where you're building your machine:
```bash
gcloud compute copy-files ~/.ssh/google_compute_engine.pub davidraleigh@raleigh-dev-1604:/home/davidraleigh/debug-docker/ --zone=us-central1-b
```

must pull over pycharm helpers to your build machine's DebugDockerfile directory before building:
```bash
sudo gsutil cp -r gs://raleigh-data/2017.1.1/.pycharm_helpers ./
```

to ssh in you'll need to connect using root:
```bash
ssh -i ~/.ssh/google_compute_engine root@146.148.78.138 -p 52022
```
