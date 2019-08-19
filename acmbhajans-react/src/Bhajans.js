import React from "react";
import 'react-virtualized/styles.css'
import { AutoSizer, List } from 'react-virtualized'

import 'bootstrap/dist/css/bootstrap.css';
import { Button, Modal, Form } from 'react-bootstrap';


function initForm () {
    return {
        id: '',
        name: '',
        deity_id: '',
        raga_id: '',
        beat: '',
        speed: '',
        language_id: ''
    }
}

export class Bhajans extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            form: initForm(),
            rowCount: 0,
            overscanRowCount: 100,
            showEditForm: false,
            contents: [],
            ragas: [],
            languages: [],
            deities: [],
        };
        
        this._rowRenderer = this._rowRenderer.bind(this);
        this.generateForm = this.generateForm.bind(this);
        this.handleSubmit = this.handleSubmit.bind(this);
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
              Bhajans
            </Modal.Title>
          </Modal.Header>
          <Modal.Body>
            <Form.Control 
              type="text" 
              hidden={true} 
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
                <Form.Label>Raga</Form.Label>
                <Form.Control 
                    as="select"
                    value={this.state.form.raga_id}
                    onChange={(event) => this.setState({
                      form: {
                        ...this.state.form,
                        raga_id: event.target.value
                      }
                    })}
                  >
                    <option value=''>None</option>
                    {
                        this.state.ragas.map((raga, key) => (
                        <option
                            key={'raga-' + raga['id']} 
                            value={raga['id']}>
                            {raga['name']} - {raga['arohanam']}
                        </option>)) 
                    }
                </Form.Control>
            </Form.Group>


            <Form.Group>
                <Form.Label>Deity</Form.Label>
                <Form.Control 
                    as="select"
                    value={this.state.form.deity_id}
                    onChange={(event) => this.setState({
                      form: {
                        ...this.state.form,
                        deity_id: event.target.value
                      }
                    })}
                  >
                    <option value=''>None</option>
                    { 
                        this.state.deities.map((item, key) => (
                        <option
                            key={'deity-' + item.id} 
                            value={item.id}>
                            {item.name}
                        </option>)) 
                    }
                </Form.Control>
            </Form.Group>


            <Form.Group>
                <Form.Label>Language</Form.Label>
                <Form.Control 
                    as="select"
                    value={this.state.form.language_id}
                    onChange={(event) => this.setState({
                      form: {
                        ...this.state.form,
                        language_id: event.target.value
                      }
                    })}
                  >
                    <option value=''>None</option>
                    { 
                        this.state.languages.map((item, key) => (
                        <option
                            key={'language-' + item.id} 
                            value={item.id}>
                            {item.name}
                        </option>)) 
                    }
                </Form.Control>
            </Form.Group>


            <Form.Group>
              <Form.Label>Beat</Form.Label>
              <Form.Control 
                type="text"
                value={this.state.form.beat} 
                onChange={(event) => this.setState({
                    form: { 
                      ...this.state.form,
                      beat: event.target.value
                    }})}
                placeholder="e.g. 8 beat cycle - Keherewa" />
            </Form.Group>
            


            <Form.Group>
              <Form.Label>Speed</Form.Label>
              <Form.Control 
                type="text"
                value={this.state.form.speed} 
                onChange={(event) => this.setState({
                    form: { 
                      ...this.state.form,
                      speed: event.target.value
                    }})}
                placeholder="e.g. 100 bpm" />
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
        fetch('http://localhost:1234/bhajans/edit')
            .then(res => res.json())
            .then(data => {
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

      fetch('http://localhost:1234/bhajans/edit', {
        method: 'POST',
        mode: 'cors',
        cache: 'no-cache',
        headers: {
          'Content-type': 'application/json'
        },
        body: JSON.stringify(this.state.form)
      }).then(response => response.json())
      .then(data => {
        console.log('RESPONSE FROM SERVER', data);
        this.setState({ contents: data['contents']})});

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
                Add Bhajan
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
            ...datum
          },
          showEditForm: true });

        return (
          <div className="row" key={key} style={style} onClick={loadForm}>
            <div>{JSON.stringify(datum)}</div>
          </div>
        );
      }
}
