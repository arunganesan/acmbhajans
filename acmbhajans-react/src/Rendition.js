import React from "react";
import 'react-virtualized/styles.css'

import 'bootstrap/dist/css/bootstrap.css';
import { 
  ArrayField,
  DateField,
  DropdownField,
  findEltName,
  IDField,
  TextField } from './Fields.js'
import { ModelEditor } from './ModelEditor'

function initForm () {
    return {
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
    }
}



export class Rendition extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
        contents: [],
        form: initForm(),

        bhajans: [],
    }}

  renderForm () {
    return [<IDField
      value={this.state.form.id} />,



      <DateField
        field='weekend'
        state={this.state}
        setState={s => this.setState(s)} />,


    <TextField
      label='Recording URL'
      field='recording_url'
      state={this.state}
      setState={s => this.setState(s)} />,

    <TextField
      field='shruti'
      state={this.state}
      setState={s => this.setState(s)} />,

    <DropdownField
      label='Bhajan'
      field='bhajan_id'
      choices={this.state.bhajans}
      state={this.state}
      setState={s => this.setState(s)} />,


    <DropdownField
      label='Event'
      field='event_id'
      choices={this.state.events}
      state={this.state}
      setState={s => this.setState(s)} />,
      
    
    <ArrayField
      label='Lead Singer(s)'
      field='lead'
      choices={this.state.people}
      state={this.state}
      setState={s => this.setState(s)} />,


    <ArrayField
      field='backup'
      choices={this.state.people}
      state={this.state}
      setState={s => this.setState(s)} />,


    <ArrayField
      field='instrumentalists'
      choices={this.state.people}
      state={this.state}
      setState={s => this.setState(s)} />,


  <ArrayField
      label='Mixer operator(s)'
      field='soundsystem'
      choices={this.state.people}
      state={this.state}
      setState={s => this.setState(s)} />
      ];
    }
  
  render() {
    return (
    <ModelEditor
      initForm={initForm}
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

      state={this.state}
      setState={(s) => this.setState(s)}
    />
  )}
}


