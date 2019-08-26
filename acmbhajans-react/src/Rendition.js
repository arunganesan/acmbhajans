import React from "react";
import 'react-virtualized/styles.css'

import 'bootstrap/dist/css/bootstrap.css';
import { 
  generateFields,
  findEltName,
  } from './Fields.js'
import { ModelEditor } from './ModelEditor'


const initForms = {
  'renditions': () => { return {
      id: '',
      recording_url: '',
      shruti: '',

      bhajan_id: '',
      event_id: '',
      weekend: '',

      lead: [],
      backup: [],
      instrumentalists: [],
      soundsystem: [],
}}};




export class Rendition extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
        forms:{
          'renditions': initForms['renditions'](),
        },
        
        renditions: [],
        people: [],
        bhajans: [],
    }}




    
  renderForm () {
    let key = 'renditions';
    let spec = [
                { 'type': 'id'},
                { 'type': 'date', 'field': 'weekend'},
                { 'type': 'text', 'label': 'Recording URL', field: 'recording_url'},
                { 'type': 'text', 'label': 'Shruti', field: 'shruti'},
                
                { 'type': 'dropdown', 'label': 'Bhajan', 'field': 'bhajan_id', 'choices': this.state.bhajans},
                { 'type': 'dropdown', 'label': 'Event', 'field': 'event_id', 'choices': this.state.events},
                
                { 'type': 'array', 'label': 'Lead Singer(s)', 'field': 'lead', 'choices': this.state.people},
                { 'type': 'array', 'label': 'Backup', 'field': 'backup', 'choices': this.state.people},
                { 'type': 'array', 'label': 'Instrumentalists', 'field': 'instrumentalists', 'choices': this.state.people},
                { 'type': 'array', 'label': 'Mixer operator(s)', 'field': 'soundsystem', 'choices': this.state.people},
            ];
        
        return generateFields(spec, key, this.state, (s) => { this.setState(s) });
    }

  render() {
    return (
    <ModelEditor
      initForms={initForms}
      pageName="Rendition"
      editForm={this.renderForm()}
      URL="http://localhost:1234/renditions/edit"
      populateForm={(datum, currState) => {
        return {
          lead: this.state.lead_list[datum.id],
          backup: this.state.backup_list[datum.id],
          instrumentalists: this.state.instrumentalists_list[datum.id],
          soundsystem: this.state.soundsystem_list[datum.id],
        }
      }}

      formatRow={(datum) => {
        let bhajanName;
        if (datum['bhajan_id'] == null) 
          bhajanName = ' - No bhajan listed';
         else
          bhajanName = findEltName(datum['bhajan_id'], this.state.bhajans);
        let weekendName = datum['weekend']
        return weekendName + '. ' + bhajanName;
      }}

      modelfield='renditions'
      state={this.state}
      setState={(s) => this.setState(s)}
    />
  )}
}


