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
      amount_witness_prosecutor: {
        type: 'string',
        columnName: 'amount_witness_prosecutor'
      },
      amount_witness_accused: {
        type: 'int',
        columnName: 'amount_witness_accused'
      },
      investigate_date: {
        type: 'date',
        columnName: 'investigate_date'
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
      },
      investigatetype: {
        model: 'investigatetype'
      }
  
      
    }
  };
  
  