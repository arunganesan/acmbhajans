import React from "react";
import 'react-virtualized/styles.css'
import { AutoSizer, List } from 'react-virtualized'

import 'bootstrap/dist/css/bootstrap.css';
import { Button, Modal, Form } from 'react-bootstrap';
import { findEltName, DropdownField } from './Fields.js'
import { ModelEditor } from './ModelEditor'

function initForm () {
    return {
        id: '',
        will_attend_practice: '',
        will_attend_satsang: '',
        
        attended_practice: '',
        attended_satsang: '',

        person_id: '',
        weekend_id: '',
    }
}



export class Requests extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
        contents: [],
        form: initForm(),

        bhajans: [],
        weekends: [],
        people: [],
    }}

  renderForm () {
    return [<Form.Control 
      type="text" 
      hidden={true} 
      readOnly
      value={this.state.form.id} />,

      <DropdownField
        label='Weekend'
        field='weekend_id'
        choices={this.state.weekends}
        state={this.state}
        setState={s => this.setState(s)} />,

        <DropdownField
        label='Person'
        field='person_id'
        choices={this.state.people}
        state={this.state}
        setState={s => this.setState(s)} />,
      ];
    }
  
  render() {
    return (
    <ModelEditor
      initForm={initForm}
      pageName="Rendition"
      editForm={this.renderForm()}
      URL="http://localhost:1234/request/edit"
      populateForm={(datum, currState) => {
        return {

        }
      }}

      formatRow={(datum) => {
        let personName = findEltName(datum['person_id'], this.state.people);
        let weekendName = findEltName(datum['weekend_id'], this.state.weekends);
        return '[' + weekendName + '] ' + personName;
      }}
      
      state={this.state}
      setState={(s) => this.setState(s)}
    />
  )}
}


