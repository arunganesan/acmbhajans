import React from "react";
import 'react-virtualized/styles.css'
import { AutoSizer, List } from 'react-virtualized'

import 'bootstrap/dist/css/bootstrap.css';
import { Button, Modal, Form } from 'react-bootstrap';


function initForm () {
    return {
        name: '',
        deity: '',
        raga_id: '',
        beat: '',
        speed: '',
        language: ''
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
        };
        
        this._rowRenderer = this._rowRenderer.bind(this);
        this.generateForm = this.generateForm.bind(this);
        this.handleSubmit = this.handleSubmit.bind(this);
    }

    generateForm() {
      let onHide = () => this.setState({ showEditForm: false })
      
      let changeArohanam = (event) => this.setState({
        form: { 
          ...this.state.form,
          arohanam: event.target.value
        }});
      
      let changeName = (event) => this.setState({ 
        form: {
          ...this.state.form,
          name: event.target.value
        }});

      let changeAvarohanam = (event) => this.setState({ 
        form: { 
          ...this.state.form,
          avarohanam: event.target.value
        }});

      let changeAnyasvara = (event) => this.setState({ 
        form: {
          ...this.state.form,
          anyasvara: event.target.value
        }});

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
              Ragas
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
                onChange={changeName}
                placeholder="Name" />
            </Form.Group>

            <Form.Group>
                <Form.Label>Raga</Form.Label>
                <Form.Control as="select">
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
              <Form.Label>Anyasvara</Form.Label>
              <Form.Control 
                type="text" 
                value={this.state.form.anyasvara} 
                onChange={changeAnyasvara}
                placeholder="e.g. N1" />
            </Form.Group>
          </Modal.Body>
          <Modal.Footer>
            <Button type="submit">Submit form</Button>
            <Button onClick={onHide}>Close</Button>
          </Modal.Footer>
        </Form>
      </Modal>);
    }

    generateDropdown() {
        let elts = [];
        for (let i = 0; i < this.state.ragas.length; i++) {
            let raga = this.state.ragas[i];
            let raga_option = (<option 
                key={raga['id']} 
                value={raga['id']}>{raga['name'] - raga['arohanam']}</option>);
            elts.push(raga_option);
        }

        console.log(elts);
        return elts;
    }

    componentDidMount() {
        // Make AJAX calls here
        fetch('http://localhost:1234/bhajans/edit')
            .then(res => res.json())
            .then(data => {
                this.setState({
                  contents: data['contents'],
                  ragas: data['ragas'] 
                })
            });
    }

    componentWillUnmount() {
        // Clean up. Like removing timers.
    }

    handleSubmit(event) {
      this.setState({ showEditForm: false });

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
            name: datum.name,
            deity: datum.deity,
            raga_id: datum.raga_id,
            beat: datum.beat,
            speed: datum.speed,
            language: datum.language
          },
          showEditForm: true });

        return (
          <div className="row" key={key} style={style} onClick={loadForm}>
            <div>{JSON.stringify(datum)}</div>
          </div>
        );
      }
}
