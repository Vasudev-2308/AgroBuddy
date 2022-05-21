from http import server
import socket
import threading

# from zmq import DISCONNECT_MSG

PORT = 8080

s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
s.connect(("8.8.8.8", 80))
SERVER = s.getsockname()[0]
FORMAT = 'utf-8'
DISCONNECT_MSG = '!DISCONNECT'

ADDR = (SERVER, PORT)


server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server.bind(ADDR)


def handle_connections(conn, addr):
    print("Connection from:", addr)

    connected = True

    while connected:
        data_length = conn.recv(64).decode(FORMAT)
        if data_length:
            data_length = int(data_length)
            data = conn.recv(data_length).decode(FORMAT)
            if data == DISCONNECT_MSG:
                connected = False
            else:
                print(f" [{addr}] {data}")
                conn.send("Message received".encode(FORMAT))


def start_server():
    server.listen()  # type: ignore
    print("Listening on {}".format(ADDR))
    while True:
        connection, address = server.accept()  # type: ignore
        thread = threading.Thread(target=handle_connections, args=(connection, address))

        thread.start() # type: ignore




start_server()


