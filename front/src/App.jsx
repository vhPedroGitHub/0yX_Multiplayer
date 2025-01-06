import React, { useState, useEffect } from 'react';
import "./App.css";

import MainGame from './componnets/MainGame';
import Multiplayer_Game from './componnets/Multiplayer_Game';
import Multiplayer_Menu from './componnets/Multiplayer_Menu';

const App = () => {
  const [socket, setSocket] = useState(null);
  const [isOnline, setIsOnline] = useState(false);
  const [onlinePlayer, setOnlinePlayer] = useState(
    { 
      user_name:        '', 
      age:              0, 
      password_player:  '', 
      id:               0, 
      wins:             0, 
      game_overs:       0 
    }
  );

  useEffect(() => {
    console.log(onlinePlayer);  
  }, [onlinePlayer]);

  return (
    <>
      {!isOnline && <MainGame />}
      {isOnline && <Multiplayer_Game socket={socket} onlinePlayer={onlinePlayer}/>}
      {!isOnline && <Multiplayer_Menu setIsOnline={setIsOnline} setOnlinePlayer={setOnlinePlayer} setSocket={setSocket}/>}
    </>
  );
};

export default App;
