from flask import Flask, request, jsonify
from flask_cors import CORS
from db import get_db_connection
from datetime import datetime
from flask_socketio import SocketIO, emit, join_room, leave_room

rooms = set()

app = Flask(__name__)
CORS(app)  # Habilitar CORS para todas las rutas
socketio = SocketIO(app, cors_allowed_origins="*")

@app.route('/add_game', methods=['POST'])
def add_game():
    data = request.get_json()
    game_date = datetime.now()
    jugador_1 = data.get('jugador_1')
    jugador_2 = data.get('jugador_2')

    conn = get_db_connection()
    cursor = conn.cursor()

    try:
        cursor.execute(
            'INSERT INTO games (game_date, jugador_1, jugador_2) VALUES (%s, %s, %s)',
            (game_date, jugador_1, jugador_2)
        )
        conn.commit()
        return jsonify({"message": "Game added successfully"}), 201
    except Exception as e:
        return jsonify({"error": str(e)}), 500
    finally:
        cursor.close()
        conn.close()

@app.route('/add_user', methods=['POST'])
def add_user():
    data = request.get_json()
    user_name = data.get('user_name')
    age = data.get('age')
    password_player = data.get('password_player')

    conn = get_db_connection()
    cursor = conn.cursor()

    try:
        cursor.execute(
            'INSERT INTO players (user_name, age, password_player) VALUES (%s, %s, %s)',
            (user_name, age, password_player)
        )
        conn.commit()
        return jsonify({"message": "User added successfully"}), 201
    except Exception as e:
        return jsonify({"error": str(e)}), 500
    finally:
        cursor.close()
        conn.close()

@app.route('/loguin_user', methods=['POST'])
def loguin_user():
    data = request.get_json()
    user_name = data.get('user_name')
    password_player = data.get('password_player')

    print(user_name, password_player)

    conn = get_db_connection()
    cursor = conn.cursor()

    try:
        cursor.execute('SELECT * FROM players WHERE user_name = %s AND password_player = %s', (user_name, password_player))
        games = cursor.fetchall()
        print(games)

        if len(games) != 0:
            return jsonify(
                {
                    "message": "User found", 
                    "isPlayer": "true", 
                    "user_name": games[0][1], 
                    "age": games[0][2], 
                    "password_player": games[0][3], 
                    "id": games[0][0], 
                    "wins": games[0][4], 
                    "game_overs": games[0][5]
                }
            ), 200
        else:
            return jsonify({"message": "User not found", "isPlayer": "false"}), 200

    except Exception as e:
        return jsonify({"error": str(e)}), 500
    finally:
        cursor.close()
        conn.close()

@app.route('/get_game_stats', methods=['GET'])
def get_game_stats():
    conn = get_db_connection()
    cursor = conn.cursor()

    try:
        cursor.execute('SELECT jugador_1, jugador_2 FROM games')
        games = cursor.fetchall()
        jugador_1_wins = sum(1 for game in games if game[0])
        jugador_2_wins = sum(1 for game in games if game[1])
        return jsonify({"jugador_1_wins": jugador_1_wins, "jugador_2_wins": jugador_2_wins}), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500
    finally:
        cursor.close()
        conn.close()

@app.route('/get_ips', methods=['GET'])
def get_ips():
    try:
        return jsonify({"local_ip":"localhost", "public_ip": "192.168.193.68", "internet_ip": "3.84.91.104"}), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500

@socketio.on('connect')
def handle_connect():
    print('Client connected')
    emit('message', {'data': 'Connected'})

@app.route('/rooms', methods=['GET'])
def get_rooms():
    return jsonify(list(rooms)), 200

@socketio.on('join')
def handle_join(data):
    room = data['room']
    join_room(room)
    rooms.add(room)
    print(rooms)
    emit('message', {'data': f'Joined room: {room}'}, room=room)

@socketio.on('leave')
def handle_leave(data):
    room = data['room']
    leave_room(room)
    emit('message', {'data': f'Left room: {room}'}, room=room)

@socketio.on('disconnect')
def handle_disconnect():
    print('Client disconnected')

@socketio.on('player_played')
def handle_play(data):
    room = data['room']

    print('Play received:', data)
    # Aquí puedes manejar la lógica del movimiento del juego
    emit('listen_player_played', data, room=room)

@socketio.on('start_game')
def handle_start_game(data):
    room = data['room']
    onlinePlayer = data['onlinePlayer_name']
    rooms.pop()
    print('Game started in room:', room)
    print('Player_2: ', onlinePlayer)
    # Notify all devices in the same room that the game has started
    emit('started_game', {'message': 'The game has started!', 'isReady': 'true', 'player_2': onlinePlayer}, room=room)

if __name__ == '__main__':
    socketio.run(app, debug=True, host='0.0.0.0', port=5000)