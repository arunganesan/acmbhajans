import React from "react";
import amma from './amma.jpg';
import './App.css';

import { LinkContainer } from "react-router-bootstrap";
import { Nav, NavItem } from "react-bootstrap";
import { Modal } from 'react-bootstrap';

import 'bootstrap/dist/css/bootstrap.css';

import { BrowserRouter as Router, Route } from "react-router-dom";

import { Bhajans } from './Bhajans.js'
import { Ragas } from './Ragas.js'
import { Deities } from './Deities.js'
import { Language } from './Language.js'
import { Event } from './Event.js'
import { People } from './People.js'
import { Rendition } from './Rendition.js'
import { Weekends } from './Weekends.js'
import { Requests } from './Requests.js'
import { InputPage } from './InputPage.js'


function capitalize (word) {
  return word.charAt(0).toUpperCase() + word.slice(1);
}


function Index() {
  return (
    <div className="App">
      <header className="App-header">
        <img src={amma} className="App-logo" alt="logo" />
      </header>
    </div>
  );
}

function MyLink (props) {
  return (
  <NavItem>
    <LinkContainer to={"/" + props.to}>
    <Nav.Link eventKey={props.to}>
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
      showLoginForm: true,
      people: [],
      loggedIn: loggedInLocal,
    }
  }


  componentDidMount() {
    fetch("http://localhost:1234/person/edit")
    .then(res => res.json())
    .then(data => {
        this.setState({
            'people': data.contents
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
        { 
          this.state.people.map((person, idx) => (
          <div 
            className="ready_bhajan"
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
        ))
         }
    </Modal>);
  }
  
  render () {
  return (
    <Router>
      <div id='navigation'>
          <Nav variant="tabs">
            <MyLink to="home" label="Home" />
            <MyLink to="input" label="Next Week" />

            {
              this.state.loggedIn && this.state.loggedIn.coordinator &&
               ( <>
                  <MyLink to="language" />
                  <MyLink to="deities" />
                  <MyLink to="ragas" />
                  <MyLink to="bhajans" />
                  <MyLink to="events" />
                  <MyLink to="people" />
                  <MyLink to="weekends" />
                  <MyLink to="requests" />
                  <MyLink to="rendition" />
                </>)
            }
          </Nav>

        { this.state.loggedIn == null && this.generateLoginForm() }

        <div id='content'>
          <Route path="/home" exact component={Index} />
          <Route path="/input" component={InputPage} />
          <Route path="/bhajans" component={Bhajans} />
          <Route path="/ragas" component={Ragas} />
          <Route path="/deities" component={Deities} />
          <Route path="/language" component={Language} />
          <Route path="/events" component={Event} />
          <Route path="/people" component={People} />
          <Route path="/weekends" component={Weekends} />
          <Route path="/requests" component={Requests} />
          <Route path="/rendition" component={Rendition} />
        </div>
      </div>
    </Router>
  )};
}

export default AppRouter;