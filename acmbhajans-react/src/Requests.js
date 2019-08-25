import React from "react";
import 'react-virtualized/styles.css'
import 'bootstrap/dist/css/bootstrap.css'

import { IDField, TextField, DateField, findEltName, DropdownField, BooleanField } from './Fields.js'
import { ModelEditor } from './ModelEditor'

function initForm () {
    return {
        id: '',
        will_attend_practice: false,
        will_attend_satsang: false,
        
        attended_practice: false,
        attended_satsang: false,

        practice_note: '',
        satsang_note: '',

        person_id: '',
        weekend: '',
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

      <DateField
        field='weekend'
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

        <TextField
        label='Note for practice bhajan'
        field='practice_note'
        state={this.state}
        setState={s => this.setState(s)}
        />,


        <BooleanField
          label='Will attend satsang'
          field='will_attend_satsang'
         state={this.state}
         setState={s => this.setState(s)} />,

        <DropdownField
        label='Satsang Request'
        field='satsang_request_id'
        choices={this.state.bhajans}
        filterBy={() => this.state.ready_list[this.state.form.person_id]}
        state={this.state}
        setState={s => this.setState(s)} />,


        <TextField
        label='Note for satsang bhajan'
        field='satsang_note'
        state={this.state}
        setState={s => this.setState(s)}
        />,



      ];
    }
  
  render() {
    return (
    <ModelEditor
      initForm={initForm}
      pageName="Request"
      editForm={this.renderForm()}
      URL="http://localhost:1234/request/edit"
      populateForm={(datum, currState) => {}}
      
      formatRow={(datum) => {
        let personName = findEltName(datum['person_id'], this.state.people);
        let weekendName = datum['weekend'];
        let will_attend_practice = datum['will_attend_practice']
        let will_attend_satsang =  datum['will_attend_satsang']

        let practiceRequestId = datum['practice_request_id'];
        let satsangRequestId = datum['satsang_request_id'];
        let practiceRequestName = (practiceRequestId == '') ? '' : findEltName(practiceRequestId, this.state.bhajans);
        let satsangRequestName = (satsangRequestId == '') ? '' : findEltName(satsangRequestId, this.state.bhajans);
        
        let row =  '' + weekendName + '. ' + personName;

        if (will_attend_practice) {
          row += ` - will attend practice (${practiceRequestName})`
        } 

        if (will_attend_satsang) {
          row += ` - will attend satsang (${satsangRequestName})`
        }

        return row;
      }}
      
      state={this.state}
      setState={(s) => this.setState(s)}
    />
  )}
}


