# Talos

## Extensions

```yaml
customization:
    systemExtensions:
        officialExtensions:
            - siderolabs/amd-ucode
            - siderolabs/qemu-guest-agent
```

```bash
kubectl create secret generic onepassword-connect-credentials -n external-secrets --from-literal=1password-credentials.json="$(cat 1password-credentials.json | base64)"
```

```bash
export OP_CONNECT_TOKEN=$''
# Create secret with the token which is used by the External-Secret-Operator ClusterSecretStore
kubectl create secret -n external-secrets generic onepassword-connect-token --from-literal=token=$OP_CONNECT_TOKEN
```

```bash
kubectl -n ceph-csi create secret generic ceph-csi-rbd-secret \
  --from-literal=userID=csi-rbd-user \
  --from-literal=userKey=
```
