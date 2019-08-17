import React from "react";
import 'react-virtualized/styles.css'
import { AutoSizer, List } from 'react-virtualized'

import 'bootstrap/dist/css/bootstrap.css';
import { Button, Modal, Form } from 'react-bootstrap';


export class Ragas extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            form: {
              name: '',
              arohanam: '',
              avarohanam: '',
              anyasvara: '',
              id: ''
            },
            rowCount: 0,
            overscanRowCount: 100,
            showEditForm: false,
            contents: [],
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
              value={this.state.form.id}
              controlId="formRagaId" />
            <Form.Group controlId="formRagaName">
              <Form.Label>Name</Form.Label>
              <Form.Control 
                type="text"
                value={this.state.form.name} 
                onChange={changeName}
                placeholder="Name" />
            </Form.Group>
            <Form.Group controlId="formRagaArohanam">
              <Form.Label>Arohanam</Form.Label>
              <Form.Control 
                type="text" 
                value={this.state.form.arohanam} 
                onChange={changeArohanam} 
                placeholder="e.g. S R2 G1 ..." />
            </Form.Group>
            <Form.Group controlId="formRagaAvarohanam">
              <Form.Label>Avarohanam</Form.Label>
              <Form.Control 
                type="text"
                value={this.state.form.avarohanam} 
                onChange={changeAvarohanam}
                placeholder="e.g. S N2 D1 ..." />
            </Form.Group>
            <Form.Group controlId="formRagaAnyasvara">
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

    componentDidMount() {
        // Make AJAX calls here
        fetch('http://localhost:1234/raga/edit')
            .then(res => res.json())
            .then(data => {
                this.setState({
                  contents: data['contents'] 
                })
            });
    }

    componentWillUnmount() {
        // Clean up. Like removing timers.
    }

    handleSubmit(event) {
      this.setState({ showEditForm: false });

      fetch('http://localhost:1234/raga/edit', {
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
                  form: {
                    name: '',
                    arohanam: '',
                    avarohanam: '',
                    anyasvara: '',
                    id: ''
                  },
                  showEditForm: true })}>
                Add Raga
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
            arohanam: datum.arohanam,
            avarohanam: datum.avarohanam,
            anyasvara: datum.anyasvara,
            id: datum.id,
          },
          showEditForm: true });

        return (
          <div className="row" key={key} style={style} onClick={loadForm}>
            <div>{datum.name} - {datum.arohanam} - {datum.avarohanam} - {datum.anyasvara}</div>
          </div>
        );
      }
}
