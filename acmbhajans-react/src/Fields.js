import React from "react";
import { Form } from 'react-bootstrap'
// import {addDays } from 'react-datepicker'
import DatePicker from "react-datepicker";
import "react-datepicker/dist/react-datepicker.css";
import moment from 'moment'
import { getDay, addDays } from "date-fns";

import _ from 'lodash';




// https://stackoverflow.com/questions/5999998/check-if-a-variable-is-of-function-type
function isFunction(functionToCheck) {
  return functionToCheck && {}.toString.call(functionToCheck) === '[object Function]';
 }


export function generateFields (spec, key, state, setState) {
  return spec.map((details) => {
    let placeholder = details['placeholder'] ? details['placeholder'] : '';
    if (details['type'] === 'id') 
      return (<IDField 
        modelfield={key}
        value={state.forms[key].id} />);
    else if (details['type'] === 'boolean')
      return (<BooleanField
        label={details['label']}
        field={details['field']}
        state={state}
        modelfield={key}
        setState={setState} />);
    else if (details['type'] === 'date') 
      return (<DateField
        field={details['field']}
        modelfield={key}
        state={state}
        setState={setState} />)
    else if (details['type'] === 'text')
      return (<TextField
        field={details['field']}
        placeholder={placeholder}
        state={state}
        modelfield={key}
        setState={setState} />);
    else if (details['type'] === 'dropdown')
      return (<DropdownField 
        label={details['label']}
        field={details['field']}
        choices={details['choices']}
        placeholder={placeholder}
        modelfield={key}
        state={state}
        setState={setState}/>);
    else if (details['type'] === 'array') 
      return (<ArrayField 
        label={details['label']}
        field={details['field']}
        choices={details['choices']}
        placeholder={placeholder}
        modelfield={key}
        state={state}
        setState={setState}/>);
  });
}

export function IDField (props) {
  return (
  <Form.Control 
      type="text" 
      hidden={true} 
      readOnly
      value={props.value} />)
}


export function getLastWeekendDate() {
  let today = new Date();
  let dayNum = getDay(today);

  let offset;

  if (dayNum === 6)
      offset = 7;
  else if (dayNum === 7)
      offset = 6;
  else
      offset = 6 - dayNum;
  
  return addDays(today, offset-7);
}

export function DateField (props) {
  let label = props.label;
  if (!props.label) {
    label = props.field.charAt(0).toUpperCase() + props.field.slice(1)
  }

  let selectedDate = '';
  if (props.state.forms[props.modelfield][props.field]) 
    selectedDate = new Date(
      props.state.forms[props.modelfield][props.field] + " GMT-0400");
  else {
    selectedDate = getLastWeekendDate();
    props.setState({ 
      forms: {
        ...props.state.forms,
        [props.modelfield]: {
          ...props.state.forms[props.modelfield],
          [props.field]: moment(selectedDate).format("YYYY-MM-DD")
      }}})
  }
  
  
  return (
  <Form.Group>
    <Form.Label>{label}</Form.Label>
    <br />

    <DatePicker
      selected={selectedDate}
      onChange={date => {
        props.setState({ 
          forms: {
            ...props.state.forms,
            [props.modelfield]: {
              ...props.state.forms[props.modelfield],
              [props.field]: moment(date).format("YYYY-MM-DD")
          }}})}}
      filterDate={date => {
          const day = getDay(date);
          return day === 6;
        }}
      placeholderText="Select date" />
  </Form.Group>)
}


export function BooleanField (props) {
  let label = props.label;
  if (!props.label) {
    label = props.field.charAt(0).toUpperCase() + props.field.slice(1)
  }

  return (
  <Form.Group>
    <Form.Check 
      type="checkbox" 
      label={label}
      checked={props.state.forms[props.modelfield][props.field]} 
      onChange={event => 
        props.setState({ 
          forms: {
            ...props.state.forms,
            [props.modelfield]: {
              ...props.state.forms[props.modelfield],
              [props.field]: event.target.checked
            }
          }
        })}/>
  </Form.Group>)
}

