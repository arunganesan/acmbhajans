import React from "react";
import amma from './amma.jpg';
import './App.css';

import { LinkContainer } from "react-router-bootstrap";
import { Nav, NavItem, Navbar, Button } from "react-bootstrap";
import { Modal } from 'react-bootstrap';

import 'bootstrap/dist/css/bootstrap.css';

import { BrowserRouter as Router, Route } from "react-router-dom";

import { People } from './People.js'
import { Rendition } from './Rendition.js'
import { Requests } from './Requests.js'
import { InputPage } from './InputPage.js'
import { Summary } from './Summary'
import { Recordings } from './Recordings'
import { Database } from './Database'


function capitalize (word) {
  return word.charAt(0).toUpperCase() + word.slice(1);
}


function Index() {
  return (
    <div className="App">
      <header className="App-header">
        <img src={amma} height="540" className="App-logo" alt="logo" />
      </header>
    </div>
  );
}

function MyLink (props) {
  return (
  <NavItem>
    <LinkContainer to={"/" + props.to}>
    <Nav.Link style={{color: 'red'}} eventKey={props.to}>
        {props.label ? props.label : capitalize(props.to)}
    </Nav.Link>
    </LinkContainer>
  </NavItem>);
}



class AppRouter extends React.Component {
  constructor(props) {
    super(props);

    let loggedInLocal = JSON.parse(window.localStorage.getItem('loggedIn'));
    console.log('local storage has: ', loggedInLocal);
    this.state = {
      showLoginForm: false,
      people: [],
      loggedIn: loggedInLocal,
    }
  }


  componentDidMount() {
    fetch("http://localhost:1234/person/edit")
    .then(res => res.json())
    .then(data => {
        this.setState({
          ...data
        })
    });
}


  
  generateLoginForm() {
    let onHide = () => this.setState({ showLoginForm: false })
    
    return (<Modal
      show={this.state.showLoginForm}
      onHide={onHide}
      {...this.props}
      size="lg"
      aria-labelledby="contained-modal-title-vcenter"
      centered
    >
      <Modal.Header closeButton>
        <Modal.Title id="contained-modal-title-vcenter">
          Please log in
        </Modal.Title>
      </Modal.Header>
      
      <Modal.Body>
      <div className="login_people">
      { 
        this.state.people.map((person, idx) => (
        <div 
          className="login_person"
          onClick={() => {
              window.localStorage.setItem('loggedIn', JSON.stringify(person));
              this.setState({
                loggedIn: person,
                showLoginForm: false,
              });
          }}
          
          key={'logging-in-' + person.id}>
          {person.name}
          </div>
      ))}
      </div></Modal.Body>

      <Modal.Footer>
          <Button onClick={() => this.logoutPerson()}>Log out</Button>
      </Modal.Footer>
    </Modal>);
  }
  
  logoutPerson () {
    window.localStorage.setItem('loggedIn', null);
    this.setState({
      loggedIn: null,
      showLoginForm: false
    });
  }

  renderLogin() {
    if (this.state.loggedIn) {
      return (<>
      Logged in as 
      <div className="loggedInName">{this.state.loggedIn.name}</div>
      <Button 
        variant="light" 
        onClick={() => this.logoutPerson()}
      >Log out</Button></>);
    }
    else {
      return (<Button 
        variant="light" 
        onClick={() => this.setState({ showLoginForm: true })}
      >Log in</Button>);
    }
  }

  render () {
  return (
    <Router>
      <div id='navigation'>
        <Navbar expand="lg" bg="primary" variant="dark">
          <Nav className="mr-auto">
            <MyLink to="home" label="Home" />

            { this.state.loggedIn && 
              <MyLink to="input" label="Next Week" />
            }
            <MyLink to="recordings" />
            <MyLink to="summary" />
            

            {
              this.state.loggedIn && this.state.loggedIn.coordinator &&
               (<>
                  <MyLink to="database" />
                  <MyLink to="people" />
                  <MyLink to="requests" />
                  <MyLink to="rendition" />
                </>)
            }
            
          </Nav>
            <Navbar.Collapse className="justify-content-end">
                <Navbar.Text>
                  { this.renderLogin() }
                </Navbar.Text>
                </Navbar.Collapse>
          </Navbar>

        { this.state.showLoginForm && this.generateLoginForm() }

        <div id='content'>
          <Route path="/home" exact component={Index} />
          <Route 
            path="/input" 
            render={props => <InputPage personId={this.state.loggedIn ? this.state.loggedIn.id : null} />} />

          <Route 
            path="/recordings" 
            render={props => <Recordings personId={this.state.loggedIn ? this.state.loggedIn.id : null} />}
             />


          <Route path="/summary" component={Summary} />

          <Route path="/database" component={Database} />
          <Route path="/people" component={People} />
          <Route path="/requests" component={Requests} />
          <Route path="/rendition" component={Rendition} />
        </div>
      </div>
    </Router>
  )};
}

export default AppRouter;