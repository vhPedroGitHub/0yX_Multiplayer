import React from 'react';

import { useState } from 'react';
import Modal from 'react-modal';
import axios from 'axios';
import { ip_server_flask } from '../variables';
import { io } from 'socket.io-client';


const AddUserModal = ({ isOpen, onRequestClose }) => {
    const [nombreUsuario, setNombreUsuario] = useState('');
    const [edad, setEdad] = useState('');
    const [contrasena, setContrasena] = useState('');

    const handleSubmit = async (e) => {
        e.preventDefault();
        
        try {
            await axios.post(`http://${ip_server_flask}/add_user`, {
              user_name: nombreUsuario,
              age: edad,
              password_player: contrasena,

            });

          } catch (err) {
            console.error('Error saving player to database', err);
          }
        
        console.log({ nombreUsuario, edad, contrasena });
        onRequestClose();
    };

    return (
        <Modal isOpen={isOpen} onRequestClose={onRequestClose}>
            <h2>Agregar Usuario</h2>
            <form onSubmit={handleSubmit}>
                <label>
                    Nombre de Usuario:
                    <input
                        type="text"
                        value={nombreUsuario}
                        onChange={(e) => setNombreUsuario(e.target.value)}
                        required
                    />
                </label>
                <label>
                    Edad:
                    <input
                        type="number"
                        value={edad}
                        onChange={(e) => setEdad(e.target.value)}
                        required
                    />
                </label>
                <label>
                    Contraseña:
                    <input
                        type="password"
                        value={contrasena}
                        onChange={(e) => setContrasena(e.target.value)}
                        required
                    />
                </label>
                <button type="submit">Agregar</button>
            </form>
            <button onClick={onRequestClose}>Cerrar</button>
        </Modal>
    );
};

const LoginUserModal = ({ isOpen, onRequestClose, setOnlinePlayer }) => {
    const [nombreUsuario, setNombreUsuario] = useState('');
    const [contrasena, setContrasena] = useState('');

    const handleSubmit = async (e) => {
        e.preventDefault();
        
        try {
            const response = await axios.post(`http://${ip_server_flask}/loguin_user`, 
            {
                user_name: nombreUsuario,
                password_player: contrasena
            });

            const player = response.data;
            console.log(player.isPlayer);

            if (player.isPlayer == "true") {
                console.log('Usuario logueado');
                setOnlinePlayer({
                    user_name: player.user_name,
                    age: player.age,
                    password_player: player.password_player,
                    id: player.id,
                    wins: player.wins,
                    game_overs: player.game_overs
                })
            }
            else {
                console.log('Usuario no logueado');
            }

          } catch (err) {
            console.error('Error saving loguin user', err);
          }
        
        console.log({ nombreUsuario, contrasena });
        onRequestClose();
    };

    return (
        <Modal isOpen={isOpen} onRequestClose={onRequestClose}>
            <h2>Logueo Usuario</h2>
            <form onSubmit={handleSubmit}>
                <label>
                    Nombre de Usuario:
                    <input
                        type="text"
                        value={nombreUsuario}
                        onChange={(e) => setNombreUsuario(e.target.value)}
                        required
                    />
                </label>
                <label>
                    Contraseña:
                    <input
                        type="password"
                        value={contrasena}
                        onChange={(e) => setContrasena(e.target.value)}
                        required
                    />
                </label>
                <button type="submit">Loguear</button>
            </form>
            <button onClick={onRequestClose}>Cerrar</button>
        </Modal>
    );
};

const Multiplayer_Menu = ({setOnlinePlayer, setSocket, setIsOnline}) => {
    const [modalIsOpen, setModalIsOpen] = useState(false);
    const [modalIsOpenLogueo, setModalIsOpenLogueo] = useState(false);

    const openModal = () => {
        setModalIsOpen(true);
    };

    const closeModal = () => {
        setModalIsOpen(false);
    };

    const openModalLogueo = () => {
        setModalIsOpenLogueo(true);
    };

    const closeModalLogueo = () => {
        setModalIsOpenLogueo(false);
        
    };

    const change_isOnline = () => {
        setIsOnline(true);
        setSocket(io(`http://${ip_server_flask}`));
    }

    return (
        <div className="multiplayer-container">
            <h1 className="multiplayer-title">Multiplayer Menu</h1>
            <button onClick={change_isOnline}>Search player</button>
            <button onClick={openModal}>Agregar Usuario</button>
            <button onClick={openModalLogueo}>Logueo Usuario</button>
            <AddUserModal isOpen={modalIsOpen} onRequestClose={closeModal} />
            <LoginUserModal isOpen={modalIsOpenLogueo} onRequestClose={closeModalLogueo} setOnlinePlayer={setOnlinePlayer}/>
        </div>
    );
};

export default Multiplayer_Menu;