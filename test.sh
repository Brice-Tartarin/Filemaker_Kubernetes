for pod in $(kubectl get pods -l app=filemaker -o jsonpath='{.items[*].metadata.name}'); do
  kubectl exec -it $pod -- /bin/bash -c "apt install -y libcurl3-gnutls && apt update && apt upgrade -y && FM_ASSISTED_INSTALL=/install apt install -y /install/filemaker-server-20.2.1.19-amd64.deb"
done
