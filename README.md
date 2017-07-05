# remote-debug-docker
Dockerfile and associated supervisord configuration files for remote debugging using ssh.

SSH into your remote debug machine. Git Clone this repo into your home directory. And then copy your google cloud public key from your local development machine to your remote development VM, to the `~/remote-debug-docker/` directory:
```bash
gcloud compute copy-files ~/.ssh/google_compute_engine.pub davidraleigh@raleigh-dev-1604:/home/davidraleigh/remote-debug-docker/ --zone=us-central1-b
```

From inside your remote development VM you need to pull over your pycharm helpers:
```bash
sudo gsutil cp -r gs://raleigh-data/2017.1.1/.pycharm_helpers ~/remote-debug-docker/
```

To run your machine you'll need to have the 52022 port exposed.

to ssh in you'll need to connect using root:
```bash
ssh -i ~/.ssh/google_compute_engine root@146.148.78.138 -p 52022
```
