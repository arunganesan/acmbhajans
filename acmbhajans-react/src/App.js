import React from "react";
import amma from './amma.jpg';
import './App.css';

import { LinkContainer } from "react-router-bootstrap";
import { Nav, Navbar, NavItem } from "react-bootstrap";

import 'bootstrap/dist/css/bootstrap.css';

import { BrowserRouter as Router, Route, Link } from "react-router-dom";

import { Bhajans } from './Bhajans.js'
import { Ragas } from './Ragas.js'
import { Deities } from './Deities.js'
import { Language } from './Language.js'
import { Event } from './Event.js'
import { People } from './People.js'
import { Rendition } from './Rendition.js'



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
  // <Nav.Link eventKey={props.to}>
  //   <LinkContainer to={"/" + props.to}>
  //     <NavItem>{props.to}</NavItem>
  //   </LinkContainer>
  // </Nav.Link>


  
  <NavItem>
    <LinkContainer to={"/" + props.to}>
    <Nav.Link eventKey={props.to}>
    
        {props.to}
      
    </Nav.Link>
    </LinkContainer>
  </NavItem>);
}

function AppRouter() {
  return (
    <Router>
      <div id='navigation'>
          <Nav fill={true} variant="tabs">
            <MyLink to="home" />
            <MyLink to="language" />
            <MyLink to="deities" />
            <MyLink to="ragas" />
            <MyLink to="bhajans" />
            <MyLink to="events" />
            <MyLink to="people" />
            <MyLink to="rendition" />
          </Nav>


        <div id='content'>
          <Route path="/home" exact component={Index} />
          <Route path="/bhajans" component={Bhajans} />
          <Route path="/ragas" component={Ragas} />
          <Route path="/deities" component={Deities} />
          <Route path="/language" component={Language} />
          <Route path="/events" component={Event} />
          <Route path="/people" component={People} />
          <Route path="/rendition" component={Rendition} />
        </div>
      </div>
    </Router>
  );
}

export default AppRouter;