import socket

server=socket.socket()
server.bind(("localhost",5000))
server.listen()

conn,addr=server.accept()

while True:
    msg=conn.recv(1024).decode()
    print("Client:",msg)
