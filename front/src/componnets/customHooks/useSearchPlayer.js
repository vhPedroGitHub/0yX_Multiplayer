import { useState, useEffect } from 'react';
import axios from 'axios';
import { ip_server_flask, TURNS } from '../../variables';

const useSearchPlayer = (socket, onlinePlayer, setTurno) => {
    const [isReady, setIsReady] = useState(false);
    const [player_1, setPlayer_1] = useState("");
    const [player_2, setPlayer_2] = useState("");

    useEffect(() => {
        const searchingGroup = async () => {
            // Unirse a una sala
            const response = await axios.get(`http://${ip_server_flask}/rooms`);
            const rooms = response.data;
            if (rooms.length > 0) {
                socket.emit('join', { room: rooms[0]});
                
                setPlayer_1(rooms[0])
                setPlayer_2(onlinePlayer.user_name)
                setTurno(TURNS.X);

                socket.emit('start_game', { room: rooms[0], onlinePlayer_name: onlinePlayer.user_name });

                console.log("Empezando la partida")

                setIsReady(true);
            } else {
                socket.emit('join', { room: onlinePlayer.user_name });
                setPlayer_1(onlinePlayer.user_name)

                console.log("Esperara a que se una un jugador")
                socket.on('started_game', (data) => {
                    console.log(data);
                    if (data.isReady) {
                        setIsReady(true);
                        setTurno(TURNS.O);
                        setPlayer_2(data.player_2);
                    }
                });
            }
        };

        searchingGroup();

        return () => {
            socket.off('started_game'); // Limpieza al desmontar
        };

    }  , []);

    return { isReady, setIsReady, player_1, player_2};
};

export default useSearchPlayer;