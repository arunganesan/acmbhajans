import React from "react";
import amma from './amma.jpg';
import './App.css';
import 'bootstrap/dist/css/bootstrap.css';

import { Button, ButtonToolbar } from 'react-bootstrap';
import { BrowserRouter as Router, Route, Link } from "react-router-dom";

import { Bhajans } from './Bhajans.js'
import { Ragas } from './Ragas.js'
import { Deities } from './Deities.js'
import { Language } from './Language.js'
import { Event } from './Event.js'



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
            <Link to="/edit/ragas"><Button>Ragas</Button></Link>
            <Link to="/edit/deities"><Button>Deities</Button></Link>
            <Link to="/edit/language"><Button>Languages</Button></Link>
            <Link to="/edit/events"><Button>Events</Button></Link>
          </ButtonToolbar>
        </nav>

        <Route path="/" exact component={Index} />
        <Route path="/edit/bhajans" component={Bhajans} />
        <Route path="/edit/ragas" component={Ragas} />
        <Route path="/edit/deities" component={Deities} />
        <Route path="/edit/language" component={Language} />
        <Route path="/edit/events" component={Event} />
      </div>
    </Router>
  );
}

export default AppRouter;