import React from "react";
import 'react-virtualized/styles.css'
import { AutoSizer, List } from 'react-virtualized'

import 'bootstrap/dist/css/bootstrap.css';
import { Button, Modal, Form } from 'react-bootstrap';
import { TextField, DropdownField } from './Fields.js'


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

            
            <TextField
              field='name'
              state={this.state}
              setState={s => this.setState(s)}
              />

            <DropdownField 
              label='Raga'
              field='raga_id'
              state={this.state}
              setState={s => this.setState(s)}
              choices={this.state.ragas} />

            <DropdownField 
              label='Deity'
              field='deity_id'
              state={this.state}
              setState={s => this.setState(s)}
              choices={this.state.deities} />

            <DropdownField 
              label='Language'
              field='language_id'
              state={this.state}
              setState={s => this.setState(s)}
              choices={this.state.languages} />

            <TextField
              field='beat'
              state={this.state}
              setState={s => this.setState(s)}
              placeholder="e.g. 8 beat cycle - Keherewa"
            />
            

            <TextField
              field='speed'
              state={this.state}
              setState={s => this.setState(s)}
              placeholder="e.g. 100 BPM"
            />

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
