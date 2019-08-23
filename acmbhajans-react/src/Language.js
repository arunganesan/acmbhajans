import React from "react";
import 'react-virtualized/styles.css'

import 'bootstrap/dist/css/bootstrap.css';
import { TextField, IDField } from './Fields.js'
import { ModelEditor } from './ModelEditor.js'

function initForm () {
  return {
    name: '',
    id: ''
  }
}

export class Language extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
        contents: [],
        form: initForm(),
    }}

  renderForm () {
    return [<IDField value={this.state.form.id} />,
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
      pageName="Languages"
      editForm={this.renderForm()}
      URL="http://localhost:1234/language/edit"
      populateForm={(datum, currState) => {
        return {}
      }}

      state={this.state}
      setState={(s) => this.setState(s)}
    />
  )}
}