export function TextField (props) {
  let label = props.label;
  if (!props.label) {
    label = props.field.charAt(0).toUpperCase() + props.field.slice(1)
  }

  console.log('Props: ', props)

  return (
  <Form.Group>
    <Form.Label>{label}</Form.Label>
    <Form.Control 
      type='text'
      value={props.state.forms[props.modelfield][props.field]}
      onChange={event => props.setState({ 
        forms: {
          ...props.state.forms,
          [props.modelfield]: {
            ...props.state.forms[props.modelfield],
            [props.field]: event.target.value 
          },
        }})}
      placeholder={props.placeholder} />
  </Form.Group>)
}


function generateChoices (props) {
  let filterBy = null;
  if (isFunction(props.filterBy)) {
    filterBy = props.filterBy();
  }

  let choices = [];
  if (filterBy != null) {
    choices = props.choices.filter(choice => filterBy.includes(choice.id));
  } else {
    if (props.choices !== undefined)
      choices = props.choices;
  }

  return _.sortBy(choices, ['name']).map(choice => <option
      key={props.label + '-' + choice.id} 
      value={choice.id}>
        {choice.name}
  </option>) 
}

export function DropdownField (props) {
  let label = props.label;
  if (!props.label) {
    label = props.field.charAt(0).toUpperCase() + props.field.slice(1)
  }

  return (
  <Form.Group>
    <Form.Label>{label}</Form.Label>
    <Form.Control 
        as="select"
        value={props.state.forms[props.modelfield][props.field]}
        onChange={event => props.setState({ 
          forms: {
            ...props.state.forms,
            [props.modelfield]: {
              ...props.state.forms[props.modelfield],
              [props.field]: event.target.value
            },
          }})}
      >
        <option value=''>None</option>
        { generateChoices(props) }
    </Form.Control>
  </Form.Group>);
}


export function findElt (element_id, choices) {
  for (let i = 0; i < choices.length; i++) {
      let choice = choices[i];
      if (element_id == choice.id) {
          return choice;
      }
  }
  return null;
}


export function findEltName (element_id, choices) {
    let elt = findElt(element_id, choices);
    if (elt === null) 
      return ''
    return elt.name;
}

export function ArrayField (props) {
  let label = props.label;
  if (!props.label) {
    label = props.field.charAt(0).toUpperCase() + props.field.slice(1)
  }
  
  let maplist = [];
  if (props.state.forms[props.modelfield][props.field] !== undefined) 
    maplist = props.state.forms[props.modelfield][props.field];
  
  let choicelist = [];
  if (props.choices !== undefined)
    choicelist = props.choices;

  return (
  <Form.Group>
    <Form.Label>{label}</Form.Label>
    {
        maplist.map((elt_id, idx) => (
        <div 
            className="ready_bhajan"
            onClick={() => {
                let new_list = props.state.forms[props.modelfield][props.field].filter((v, i, a) => i != idx);
                props.setState({
                    forms: {
                        ...props.state.forms,
                        [props.modelfield]: {
                          ...props.state.forms[props.modelfield],
                          [props.field]: new_list
                        }
                    }
                });
            }}
            key={props.field + '-' + elt_id}>
              {findEltName(elt_id, props.choices)}
            </div>
        ))
    }

    <Form.Control 
        as="select"
        onChange={(event) => {
            let new_list = props.state.forms[props.modelfield][props.field];
            new_list.push(event.target.value);
            
            props.setState({
                forms: {
                  ...props.state.forms,
                  [props.modelfield]: {
                    ...props.state.forms[props.modelfield],
                    [props.field]: new_list,
                  }
                }
            })
          }}
        >
        <option value=''>None</option>
        { 
            choicelist.map(item => (
            <option
                key={props.field + '-' + item.id} 
                value={item.id}
                readOnly>
                {item.name}
            </option>)) 
        }
    </Form.Control>
  </Form.Group>);
}

