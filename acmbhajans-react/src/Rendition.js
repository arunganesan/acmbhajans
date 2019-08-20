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

        leads: [],
        backups: [],
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
        this.findBhajan = this.findBhajan.bind(this);
    }

    findBhajan (bhajan_id) {
        for (let i = 0; i < this.state.bhajans.length; i++) {
            let bhajan = this.state.bhajans[i];
            if (bhajan_id == bhajan.id) {
                return bhajan.name;
            }
        }

        return 'Error - bhajan invalid'
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
              People
            </Modal.Title>
          </Modal.Header>
          <Modal.Body>
            <Form.Control 
              type="text" 
              hidden={true} 
              readOnly
              value={this.state.form.id} />

            <Form.Group>
              <Form.Label>Name</Form.Label>
              <Form.Control 
                type="text"
                value={this.state.form.name} 
                onChange={(event) => this.setState({
                    form: { 
                      ...this.state.form,
                      name: event.target.value
                    }})}
                placeholder="Name of bhajan" />
            </Form.Group>

            <Form.Group>
              <Form.Label>Phone</Form.Label>
              <Form.Control 
                type="text"
                value={this.state.form.phone} 
                onChange={(event) => this.setState({
                    form: { 
                      ...this.state.form,
                      phone: event.target.value
                    }})}
                placeholder="Phone no." />
            </Form.Group>

            <Form.Group>
              <Form.Label>Email</Form.Label>
              <Form.Control 
                type="text"
                value={this.state.form.email} 
                onChange={(event) => this.setState({
                    form: { 
                      ...this.state.form,
                      email: event.target.value
                    }})}
                placeholder="Email address" />
            </Form.Group>


            <Form.Group>
                <Form.Label>Ready list</Form.Label>
                {
                    this.state.form.ready_list.map((bhajan_id, idx) => (
                    <div 
                        className="ready_bhajan"
                        onClick={() => {
                            let new_list = this.state.form.ready_list.filter((v, i, a) => i != idx);
                            this.setState({
                                form: {
                                    ...this.state.form,
                                    ready_list: new_list
                                }
                            });
                        }}
                        key={'ready_list-' + bhajan_id}>
                        {this.findBhajan(bhajan_id)}
                        </div>
                    ))
                }

                <Form.Control 
                    as="select"
                    onChange={(event) => {
                        let ready_list = this.state.form.ready_list;
                        ready_list.push(event.target.value);
                        
                        this.setState({
                            form: {
                                ...this.state.form,
                                ready_list: ready_list,
                            }
                        })}}
                    >
                    <option value=''>None</option>
                    { 
                        this.state.bhajans.map((item, key) => (
                        <option
                            key={'bhajan-' + item.id} 
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
            lead_list: this.state.lead_list[datum.id],
            backup_list: this.state.backup_list[datum.id],
            instrumentalists_list: this.state.instrumentalists_list[datum.id],
            soundsystem_list: this.state.soundsystem_list[datum.id],
          },
          showEditForm: true });

        return (
          <div className="row" key={key} style={style} onClick={loadForm}>
            <div>{JSON.stringify(datum)}</div>
          </div>
        );
      }
}
