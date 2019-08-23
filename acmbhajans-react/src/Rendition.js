import React from "react";
import 'react-virtualized/styles.css'
import { AutoSizer, List } from 'react-virtualized'

import 'bootstrap/dist/css/bootstrap.css';
import { Button, Modal, Form } from 'react-bootstrap';
import { TextField, DropdownField, ArrayField } from './Fields.js'
import { ModelEditor } from './ModelEditor'

function initForm () {
    return {
        id: '',
        recording_url: '',
        shruti: '',

        bhajan_id: '',
        event_id: '',
        weekend_id: '',

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
        weekends: [],
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
        // TODO this may not always work. It assumes the ID maps into the ordered array
        let bhajanName = this.state.bhajans[datum['bhajan_id']-1]['name']
        let weekendName = this.state.weekends[datum['weekend_id']-1]['name']
        return '[' + weekendName + '] ' + bhajanName;
      }}

      state={this.state}
      setState={(s) => this.setState(s)}
    />
  )}
}


