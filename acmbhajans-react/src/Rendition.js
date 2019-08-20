import React from "react";
import 'react-virtualized/styles.css'
import { AutoSizer, List } from 'react-virtualized'

import 'bootstrap/dist/css/bootstrap.css';
import { Button, Modal, Form } from 'react-bootstrap';



function initForm () {
    return {
        id: '',
        date: '',
        recording_url: '',
        shruti: '',

        bhajan_id: '',
        event_id: '',

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

            <Form.Group>
              <Form.Label>Date</Form.Label>
              <Form.Control 
                type="text"
                value={this.state.form.date} 
                onChange={(event) => this.setState({
                    form: { 
                      ...this.state.form,
                      date: event.target.value
                    }})}
                placeholder="" />
            </Form.Group>


            <Form.Group>
              <Form.Label>Recording</Form.Label>
              <Form.Control 
                type="text"
                value={this.state.form.recording_url} 
                onChange={(event) => this.setState({
                    form: { 
                      ...this.state.form,
                      recording_url: event.target.value
                    }})}
                placeholder="" />
            </Form.Group>

            <Form.Group>
              <Form.Label>Shruti</Form.Label>
              <Form.Control 
                type="text"
                value={this.state.form.shruti} 
                onChange={(event) => this.setState({
                    form: { 
                      ...this.state.form,
                      shruti: event.target.value
                    }})}/>
            </Form.Group>
              

            <Form.Group>
                <Form.Label>Bhajan</Form.Label>
                <Form.Control 
                    as="select"
                    value={this.state.form.bhajan_id}
                    onChange={(event) => this.setState({
                      form: {
                        ...this.state.form,
                        bhajan_id: event.target.value
                      }
                    })}
                  >
                    <option value=''>None</option>
                    {
                        this.state.bhajans.map(bhajan => (
                        <option
                            key={'bhajan-' + bhajan.id} 
                            value={bhajan.id}>
                            {bhajan.name}
                        </option>)) 
                    }
                </Form.Control>
            </Form.Group>

            <Form.Group>
                <Form.Label>Event</Form.Label>
                <Form.Control 
                    as="select"
                    value={this.state.form.event_id}
                    onChange={(event) => this.setState({
                      form: {
                        ...this.state.form,
                        event_id: event.target.value
                      }
                    })}
                  >
                    <option value=''>None</option>
                    {
                        this.state.events.map(evt => (
                        <option
                            key={'event-' + evt.id} 
                            value={evt.id}>
                            {evt.name}
                        </option>)) 
                    }
                </Form.Control>
            </Form.Group>

            <Form.Group>
                <Form.Label>Lead Singers</Form.Label>
                {
                    this.state.form.lead.map((lead_id, idx) => (
                    <div 
                        className="ready_bhajan"
                        onClick={() => {
                            let new_list = this.state.form.lead.filter((v, i, a) => i != idx);
                            this.setState({
                                form: {
                                    ...this.state.form,
                                    lead: new_list
                                }
                            });
                        }}
                        key={'lead_list-' + lead_id}>
                        {this.findPerson(lead_id)}
                        </div>
                    ))
                }

                <Form.Control 
                    as="select"
                    onChange={(event) => {
                        let lead_list = this.state.form.lead;
                        lead_list.push(event.target.value);
                        
                        this.setState({
                            form: {
                                ...this.state.form,
                                lead: lead_list,
                            }
                        })}}
                    >
                    <option value=''>None</option>
                    { 
                        this.state.people.map((item, key) => (
                        <option
                            key={'lead-person-' + item.id} 
                            value={item.id}
                            readOnly>
                            {item.name}
                        </option>)) 
                    }
                </Form.Control>
            </Form.Group> 
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
