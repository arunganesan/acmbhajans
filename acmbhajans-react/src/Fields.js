import React from "react";
import { Form } from 'react-bootstrap'
// import {addDays } from 'react-datepicker'
import DatePicker from "react-datepicker";
import "react-datepicker/dist/react-datepicker.css";
import moment from 'moment'
import getDay from "date-fns/getDay";



// https://stackoverflow.com/questions/5999998/check-if-a-variable-is-of-function-type
function isFunction(functionToCheck) {
  return functionToCheck && {}.toString.call(functionToCheck) === '[object Function]';
 }


export function IDField (props) {
  return (
  <Form.Control 
      type="text" 
      hidden={true} 
      readOnly
      value={props.value} />)
}

export function DateField (props) {
  let label = props.label;
  if (!props.label) {
    label = props.field.charAt(0).toUpperCase() + props.field.slice(1)
  }

  let selectedDate = '';
  if (props.state.form[props.field]) 
    selectedDate = new Date(
      props.state.form[props.field] + " GMT-0400");
    
  return (
  <Form.Group>
    <Form.Label>{label}</Form.Label>
    <br />

    <DatePicker
      selected={selectedDate}
      onChange={date => {
        props.setState({ 
          form: {
            ...props.state.form,
            [props.field]: moment(date).format("YYYY-MM-DD")
          }})}}
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
      checked={props.state.form[props.field]} 
      onChange={event => 
        props.setState({ 
        form: {
          ...props.state.form,
          [props.field]: event.target.checked
        }})}/>
  </Form.Group>)
}

export function TextField (props) {
  let label = props.label;
  if (!props.label) {
    label = props.field.charAt(0).toUpperCase() + props.field.slice(1)
  }

  return (
  <Form.Group>
    <Form.Label>{label}</Form.Label>
    <Form.Control 
      type="text" 
      value={props.state.form[props.field]} 
      onChange={event => props.setState({ 
        form: {
          ...props.state.form,
          [props.field]: event.target.value
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

  return choices.map(choice => <option
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
        value={props.state.form[props.field]}
        onChange={event => props.setState({ 
          form: {
            ...props.state.form,
            [props.field]: event.target.value
          }})}
      >
        <option value=''>None</option>
        { generateChoices(props) }
    </Form.Control>
  </Form.Group>);
}





export function findEltName (element_id, choices) {
    for (let i = 0; i < choices.length; i++) {
        let choice = choices[i];
        if (element_id == choice.id) {
            return choice.name;
        }
    }

    return 'Error - ID not found'
}

export function ArrayField (props) {
  let label = props.label;
  if (!props.label) {
    label = props.field.charAt(0).toUpperCase() + props.field.slice(1)
  }
  
  let maplist = [];
  if (props.state.form[props.field] !== undefined) 
    maplist = props.state.form[props.field];
  
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
                let new_list = props.state.form[props.field].filter((v, i, a) => i != idx);
                props.setState({
                    form: {
                        ...props.state.form,
                        [props.field]: new_list
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
            let new_list = props.state.form[props.field];
            new_list.push(event.target.value);
            
            props.setState({
                form: {
                    ...props.state.form,
                    [props.field]: new_list,
                }
            })}}
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