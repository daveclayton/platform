```bash
docker network create -d macvlan \
  --subnet=192.168.0.0/24 \
  --gateway=192.168.0.1 \
  --aux-address="sv=192.168.0.130" \
    -o macvlan_mode=bridge \
    -o parent=enp46s0 pub_net
```