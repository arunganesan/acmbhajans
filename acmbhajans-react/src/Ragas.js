import React from "react";
import 'react-virtualized/styles.css'
import 'bootstrap/dist/css/bootstrap.css';
import { Form } from 'react-bootstrap';
import { ModelEditor } from './ModelEditor.js'
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
        />
,     <TextField
        field='arohanam'
        state={this.state}
        setState={s => this.setState(s)}
        placeholder="e.g. S R2 G1 ..."
        />
,
      <TextField
        field='avarohanam'
        state={this.state}
        setState={s => this.setState(s)}
        placeholder="e.g. S N2 D1 ..."
        />,     
      <TextField
        field='anyasvara'
        state={this.state}
        setState={s => this.setState(s)}
        placeholder="e.g. N1"
        />];
    }
  
  render() {
    return (
    <ModelEditor
      initForm={initForm}
      pageName="Ragas"
      editForm={this.renderForm()}
      URL={URL}
      populateForm={(datum, currState) => {
        return {
          name: datum.name,
          arohanam: datum.arohanam,
          avarohanam: datum.avarohanam,
          anyasvara: datum.anyasvara,
          id: datum.id,
        }
      }}

      state={this.state}
      setState={(s) => this.setState(s)}
    />
  )}
}

