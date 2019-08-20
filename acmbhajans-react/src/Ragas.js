import React from "react";
import 'react-virtualized/styles.css'
import { AutoSizer, List } from 'react-virtualized'

import 'bootstrap/dist/css/bootstrap.css';
import { Button, Modal, Form, Spinner } from 'react-bootstrap';
import { TextField } from './Fields.js'

const URL = "http://localhost:1234/raga/edit";

function initForm () {
  return {
    id: '',
    name: '',
    arohanam: '',
    avarohanam: '',
    anyasvara: '',
  }
}

export class Ragas extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            form: initForm(),
            loading: true,
            rowCount: 0,
            overscanRowCount: 100,
            showEditForm: false,
            contents: [],
        };
        
        this._rowRenderer = this._rowRenderer.bind(this);
        this.generateForm = this.generateForm.bind(this);
        this.handleSubmit = this.handleSubmit.bind(this);
        this.controlledFormChange = this.controlledFormChange.bind(this)
        this.onHide = this.setState({ showEditForm: false })

    }

    controlledFormChange (key) {
      return event => this.setState({ 
        form: {
          ...this.state.form,
          [key]: event.target.value
        }})
    }

    generateForm() {
      return (<Modal
        show={this.state.showEditForm}
        onHide={this.onHide}
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
              />


            <TextField
              label='Name'
              value={this.state.form.name}
              onChange={this.controlledFormChange('name')}
              />

           
            <TextField
              label='Arohanam'
              value={this.state.form.arohanam}
              onChange={this.controlledFormChange('arohanam')}
              placeholder="e.g. S R2 G1 ..."
              />


            <TextField
              label='Avarohanam'
              value={this.state.form.avarohanam}
              onChange={this.controlledFormChange('avarohanam')}
              placeholder="e.g. S N2 D1 ..."
              />

            
            <TextField
              label='Anyasvara'
              value={this.state.form.anyasvara}
              onChange={this.controlledFormChange('anyasvara')}
              placeholder="e.g. N1"
              />
          </Modal.Body>
          <Modal.Footer>
            <Button type="submit">Submit form</Button>
            <Button onClick={this.onHide}>Close</Button>
          </Modal.Footer>
        </Form>
      </Modal>);
    }

    componentDidMount() {
        // Make AJAX calls here
        fetch(URL)
            .then(res => res.json())
            .then(data => {
                this.setState({
                  contents: data['contents'],
                  loading: false,
                })
            });
    }

    componentWillUnmount() {
        // Clean up. Like removing timers.
    }

    handleSubmit(event) {
      this.setState({ 
        showEditForm: false,
        loading: true,
      });

      fetch(URL, {
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
          contents: data['contents'],
          loading: false
        });
        
        window.location.reload();
      });
      
      event.preventDefault();
    }

    render() {
        return (<div>
             <Button 
                variant="primary" 
                onClick={() => this.setState({ 
                  form: initForm(),
                  showEditForm: true })}>
                Add Raga
            </Button>
            
            { this.state.loading && (
              <Spinner animation="border" role="status">
                <span className="sr-only">Loading...</span>
              </Spinner>
            )}

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
