import React from "react";
import 'react-virtualized/styles.css'

import 'bootstrap/dist/css/bootstrap.css';
import { 
  generateFields,
  findEltName,
  } from './Fields.js'
import { ModelEditor } from './ModelEditor'
import { Button, Form } from 'react-bootstrap'
import DatePicker from "react-datepicker";
import "react-datepicker/dist/react-datepicker.css";
import moment from 'moment'
import { getDay, addDays, subDays }  from "date-fns";
import { URLBASE } from  './Config'

const initForms = {
  'renditions': () => { return {
      id: '',
      recording_url: '',
      shruti: '',

      bhajan_id: '',
      event_id: '',
      weekend: '',
      
      order: '',

      lead: [],
      backup: [],
      instrumentalists: [],
      soundsystem: [],
}}};





export class Rendition extends React.Component {
  constructor(props) {
    super(props);

    this.child = React.createRef();
    this.state = {
        forms:{
          'renditions': initForms['renditions'](),
        },
        
        renditions: [],
        people: [],
        bhajans: [],

        fromDate: subDays(new Date(), 26),
        toDate: addDays(new Date(), 7),
    }}




    
  renderForm () {
    let key = 'renditions';
    let spec = [
                { 'type': 'id'},
                { 'type': 'date', 'field': 'weekend'},
                { 'type': 'text', 'label': 'Recording URL', field: 'recording_url'},
                { 'type': 'text', 'label': 'Shruti', field: 'shruti'},
                { 'type': 'text', 'label': 'Order', field: 'order'},
                
                { 'type': 'dropdown', 'label': 'Bhajan', 'field': 'bhajan_id', 'choices': this.state.bhajans},
                { 'type': 'dropdown', 'label': 'Event', 'field': 'event_id', 'choices': this.state.events},
                
                { 'type': 'array', 'label': 'Lead Singer(s)', 'field': 'lead', 'choices': this.state.people},
                { 'type': 'array', 'label': 'Backup', 'field': 'backup', 'choices': this.state.people},
                { 'type': 'array', 'label': 'Instrumentalists', 'field': 'instrumentalists', 'choices': this.state.people},
                { 'type': 'array', 'label': 'Mixer operator(s)', 'field': 'soundsystem', 'choices': this.state.people},
            ];
        
        return generateFields(spec, key, this.state, (s) => { this.setState(s) });
  }

  generateDateRange() {
    let fromStr = moment(this.state.fromDate).format("YYYY-MM-DD");
    let toStr = moment(this.state.toDate).format("YYYY-MM-DD");
    return `?from=${fromStr}&to=${toStr}`;
  }

  generateSummary() {
    fetch(`${URLBASE()}/renditions/generate_summary`)
    .then(() => alert('Generated summary'));
  }

  render() {
    return (
    <ModelEditor
      ref={this.child}
      initForms={initForms}
      pageName="Rendition"
      editForm={this.renderForm()}
      URL={`${URLBASE()}/renditions/edit`}
      populateForm={(datum, currState) => {
        return {
          lead: this.state.lead_list[datum.id],
          backup: this.state.backup_list[datum.id],
          instrumentalists: this.state.instrumentalists_list[datum.id],
          soundsystem: this.state.soundsystem_list[datum.id],
        }
      }}

      additionalButtons={
        [(<Form.Group>
            <Form.Label>From</Form.Label>
            <DatePicker
              selected={this.state.fromDate}
              onChange={date => {
                this.setState({ fromDate: date }, () => this.child.current.fetchNewData());
              }}
            filterDate={date => getDay(date) === 6}
            />
         </Form.Group>),
         (<Form.Group>
          <Form.Label>To</Form.Label>
          <DatePicker
            selected={this.state.toDate}
            onChange={date => {
             this.setState({ toDate: date }, () => this.child.current.fetchNewData());
             
            }}
            filterDate={date => getDay(date) === 6}
          />
       </Form.Group>),
       (<Button variant="primary" onClick={() => this.generateSummary()}>
         Regenerate Summary
       </Button>)]
      }
     
      urlparams={ () => this.generateDateRange() }

     
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


