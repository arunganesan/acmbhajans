import React from "react";
import amma from './amma.jpg';
import './App.css';

import { LinkContainer } from "react-router-bootstrap";
import { Nav, NavItem, Navbar, Button } from "react-bootstrap";
import { Modal, Container, Row, Col } from 'react-bootstrap';

import 'bootstrap/dist/css/bootstrap.css';

import { Link, HashRouter as Router, Route } from "react-router-dom";
import { MdFavorite } from 'react-icons/md'




import { People } from './People.js'
import { Rendition } from './Rendition.js'
import { Requests } from './Requests.js'
import { InputPage } from './InputPage.js'
import { Summary } from './Summary'
import { Recordings } from './Recordings'
import { Database } from './Database'
import { Attendance } from './Attendance'

import { BASEDIR, isDevel, URLBASE  } from './Config'

function capitalize (word) {
  return word.charAt(0).toUpperCase() + word.slice(1);
}


function Index() {
  return (
    <div className="App">
      <header className="App-header">
        <img src={amma} height="308" className="App-logo" alt="logo" />


        <Container>
          <Row>
            <Col>
              If you've been looking for a particular Amma bhajan online and are having trouble finding it, here's a handy list of the best sources for Amma's music. You can search by artist, album, and track name at most of these sites. Remember, your purchase makes a difference. Proceeds benefit Amma's many humanitarian and charitable projects. <MdFavorite />

              <ul>
                <li>Apple Music <a href='https://itunes.apple.com/us/artist/amma/4472743'>https://itunes.apple.com/us/artist/amma/4472743</a></li>
                <li>Amazon <a href='https://www.amazon.com/default/e/B001LHC1VC?redirectedFromKindleDbs=true'>https://www.amazon.com/default/e/B001LHC1VC?redirectedFromKindleDbs=true</a></li>
              <li>Google Music <a href='https://play.google.com/store/music/artist/Amma?id=Aaa2nfjq5kpjrhwrcdndbkkaenq'>https://play.google.com/store/music/artist/Amma?id=Aaa2nfjq5kpjrhwrcdndbkkaenq</a></li>
              <li>CD Baby <a href='https://store.cdbaby.com/artist/Amma'>https://store.cdbaby.com/artist/Amma</a></li>
              <li>The Amma Shop <a href='http://www.theammashop.org/music/'>http://www.theammashop.org/music/</a> </li>
              </ul>
            </Col>
          </Row>
        </Container>
        

      </header>
    </div>
  );
}

function MyLink (props) {
  return (
  <NavItem>
    <LinkContainer to={`/${props.to}`}>
    <Nav.Link style={{color: 'red'}}>
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
    fetch(`${URLBASE()}/person/edit`)
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
        <Navbar expand="lg" bg={
          isDevel() ? 'warning' : 'primary'
        } variant="dark">
          <Nav className="mr-auto">
            <MyLink to="" label="Home" />

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
                  <MyLink to="attendance" />
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
          <Route path={`/`} exact component={Index} />
          <Route 
            path={`/input`} 
            render={props => <InputPage personId={this.state.loggedIn ? this.state.loggedIn.id : null} />} />

          <Route 
            path={`/recordings`}
            render={props => <Recordings personId={this.state.loggedIn ? this.state.loggedIn.id : null} />}
             />


          <Route path={`/summary`} component={Summary} />
          <Route path={`/database`} component={Database} />
          <Route path={`/people`} component={People} />
          <Route path={`/requests`} component={Requests} />
          <Route path={`/rendition`} component={Rendition} />
          <Route path={`/attendance`} component={Attendance} />
        </div>
      </div>
    </Router>
  )};
}

export default AppRouter;