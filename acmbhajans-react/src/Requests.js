import React from "react";
import 'react-virtualized/styles.css'
import 'bootstrap/dist/css/bootstrap.css'

import { generateFields, findEltName } from './Fields.js'
import { ModelEditor } from './ModelEditor'

import { Form } from 'react-bootstrap'
import DatePicker from "react-datepicker";
import "react-datepicker/dist/react-datepicker.css";
import moment from 'moment'
import { getDay, addDays, subDays }  from "date-fns";
import { URLBASE } from './Config'

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
    this.child = React.createRef();

    this.state = {
        
        forms: {
          'requests': initForms['requests']()
        },

        requests: [],
        bhajans: [],
        people: [],

        fromDate: subDays(new Date(), 27),
        toDate: addDays(new Date(), 7),
    }}

    
  renderForm () {
    let key = 'requests';
    let spec = [
                { 'type': 'id'},
                { 'type': 'date', 'field': 'weekend'},
                { 'type': 'dropdown', 'label': 'Person', 'field': 'person_id', 'choices': this.state.people},
                { 'type': 'boolean', 'label': 'Will attend practice', 'field': 'will_attend_practice'},
                { 'type': 'boolean', 'label': 'Attended practice', 'field': 'attended_practice'},
                { 'type': 'dropdown', 'label': 'Practice Request', 'field': 'practice_request_id', 'choices': this.state.bhajans},
                { 'type': 'text', 'label': 'Note for practice bhajan', field: 'practice_note'},
                { 'type': 'boolean', 'label': 'Will attend Satsang', 'field': 'will_attend_satsang'},
                { 'type': 'boolean', 'label': 'Attended satsang', 'field': 'attended_satsang'},
                { 
                  'type': 'dropdown', 
                  'label': 'Satsang Request', 
                  'field': 'satsang_request_id', 
                  'choices': this.state.bhajans, 
                  'filterBy':() => this.state.ready_list[this.state.forms['requests'].person_id]
                },
                { 'type': 'text', 'label': 'Note for satsang bhajan', field: 'satsang_note'},
            ];
        
    return generateFields(spec, key, this.state, (s) => { this.setState(s) });
  }


  render() {
    return (
    <ModelEditor
      ref={this.child}
      initForms={initForms}
      pageName="Request"
      editForm={this.renderForm()}
      URL={`${URLBASE()}/request/edit`}
      populateForm={(datum, currState) => {}}

      additionalButtons={
         [(<Form.Group>
            <Form.Label>From</Form.Label>
            <DatePicker
              selected={this.state.fromDate}
              onChange={date =>  this.setState({ fromDate: date }, () => this.child.current.fetchNewData())}
              filterDate={date => getDay(date) === 6}
              />
          </Form.Group>),
          (<Form.Group>
          <Form.Label>To</Form.Label>
          <DatePicker
            selected={this.state.toDate}
            onChange={date =>  this.setState({ toDate: date }, () => this.child.current.fetchNewData())}
            filterDate={date => getDay(date) === 6}
            />
        </Form.Group>)]
      }


      urlparams={() => {
        let fromStr = moment(this.state.fromDate).format("YYYY-MM-DD");
        let toStr = moment(this.state.toDate).format("YYYY-MM-DD");
        return `?from=${fromStr}&to=${toStr}`;
      }}


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


