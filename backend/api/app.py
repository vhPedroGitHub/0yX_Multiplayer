from flask import Flask, request, jsonify
from flask_cors import CORS
from db import get_db_connection
from datetime import datetime

app = Flask(__name__)
CORS(app)  # Habilitar CORS para todas las rutas

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

if __name__ == '__main__':
    app.run(debug=True)