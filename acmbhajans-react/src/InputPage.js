import React from "react";
import 'react-virtualized/styles.css'
import { AutoSizer, List } from 'react-virtualized'

import 'bootstrap/dist/css/bootstrap.css';
import { Button, Modal, Form } from 'react-bootstrap';
import { TextField } from './Fields.js'

export class InputPage extends React.Component {
    constructor(props) {
        super(props);
        
        this.state = {
            user: window.localStorage.getItem('user'),
            showEditForm: false,
        };
        
        this.generateLoginForm = this.generateLoginForm.bind(this);
    }

   
    componentDidMount() {
        // // Make AJAX calls here
        // fetch('http://localhost:1234/event/edit')
        //     .then(res => res.json())
        //     .then(data => {
        //         this.setState({
        //           contents: data['contents'] 
        //         })
        //     });
    }

    componentWillUnmount() {
        // Clean up. Like removing timers.
    }

    generateLoginForm() {
        let onHide = () => this.setState({ showEditForm: false })
        
        return (<Modal
          show={this.state.showEditForm}
          onHide={onHide}
          {...this.props}
          size="lg"
          aria-labelledby="contained-modal-title-vcenter"
          centered
        >
          Helo log in first pleae
        </Modal>);
      }
    
    render() {
        return (<div>
            { this.state.user === null ? (
                <Button variant="primary"
                onClick={() => this.setState({ showEditForm: true })}>
                    Log in
                </Button>
            ) : ('Hello ' + this.state.user)}


            { this.state.showEditForm && this.generateLoginForm() }
        </div>);
    }
}
