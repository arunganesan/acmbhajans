import React from "react";
import logo from './logo.svg';
import './App.css';
import { Button, ButtonToolbar } from 'react-bootstrap';
import { BrowserRouter as Router, Route, Link } from "react-router-dom";

function Index() {
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Edit <code>src/App.js</code> and save to reload.
        </p>
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Learn React
        </a>
      </header>
    </div>
  );
}

function About() {
  return <h2>About</h2>;
}

function Users() {
  return <h2>Users</h2>;
}

class EditPersons extends React.Component {
  render() {
    return (
      <div>
        This is a return page?
        <h1>what</h1>
      </div>
    );
  }
}

function AppRouter() {
  return (
    <Router>
      <div>
        <nav id='navigation'> 
          <ButtonToolbar>
            <Link to="/"><Button>Home</Button></Link>
            <Link to="/about/"><Button>About</Button></Link>
            <Link to="/edit/person"><Button>Individual</Button></Link>
          </ButtonToolbar>
        </nav>

        <Route path="/" exact component={Index} />
        <Route path="/about/" component={About} />
        <Route path="/users/" component={Users} />
        <Route path="/edit/person" component={EditPersons} />
      </div>
    </Router>
  );
}

export default AppRouter;