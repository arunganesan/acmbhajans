import React from "react";
import { Form } from 'react-bootstrap';





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





function findEltName (element_id, choices) {
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

  return (
  <Form.Group>
    <Form.Label>{label}</Form.Label>
    {
        props.state.form[props.field].map((elt_id, idx) => (
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
            props.choices.map(item => (
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