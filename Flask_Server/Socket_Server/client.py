import socket



PORT = 8080
FORMAT = 'utf-8'
DISCONNECT_MSG = '!DISCONNECT'

SERVER = "192.168.0.101"

ADDR = (SERVER, PORT)

client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

client.connect(ADDR) # type: ignore


def send_message(msg):
    message = msg.encode(FORMAT)
    msg_len = len(message)
    send_len = str(msg_len).encode(FORMAT)
    send_len += b' ' * (64 - len(send_len))
    client.send(send_len)
    client.send(message)



while True:
    message = input("> ")
    if message == DISCONNECT_MSG:
        break
    send_message(message)
    print(client.recv(1024).decode(FORMAT))

