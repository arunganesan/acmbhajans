import React from "react";
import 'react-virtualized/styles.css'
import { AutoSizer, List } from 'react-virtualized'

import 'bootstrap/dist/css/bootstrap.css';
import { Button, Modal, Form } from 'react-bootstrap';
import { TextField, ArrayField } from './Fields.js'
import { ModelEditor } from './ModelEditor'

function initForm () {
    return {
        id: '',
        name: '',
        phone: '',
        email: '',
        ready_list: [],
    }
}


export class People extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
        contents: [],
        form: initForm(),

        bhajans: [],
    }}

  renderForm () {
    return [<Form.Control 
      type="text" 
      hidden={true} 
      readOnly
      value={this.state.form.id} />,

    <TextField
      field='name'
      state={this.state}
      setState={s => this.setState(s)}
      />,


    <TextField  
      field='phone'
      state={this.state}
      setState={s => this.setState(s)}
      />,
    
    <TextField  
      field='email'
      state={this.state}
      setState={s => this.setState(s)}
      />,


    <ArrayField
      label='Ready list'
      field='ready_list'
      state={this.state}
      choices={this.state.bhajans}
      setState={s => this.setState(s)}
      />
      ];
    }
  
  render() {
    return (
    <ModelEditor
      initForm={initForm}
      pageName="Person"
      editForm={this.renderForm()}
      URL="http://localhost:1234/person/edit"
      populateForm={(datum, currState) => {
        return {
          ready_list: this.state.ready_list[datum.id]
        }
      }}

      state={this.state}
      setState={(s) => this.setState(s)}
    />
  )}
}


