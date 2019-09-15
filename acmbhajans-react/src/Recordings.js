import React from "react";
import { 
    Button,
    Container,
    Col,
    Row,
    ToggleButton,
    ToggleButtonGroup
} from 'react-bootstrap'
import DatePicker from "react-datepicker";
import _ from 'lodash'
import moment from 'moment'

import { URLBASE } from './Config'

import "react-datepicker/dist/react-datepicker.css";
import { getDay, addDays, subDays }  from "date-fns";
import { findElt, findEltName, getLastWeekendDate } from './Fields'
import { AutoSizer, Grid } from 'react-virtualized'


export class Recordings extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            chosenWeek: getLastWeekendDate(),
            renditions: [],
            bhajans: [],
            people: [],
            ready_list: {},
            recordingType: 'weekly',

            overscanColumnCount: 0,
            overscanRowCount: 10,
            rowHeight: 40,
            columnCount: 5,
        };


        this._cellRenderer = this._cellRenderer.bind(this);
        this._getColumnWidth = this._getColumnWidth.bind(this);
        this._getRowClassName = this._getRowClassName.bind(this);
        this._noContentRenderer = this._noContentRenderer.bind(this);
        this._getRowHeight = this._getRowHeight.bind(this);
    }
   
    loadByPerson () {
        let loadUrl = `${URLBASE()}/renditions/edit`
        loadUrl += '?person_id=' + this.props.personId;
        return loadUrl;
    }

    loadByDate () {
        let loadUrl = `${URLBASE()}/renditions/edit`
        let dateStr = moment(this.state.chosenWeek).format('YYYY-MM-DD');;
        loadUrl += `?from=${dateStr}&to=${dateStr}`;
        return loadUrl;
    }
    
    fetchRequest() {
        let loadUrl = (this.state.recordingType === 'mine') 
            ? this.loadByPerson()
            : this.loadByDate();
        

        fetch(loadUrl)
        .then(res => res.json())
        .then(data => {
            this.setState({
              ...data,
            }, () => { this.list && this.list.forceUpdate && this.list.forceUpdate() });
        });
    }

    componentDidMount() {
        this.fetchRequest();
    }

    componentWillUnmount() {
        
    }

    _getRowClassName(row) {
        return row % 2 === 0 ? "evenRow" : "oddRow";
    }
      
      
    _cellRenderer({columnIndex, key, rowIndex, style}) {
        let rowClassName = this._getRowClassName(rowIndex);
        
        if (rowIndex === 0) {
            let header = ''

            switch (columnIndex) {
                case 0:
                    header = 'Date'
                    break
                case 1:
                    header = 'Lead(s)'
                    break
                case 2:
                    header = 'Order'
                    break
                case 3:
                    header = 'Bhajan'
                    break
                case 4:
                    header = 'URL'
                    break
                default:
                    header = '.'
            }
            
            return <div className="cell top-next-week-row" style={style}>{header}</div>;
        } else {
            let firstColumnClass = 'next-week-first-column';
            let content = ''
            let rendition = this.state.renditions[rowIndex-1];

            switch (columnIndex) {
                case 0:
                    content = rendition.weekend;
                    break;
                case 1:
                    let lead_list = this.state.lead_list[rendition.id];
                    let people_list = lead_list.map( pid => findEltName(pid, this.state.people));
                    content = _.join(people_list, ', ')
                    break
                case 2:
                    content = rendition.order;
                    content = content == 0 ? 'Practice' : content;
                    break
                case 3:
                    let bhajan = findElt(rendition.bhajan_id, this.state.bhajans)
                    if (bhajan !== null) 
                        content = bhajan.name;
                    break;
                case 4:
                    content = ''
                    if (rendition.recording_url !== '' && rendition.recording_url !== undefined && rendition.recording_url !== null)
                        content = (<a target='_blank' rel='noopener noreferrer' href={rendition.recording_url}>Link</a>)
                    break
                default:
                    content = '.'
            }
            
            return <div className={`cell ${rowClassName} ` + (columnIndex === 0 ? firstColumnClass : '')} style={style}>{content}</div>;
        }
    }

    _noContentRenderer() {
        return null; //<div className="noCells">No cells</div>;
      }    


    _getRowHeight({index}) {
        switch (index) {
            default:
              return 50;
          }
      }


    _getColumnWidth({index}) {
        switch (index) {
            case 1:
        case 3:
            return 200;
            default:
            return 125;
        }
    }



    setRecordingsType(recType) {
        this.setState({ 
            recordingType: recType
        }, () => this.fetchRequest())
    }

    render() {
        return (<Container><Row>
            <Col className='recordings-input-col' lg={{span: 3}}>
                <ToggleButtonGroup 
                    vertical
                    type="radio" 
                    name="options"
                    defaultValue='weekly'
                    value={this.state.recordingType} 
                    onChange={(e) => this.setRecordingsType(e)}>
                
                <ToggleButton disabled={this.props.personId == null} variant='outline-primary' value='mine'>My Recordings</ToggleButton>
                <ToggleButton variant='outline-primary' value='weekly'>Weekly Recordings</ToggleButton>
                </ToggleButtonGroup>

                { this.state.recordingType === 'weekly' &&
                <DatePicker
                    inline
                    className='recordings-calendar'
                    selected={this.state.chosenWeek}
                    onChange={date => {
                        this.setState({ 
                            chosenWeek: date 
                        }, () => this.fetchRequest());
                    }}
                    filterDate={date => getDay(date) === 6}
                /> }
                
            </Col>

            <Col lg={{span: 9}}>
            <AutoSizer disableHeight>
            {({width}) => (
                <Grid
                    fixedColumnCount={1}
                    fixedRowCount={1}
                    ref={ref => { this.list = ref }}
                    cellRenderer={this._cellRenderer}
                    className="nextweek-table"
                    columnWidth={this._getColumnWidth}
                    rowHeight={this._getRowHeight}
                    columnCount={this.state.columnCount}
                    rowCount={this.state.renditions.length+1}
                    height={1000}
                    noContentRenderer={this._noContentRenderer}
                    overscanColumnCount={this.state.overscanColumnCount}
                    overscanRowCount={this.state.overscanRowCount}
                    width={width}
                    autoContainerWidth={true}
                />
            )}
            </AutoSizer>
            </Col>
        </Row></Container>);
    }
}
