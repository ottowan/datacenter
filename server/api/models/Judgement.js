/**
 * Accused.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */

module.exports = {
  
    connection: 'datacenterMysqlServer',
    tableName: 'judgement',
    attributes: {
      id: {
        type: 'int',
        unique: true,
        primaryKey: true,
        autoIncrement: true,
        columnName: 'id'
      },
      check_evidence_date: {
        type: 'date',
        columnName: 'check_evidence_date'
      },
      amount_witness_prosecutor_want: {
        type: 'string',
        columnName: 'amount_witness_prosecutor_want'
      },
      amount_witness_prosecutor_real: {
        type: 'int',
        columnName: 'amount_witness_prosecutor_real'
      },
      amount_witness_accused_want: {
        type: 'int',
        columnName: 'amount_witness_accused_want'
      },
      amount_witness_accused_real: {
        type: 'int',
        columnName: 'amount_witness_accused_real'
      },
      investigate_date: {
        type: 'date',
        columnName: 'investigate_date'
      },
      before_investigate_not_want: {
        type: 'int',
        columnName: 'before_investigate_not_want'
      },
      before_investigate_want: {
        type: 'int',
        columnName: 'before_investigate_want'
      },
      before_investigate_want_amount: {
        type: 'int',
        columnName: 'before_investigate_want_amount'
      },
      before_investigate_court_cancel: {
        type: 'int',
        columnName: 'before_investigate_court_cancel'
      },
      before_investigate_court_cancel_amount: {
        type: 'int',
        columnName: 'before_investigate_court_cancel_amount'
      },
      before_investigate_real_amount: {
        type: 'int',
        columnName: 'before_investigate_real_amount'
      },
      before_investigate_date: {
        type: 'date',
        columnName: 'before_investigate_date'
      },
      interpreter: {
        type: 'int',
        columnName: 'interpreter'
      },
      conference: {
        type: 'int',
        columnName: 'conference'
      },
  
      //Object data
      department: {
        model: 'department'
      },
      sector: {
        model: 'sector'
      },
      casetype: {
        model: 'casetype'
      },
      case: {
        model: 'case'
      },
      accused: {
        model: 'accused'
      },
      prosecutor: {
        model: 'prosecutor'
      },
      testimonytype: {
        model: 'testimonytype'
      }
  
      
    }
  };
  
  