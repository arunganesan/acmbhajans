import React from "react";
import amma from './amma.jpg';
import './App.css';
import 'bootstrap/dist/css/bootstrap.css';

import { Button, ButtonToolbar } from 'react-bootstrap';
import { BrowserRouter as Router, Route, Link } from "react-router-dom";
import { EditBhajans } from './EditBhajans.js'




function Index() {
  return (
    <div className="App">
      <header className="App-header">
        <img src={amma} className="App-logo" alt="logo" />
      </header>
    </div>
  );
}

function AppRouter() {
  return (
    <Router>
      <div>
        <nav id='navigation'> 
          <ButtonToolbar>
            <Link to="/"><Button>Home</Button></Link>
            <Link to="/edit/bhajans"><Button>Bhajans</Button></Link>
          </ButtonToolbar>
        </nav>

        <Route path="/" exact component={Index} />
        <Route path="/edit/bhajans" component={EditBhajans} />
      </div>
    </Router>
  );
}

export default AppRouter;