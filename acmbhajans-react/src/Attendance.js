import React from "react";
import { 
    Button,
    Col, 
    Container, 
    Row,
    ToggleButton,
    ToggleButtonGroup } from 'react-bootstrap'
import { AutoSizer, MultiGrid } from 'react-virtualized'
import _ from 'lodash'
import { URLBASE } from './Config'
import { MdDone, MdClear } from 'react-icons/md'

export class Attendance extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            event: 'satsang',
            attendance_summary: {},

            localchanges: {},
            sortedDates: [],
            sortedPeople: [],
            overscanColumnCount: 0,
            overscanRowCount: 10,
            rowHeight: 40,
            tableHeight: 1000,
        };


        this._cellRenderer = this._cellRenderer.bind(this);
        this._getColumnWidth = this._getColumnWidth.bind(this);
        this._getRowClassName = this._getRowClassName.bind(this);
        this._noContentRenderer = this._noContentRenderer.bind(this);
        this._getRowHeight = this._getRowHeight.bind(this);
    }
   
    componentDidMount() {
        this.fetchSummaryTable();
    }

    componentWillUnmount() {
        
    }

    fetchSummaryTable() {
        let loadUrl = `${URLBASE()}/request/attendance?event=${this.state.event}`; 
        fetch(loadUrl)
        .then(res => res.json())
        .then(data => {
            // Create indexes

            let dates = _.sortBy(_.keys(data.attendance_summary)) 
            dates = _.reverse(dates);

            let people = [];
            for (let _people of _.values(data.attendance_summary))  {
                people = people.concat(_.keys(_people))
            }
            
            let uniqPeople = _.sortBy(_.uniq(people));

            let updateFunc = () => {
                console.log('Updating grid');
                this.list.forceUpdateGrids()}

            console.log(dates, uniqPeople)
            this.setState({
                attendance_summary: data.attendance_summary,
                sortedDates: dates,
                sortedPeople: uniqPeople,
            }, updateFunc)

            setTimeout(updateFunc, 500);
        });
    }


    handleChange (e) {
        this.setState({ event: e }, () => this.fetchSummaryTable())
    }


    _getRowClassName(row) {
        // return row % 2 === 0 ? "evenRow" : "oddRow";
        return '';
    }


    changeAttendance(dateStr, peopleStr) {
        let newValue = '';
        
        if (
            !_.has(this.state.attendance_summary, dateStr) 
            || !_.has(this.state.attendance_summary[dateStr], peopleStr)
            || this.state.attendance_summary[dateStr][peopleStr] === null
            || this.state.attendance_summary[dateStr][peopleStr] === '') {
            newValue = true;
        } else if (this.state.attendance_summary[dateStr][peopleStr] === true) {
            newValue = false;
        } else if (this.state.attendance_summary[dateStr][peopleStr] === false) {
            newValue = '';
        }

        let changes = this.state.localchanges;
        let attendance = this.state.attendance_summary;
        attendance[dateStr][peopleStr] = newValue;

        if (!_.has(changes, dateStr))
            changes[dateStr] = {};
        
        let keystr = `attended_${this.state.event}`;
        if (!_.has(changes[dateStr], peopleStr)) 
            changes[dateStr][peopleStr] = {}
        
        
        changes[dateStr][peopleStr][keystr] = newValue;
        
        let updateFunc = () => {
            console.log('Updating grid');
            this.list.forceUpdateGrids()}


        this.setState({
            localchanges: changes,
            attendance_summary: attendance,
        }, updateFunc);
    }
      
    _cellRenderer({columnIndex, key, rowIndex, style}) {
        let rowClassName = this._getRowClassName(rowIndex);
        if (columnIndex === 0 && rowIndex === 0)  {
            if (this.state.sortedDates.length === 0) return null;
            else return <div className={`cell`} style={style}></div>
        }

        let dateStr = this.state.sortedDates[columnIndex - 1];
        let peopleStr = this.state.sortedPeople[rowIndex - 1];
        
        if (rowIndex === 0) {
            return <div className="cell topRow" style={style}>{this.state.sortedDates[columnIndex-1]}</div>;
        } else if (columnIndex === 0) {
            return <div className="cell leftRow" style={style}>{this.state.sortedPeople[rowIndex-1]}</div>;
        } else {
            let classNames = `cell attendance-cell ${rowClassName} `   
            let content = ''

            // console.log(dateStr, peopleStr, this.state.attendance_summary[dateStr][peopleStr])
            if (_.has(this.state.attendance_summary, dateStr) && _.has(this.state.attendance_summary[dateStr], peopleStr)) {
                if (this.state.attendance_summary[dateStr][peopleStr] === true) {
                    classNames += ' summary-attended'
                    content = <MdDone />
                }
                else if (this.state.attendance_summary[dateStr][peopleStr] === false) {
                    classNames += ' summary-not-attended'
                    content = <MdClear />
                }
            }
            
            return <div 
                onClick={() => this.changeAttendance(dateStr, peopleStr) }
                className={classNames} style={style}>{content}</div>;
        }
    }

    _noContentRenderer() {
        return null; //<div className="noCells">No cells</div>;
      }    


    _getRowHeight({index}) {
        switch (index) {
            default:
              return 80;
          }
      }
    _getColumnWidth({index}) {
        switch (index) {
          case 0:
            return 250;
          default:
            return 125;
        }
      }

    generateSummary() {
        fetch(`${URLBASE()}/renditions/generate_summary`)
        .then(() => alert('Generated summary'));
    }


    saveAttendance() {
        let loadUrl = `${URLBASE()}/request/attendance`; 
        fetch(loadUrl, {
            method: 'POST', mode: 'cors', cache: 'no-cache',
            headers: { 'Content-type': 'application/json' },
            body: JSON.stringify({
                changes: this.state.localchanges
            })})
            .then(response => {
                console.log('Got response');
                this.fetchSummaryTable();
            })
    }

    render() {
        return (
        <Container>
            <Row>
                <Col>
                    <ToggleButtonGroup 
                        type="radio" 
                        name="options"
                        defaultValue='practice'
                        value={this.state.event} 
                        onChange={(e) => this.handleChange(e)}>
                        <ToggleButton variant="outline-primary" value='practice'>Practice</ToggleButton>
                        <ToggleButton variant="outline-primary" value='satsang'>Satsang</ToggleButton>
                    </ToggleButtonGroup>
                </Col>
                <Col>
                <Button variant="primary" onClick={() => this.generateSummary()}>
                    Regenerate Summary
                </Button>
                </Col>

                <Col>
                <Button variant="primary" disabled={_.keys(this.state.localchanges).length === 0} onClick={() => this.saveAttendance()}>
                    Save local changes
                </Button>
                </Col>
            </Row>

            <Row>
            <AutoSizer disableHeight>
            {({width}) => (
                <MultiGrid
                    fixedColumnCount={1}
                    fixedRowCount={1}
                    ref={ref => { this.list = ref }}
                    cellRenderer={this._cellRenderer}
                
                classNameBottomLeftGrid="BodyGrid namesGrid"
                classNameBottomRightGrid="BodyGrid"
                classNameTopLeftGrid="BodyGrid topLeftGrid"
                classNameTopRightGrid="BodyGrid datesGrid"
                

                columnWidth={this._getColumnWidth}
                rowHeight={this._getRowHeight}
                
                columnCount={this.state.sortedDates.length+1}
                rowCount={this.state.sortedPeople.length+1}

                height={this.state.tableHeight}
                noContentRenderer={this._noContentRenderer}
                overscanColumnCount={this.state.overscanColumnCount}
                overscanRowCount={this.state.overscanRowCount}
                
                width={width}
                />
            )}
            </AutoSizer>

            </Row>
        </Container>);
    }
}