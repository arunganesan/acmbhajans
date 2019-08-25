import React from "react";
import 'react-virtualized/styles.css'

import 'bootstrap/dist/css/bootstrap.css';
import { Form } from 'react-bootstrap';
import { TextField, DropdownField } from './Fields.js'
import { ModelEditor } from './ModelEditor'

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
        contents: [],
        form: initForm(),

        ragas: [],
        languages: [],
        deities: [],
    }}

  renderForm () {
    return [<Form.Control 
      type="text" 
      hidden={true} 
      value={this.state.form.id} />,
    <TextField
      field='name'
      state={this.state}
      setState={s => this.setState(s)}
      />,

    <DropdownField 
      label='Raga'
      field='raga_id'
      state={this.state}
      setState={s => this.setState(s)}
      choices={this.state.ragas} />,

    <DropdownField 
      label='Deity'
      field='deity_id'
      state={this.state}
      setState={s => this.setState(s)}
      choices={this.state.deities} />,

    <DropdownField 
      label='Language'
      field='language_id'
      state={this.state}
      setState={s => this.setState(s)}
      choices={this.state.languages} />,

    <TextField
      field='beat'
      state={this.state}
      setState={s => this.setState(s)}
      placeholder="e.g. 8 beat cycle - Keherewa"
    />,
    

    <TextField
      field='speed'
      state={this.state}
      setState={s => this.setState(s)}
      placeholder="e.g. 100 BPM"
    />];
    }
  
  render() {
    return (
    <ModelEditor
      initForm={initForm}
      pageName="Bhajans"
      editForm={this.renderForm()}
      URL="http://localhost:1234/bhajans/edit"
      populateForm={(datum, currState) => {
        return {}
      }}

      state={this.state}
      setState={(s) => this.setState(s)}
    />
  )}
}

