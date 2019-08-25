import React from "react";
import 'react-virtualized/styles.css'

import 'bootstrap/dist/css/bootstrap.css';
import { IDField, ArrayField, TextField, DropdownField } from './Fields.js'
import { ModelEditor } from './ModelEditor'


const initForms = {
  'people': () => { return {
    id: '',
    name: '',
    phone: '',
    email: '',
    ready_list: [],
}}};

export class People extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
        forms: {
          'people': initForms['people'](),
        },
        
        people: [],
        bhajans: [],
    }}

  renderForm () {
    let key = 'people';
    let spec = [
                { 'type': 'id'},
                { 'type': 'text', 'field': 'name'},
                { 'type': 'text', 'field': 'phone'},
                { 'type': 'text', 'field': 'email'},
                { 'type': 'array', 'label': 'Ready list', 'field': 'ready_list', 'choices': this.state.bhajans},
            ];
        
    return spec.map((details) => {
      let placeholder = details['placeholder'] ? details['placeholder'] : '';
      if (details['type'] === 'id') 
          return (<IDField 
              modelfield={key}
              value={this.state.forms[key].id} />);
      else if (details['type'] === 'text')
          return (<TextField
              field={details['field']}
              placeholder={placeholder}
              state={this.state}
              modelfield={key}
              setState={s => this.setState(s)} />);
      else if (details['type'] === 'dropdown')
          return (<DropdownField 
              label={details['label']}
              field={details['field']}
              choices={details['choices']}
              placeholder={placeholder}
              modelfield={key}
              state={this.state}
              setState={s => this.setState(s)}/>);
      else if (details['type'] === 'array') 
          return (<ArrayField 
              label={details['label']}
              field={details['field']}
              choices={details['choices']}
              placeholder={placeholder}
              modelfield={key}
              state={this.state}
              setState={s => this.setState(s)}/>);
  });
    }
  
  render() {
    return (
    <ModelEditor
      initForms={initForms}
      pageName="Person"
      modelfield='people'
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


