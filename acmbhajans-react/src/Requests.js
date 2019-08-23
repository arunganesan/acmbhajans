import React from "react";
import 'react-virtualized/styles.css'

import 'bootstrap/dist/css/bootstrap.css';
import { IDField, findEltName, DropdownField, BooleanField } from './Fields.js'
import { ModelEditor } from './ModelEditor'

function initForm () {
    return {
        id: '',
        will_attend_practice: false,
        will_attend_satsang: false,
        
        attended_practice: false,
        attended_satsang: false,

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
    return [
    
      <IDField value={this.state.form.id} />,

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

        <BooleanField
          label='Will attend practice'
          field='will_attend_practice'
          state={this.state}
          setState={s => this.setState(s)} />,


        <DropdownField
        label='Practice Request'
        field='practice_request_id'
        choices={this.state.bhajans}
        state={this.state}
        setState={s => this.setState(s)} />,


        <BooleanField
          label='Will attend satsang'
          field='will_attend_satsang'
         state={this.state}
         setState={s => this.setState(s)} />,

        <DropdownField
        label='Satsang Request'
        field='satsang_request_id'
        choices={this.state.bhajans}
        state={this.state}
        setState={s => this.setState(s)} />,

      ];
    }
  
  render() {
    return (
    <ModelEditor
      initForm={initForm}
      pageName="Request"
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


