import React from "react";
import 'react-virtualized/styles.css'

import 'bootstrap/dist/css/bootstrap.css';
import { generateFields } from './Fields.js'
import { Container, Row, Col } from 'react-bootstrap'
import { ModelEditor } from './ModelEditor'


const initForms = {
    'bhajans': () => { return {
            id: '',
            name: '',
            deity_id: '',
            raga_id: '',
            beat: '',
            speed: '',
            language_id: ''
    }}, 'languages':  () => { return {
            id: '',
            name: ''
    }}, 'ragas': () => { return { 
        id: '',
        name: '',
        arohanam: '',
        avarohanam: '',
        anyasvara: '',
    }}, 'events':  () => { return {
        id: '',
        name: ''
    }}, 'deities':  () => { return {
        id: '',
        name: ''
    }}, 
}

export class Database extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
        forms: {
            'languages': initForms['languages'](),
            'bhajans': initForms['bhajans'](),
            'events': initForms['events'](),
            'deities': initForms['deities'](),
            'ragas': initForms['ragas'](),
        },
        
        bhajans: [],
        ragas: [],
        languages: [],
        deities: [],
        events: [],
    }}
  

    renderForm(key) {
        let spec = [];

        if (key === 'bhajans') {
            spec = [
                { 'type': 'id'},
                { 'type': 'text', 'field': 'name'},
                { 'type': 'dropdown', 'label': 'Raga', 'field': 'raga_id', 'choices': this.state.ragas},
                { 'type': 'dropdown', 'label': 'Deity', 'field': 'deity_id', 'choices': this.state.deities},
                { 'type': 'dropdown', 'label': 'Language', 'field': 'language_id', 'choices': this.state.languages},
                { 'type': 'text', 'field': 'beat', 'placehoder': 'e.g. 8 beat cycle - Keherewa'},
                { 'type': 'text', 'field': 'speed', 'placehoder': 'e.g. 100 BPM'},
            ];
        } else if (key === 'languages') {
            spec = [
                { 'type': 'id'},
                { 'type': 'text', 'field': 'name'},
            ];
        } else if (key === 'deities') {
            spec = [
                { 'type': 'id'},
                { 'type': 'text', 'field': 'name'},
            ];
        } else if (key === 'events') {
            spec = [
                { 'type': 'id'},
                { 'type': 'text', 'field': 'name'},
            ];
        } else if (key === 'ragas') {
            spec = [
                { 'type': 'id'},
                { 'type': 'text', 'field': 'name'},
                { 'type': 'text', 'field': 'arohanam', placeholder: 'e.g. S R2 G1 ...'},
                { 'type': 'text', 'field': 'avarohanam', placeholder: 'e.g. S N2 D1 ...'},
                { 'type': 'text', 'field': 'anyasvara', placeholder: 'e.g. N1'},
            ];
        }
        
        return generateFields(spec, key, this.state, (s) => { this.setState(s) });
    }
    
  render() {
    return (
        <Container><Row>
                <Col><ModelEditor
                    initForm={initForms}
                    pageName='Bhajans'
                    modelfield='bhajans'
                    editForm={this.renderForm('bhajans')}
                    URL="http://localhost:1234/bhajans/edit"
                    populateForm={(datum, currState) => {
                        return {}
                    }}
                    state={this.state}
                    setState={(s) => this.setState(s)}
                /></Col>
    
                <Col><ModelEditor
                    initForm={initForms}
                    pageName='Languages'
                    modelfield='languages'
                    editForm={this.renderForm('languages')}
                    URL="http://localhost:1234/language/edit"
                    state={this.state}
                    setState={(s) => this.setState(s)}
                /></Col>

                <Col><ModelEditor
                    initForm={initForms}
                    pageName='Events'
                    modelfield='events'
                    editForm={this.renderForm('events')}
                    URL="http://localhost:1234/event/edit"
                    state={this.state}
                    setState={(s) => this.setState(s)}
                /></Col>


                <Col><ModelEditor
                    initForm={initForms}
                    pageName='Ragas'
                    modelfield='ragas'
                    editForm={this.renderForm('ragas')}
                    URL="http://localhost:1234/raga/edit"
                    state={this.state}
                    setState={(s) => this.setState(s)}
                /></Col>

                
                <Col><ModelEditor
                    initForm={initForms}
                    pageName='Deities'
                    modelfield='deities'
                    editForm={this.renderForm('deities')}
                    URL="http://localhost:1234/deity/edit"
                    state={this.state}
                    setState={(s) => this.setState(s)}
                /></Col>


        </Row></Container>


  )}
}

