import paramiko

ssh = paramiko.SSHClient()
ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())

ssh.connect("192.168.1.10", username="user", password="pass")
stdin, stdout, stderr = ssh.exec_command("uptime")

print(stdout.read().decode())
ssh.close()
