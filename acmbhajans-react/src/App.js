import React from "react";
import amma from './amma.jpg';
import './App.css';
import 'bootstrap/dist/css/bootstrap.css';

import { Button, ButtonToolbar } from 'react-bootstrap';
import { BrowserRouter as Router, Route, Link } from "react-router-dom";
import { EditBhajans } from './EditBhajans.js'
import { Ragas } from './Ragas.js'



function Index() {
  return (
    <div className="App">
      <header className="App-header">
        <img src={amma} className="App-logo" alt="logo" />
      </header>
    </div>
  );
}

// This looks nice but doesnt work out of the box
{/* <Nav variant="pills" defaultActiveKey="/home">
  <Nav.Item>
    <Nav.Link href="/home">Active</Nav.Link>
  </Nav.Item>
  <Nav.Item>
    <Nav.Link eventKey="link-1">Option 2</Nav.Link>
  </Nav.Item>
  <Nav.Item>
    <Nav.Link eventKey="disabled" disabled>
      Disabled
    </Nav.Link>
  </Nav.Item>
</Nav> */}

function AppRouter() {
  return (
    <Router>
      <div>
        <nav id='navigation'> 
          <ButtonToolbar>
            <Link to="/"><Button>Home</Button></Link>
            <Link to="/edit/bhajans"><Button>Bhajans</Button></Link>
            <Link to="/edit/ragas"><Button>Ragas</Button></Link>
          </ButtonToolbar>
        </nav>

        <Route path="/" exact component={Index} />
        <Route path="/edit/bhajans" component={EditBhajans} />
        <Route path="/edit/ragas" component={Ragas} />
      </div>
    </Router>
  );
}

export default AppRouter;