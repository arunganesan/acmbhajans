import React from "react";
import 'react-virtualized/styles.css'
import 'bootstrap/dist/css/bootstrap.css'

import { IDField,ArrayField, TextField, DateField, findEltName, DropdownField, BooleanField } from './Fields.js'
import { ModelEditor } from './ModelEditor'


const initForms = {
  'requests': () => { return {
    id: '',
    will_attend_practice: false,
    will_attend_satsang: false,
    
    attended_practice: false,
    attended_satsang: false,

    practice_note: '',
    satsang_note: '',

    person_id: '',
    weekend: '',
}}};




export class Requests extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
        
        forms: {
          'requests': initForms['requests']()
        },

        requests: [],
        bhajans: [],
        people: [],
    }}


    
  renderForm () {
    let key = 'requests';
    let spec = [
                { 'type': 'id'},
                { 'type': 'date', 'field': 'weekend'},
                { 'type': 'dropdown', 'label': 'Person', 'field': 'person_id', 'choices': this.state.people},
                { 'type': 'boolean', 'label': 'Will attend practice', 'field': 'will_attend_practice'},
                { 'type': 'dropdown', 'label': 'Practice Request', 'field': 'practice_request_id', 'choices': this.state.bhajans},
                { 'type': 'text', 'label': 'Note for practice bhajan', field: 'practice_note'},

                { 'type': 'boolean', 'label': 'Will attend Satsang', 'field': 'will_attend_satsang'},
                { 
                  'type': 'dropdown', 
                  'label': 'Satsang Request', 
                  'field': 'satsang_request_id', 
                  'choices': this.state.bhajans, 
                  'filterBy':() => this.state.ready_list[this.state.forms['requests'].person_id]
                },
                { 'type': 'text', 'label': 'Note for satsang bhajan', field: 'satsang_note'},
            ];
        
    return spec.map((details) => {
      let placeholder = details['placeholder'] ? details['placeholder'] : '';
      if (details['type'] === 'id') 
          return (<IDField 
              modelfield={key}
              value={this.state.forms[key].id} />);
      else if (details['type'] === 'boolean')
            return (<BooleanField
              label={details['label']}
              field={details['field']}
              state={this.state}
              modelfield={key}
              setState={s => this.setState(s)} />);
      else if (details['type'] === 'date') 
        return (<DateField
        field={details['field']}
        
        modelfield={key}
        state={this.state}
        setState={s => this.setState(s)} />)
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
      pageName="Request"
      editForm={this.renderForm()}
      URL="http://localhost:1234/request/edit"
      populateForm={(datum, currState) => {}}
      
      modelfield='requests'
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


