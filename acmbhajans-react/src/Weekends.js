import React from "react";
import 'react-virtualized/styles.css'
import { AutoSizer, List } from 'react-virtualized'

import 'bootstrap/dist/css/bootstrap.css';
import { Button, Modal, Form } from 'react-bootstrap';
import { TextField } from './Fields.js'
import { ModelEditor } from './ModelEditor'

function initForm () {
  return {
    name: '',
    id: ''
  }
}
export class Weekends extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
        contents: [],
        form: initForm(),
    }}

  renderForm () {
    return [<Form.Control 
        type="text" 
        hidden={true} 
        value={this.state.form.id}
        />,
      <TextField
        field='name'
        state={this.state}
        setState={s => this.setState(s)}
        />];
    }
  
  render() {
    return (
    <ModelEditor
      initForm={initForm}
      pageName="Events"
      editForm={this.renderForm()}
      URL="http://localhost:1234/weekend/edit"
      populateForm={(datum, currState) => {
        return {}
      }}

      state={this.state}
      setState={(s) => this.setState(s)}
    />
  )}
}

