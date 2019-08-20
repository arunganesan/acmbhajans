import React from "react";
import 'react-virtualized/styles.css'
import { AutoSizer, List } from 'react-virtualized'

import 'bootstrap/dist/css/bootstrap.css';
import { Button, Modal, Form } from 'react-bootstrap';
import { TextField, DropdownField, ArrayField } from './Fields.js'


function initForm () {
    return {
        id: '',
        recording_url: '',
        shruti: '',

        bhajan_id: '',
        event_id: '',
        weekend_id: '',

        lead: [],
        backup: [],
        instrumentalists: [],
        soundsystem: [],
    }
}

export class Rendition extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            form: initForm(),
            rowCount: 0,
            overscanRowCount: 100,
            showEditForm: false,
            contents: [],
            bhajans: [],
        };
        
        this._rowRenderer = this._rowRenderer.bind(this);
        this.generateForm = this.generateForm.bind(this);
        this.handleSubmit = this.handleSubmit.bind(this);
        this.findPerson = this.findPerson.bind(this);
    }

    findPerson (person_id) {
        for (let i = 0; i < this.state.people.length; i++) {
            let person = this.state.people[i];
            if (person_id == person.id) {
                return person.name;
            }
        }

        return 'Error - person invalid'
    }

    generateForm() {
      let onHide = () => this.setState({ showEditForm: false })
      
     
      return (<Modal
        show={this.state.showEditForm}
        onHide={onHide}
        {...this.props}
        size="lg"
        aria-labelledby="contained-modal-title-vcenter"
        centered
      >
        <Form onSubmit={this.handleSubmit}>
          <Modal.Header closeButton>
            <Modal.Title id="contained-modal-title-vcenter">
              Rendition
            </Modal.Title>
          </Modal.Header>
          <Modal.Body>
            <Form.Control 
              type="text" 
              hidden={true} 
              readOnly
              value={this.state.form.id} />

              <DropdownField
                label='Weekend'
                field='weekend_id'
                choices={this.state.weekends}
                state={this.state}
                setState={s => this.setState(s)} />


            <TextField
              label='Recording URL'
              field='recording_url'
              state={this.state}
              setState={s => this.setState(s)} />

            <TextField
              field='shruti'
              state={this.state}
              setState={s => this.setState(s)} />



            <DropdownField
              label='Bhajan'
              field='bhajan_id'
              choices={this.state.bhajans}
              state={this.state}
              setState={s => this.setState(s)} />


            <DropdownField
              label='Event'
              field='event_id'
              choices={this.state.events}
              state={this.state}
              setState={s => this.setState(s)} />
              
            
            <ArrayField
              label='Lead Singer(s)'
              field='lead'
              choices={this.state.people}
              state={this.state}
              setState={s => this.setState(s)} />


            <ArrayField
              field='backup'
              choices={this.state.people}
              state={this.state}
              setState={s => this.setState(s)} />


            <ArrayField
              field='instrumentalists'
              choices={this.state.people}
              state={this.state}
              setState={s => this.setState(s)} />


          <ArrayField
              label='Mixer operator(s)'
              field='soundsystem'
              choices={this.state.people}
              state={this.state}
              setState={s => this.setState(s)} />

            
          </Modal.Body>
          <Modal.Footer>
            <Button type="submit">Submit form</Button>
            <Button onClick={onHide}>Close</Button>
          </Modal.Footer>
        </Form>
      </Modal>);
    }

    
    componentDidMount() {
        // Make AJAX calls here
        fetch('http://localhost:1234/renditions/edit')
            .then(res => res.json())
            .then(data => {
                console.log('Got response data: ', data);
                this.setState({
                  ...data
                })
            });

          
    }

    componentWillUnmount() {
        // Clean up. Like removing timers.
    }

    handleSubmit(event) {
      this.setState({ showEditForm: false });

      console.log(this.state.form);

      fetch('http://localhost:1234/renditions/edit', {
        method: 'POST',
        mode: 'cors',
        cache: 'no-cache',
        headers: {
          'Content-type': 'application/json'
        },
        body: JSON.stringify(this.state.form)
      }).then(response => response.json())
      .then(data => {
        this.setState({ 
            contents: data['contents']})});

      // Submit form
      // Reload page
      event.preventDefault();
    }

    render() {
        return (<div>
             <Button 
                variant="primary" 
                onClick={() => this.setState({ 
                  form: initForm(),
                  showEditForm: true })}>
                Add Rendition
            </Button>
            
            { this.state.showEditForm && this.generateForm() }
            
            <AutoSizer disableHeight>
            {({width}) => (
                <List
                    ref="List"
                    className="List"
                    height={1500}
                    overscanRowCount={10}
                    rowCount={this.state.contents.length}
                    rowHeight={50}
                    rowRenderer={this._rowRenderer}
                    width={width}
                />
            )}
            </AutoSizer>
            </div>
        );
    }

    

    _rowRenderer({index, key, style}) {
        const datum = this.state.contents[index];

        let loadForm = () => this.setState({
          form: {
            ...this.state.form,
            ...datum,
            lead: this.state.lead_list[datum.id],
            backup: this.state.backup_list[datum.id],
            instrumentalists: this.state.instrumentalists_list[datum.id],
            soundsystem: this.state.soundsystem_list[datum.id],
          },
          showEditForm: true });

        return (
          <div className="row" key={key} style={style} onClick={loadForm}>
            <div>{JSON.stringify(datum)}</div>
          </div>
        );
      }
}
