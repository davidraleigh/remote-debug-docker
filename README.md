# remote-debug-docker
Dockerfile and associated supervisord configuration files for remote debugging using ssh.


copy your public key to the directory where you're building your machine:
```bash
gcloud compute copy-files ~/.ssh/google_compute_engine.pub davidraleigh@raleigh-dev-1604:/home/davidraleigh/debug-docker/ --zone=us-central1-b
```
