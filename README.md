# Home Operations

**CIDR Block:** `192.168.40.0/24`

| Role/Node           | Hostname              | IP Address    |
| ------------------- | --------------------- | ------------- |
| Cluster API         | -                     | 192.168.40.20 |
| Cluster DNS Gateway | -                     | 192.168.40.19 |
| Cluster Gateway     | -                     | 192.168.40.18 |
| Cloudflare Gateway  | -                     | 192.168.40.17 |
| Controller Node     | homeops-controller-01 | 192.168.40.22 |
| Worker Node         | homeops-worker-01     | 192.168.40.23 |
| Worker Node         | homeops-worker-02     | 192.168.40.24 |
| Worker Node         | homeops-worker-03     | 192.168.40.25 |

## Notes

```bash
kubectl cordon homeops-worker-01 || true
```

```bash
kubectl drain homeops-worker-03 --ignore-daemonsets --delete-emptydir-data --force --grace-period=0 || true
```

```bash
kubectl delete node homeops-worker-03
```

```bash
talosctl -n 192.168.40.24 apply-config --insecure -f ./kubernetes-homeops-worker-02.yaml
```

```bash
talosctl -n 192.168.40.25 apply-config --insecure -f ./kubernetes-homeops-worker-03.yaml
```
