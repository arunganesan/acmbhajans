import React from "react";
import { Form } from 'react-bootstrap';

export function TextField (props) {
  return (<Form.Group>
    <Form.Label>{props.label}</Form.Label>
    <Form.Control 
      type="text" 
      value={props.value} 
      onChange={props.onChange} 
      placeholder={props.placeholder} />
  </Form.Group>)
}



export function DropdownField (props) {
  return (
  <Form.Group>
    <Form.Label>{props.label}</Form.Label>
    <Form.Control 
        as="select"
        value={props.value}
        onChange={props.onChange}
      >
        <option value=''>None</option>
        {
            props.choices.map(choice => (
            <option
                key={props.label + '-' + choice.id} 
                value={choice.id}>
                  {choice.name}
            </option>)) 
        }
    </Form.Control>
  </Form.Group>);
}