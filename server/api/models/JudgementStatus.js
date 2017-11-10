/**
 * Accused.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */

module.exports = {
  
    connection: 'datacenterMysqlServer',
    tableName: 'judgementstatus',
    attributes: {
      id: {
        type: 'int',
        unique: true,
        primaryKey: true,
        autoIncrement: true,
        columnName: 'id'
      },
      end_in_first: {
        type: 'int',
        columnName: 'end_in_first'
      },
      end_in_appeal: {
        type: 'int',
        columnName: 'end_in_appeal'
      },
      end_in_supreme: {
        type: 'int',
        columnName: 'end_in_supreme'
      },
      proceed_on_first: {
        type: 'int',
        columnName: 'proceed_on_first'
      },
      proceed_on_appeal: {
        type: 'int',
        columnName: 'proceed_on_appeal'
      },
      proceed_on_supreme: {
        type: 'int',
        columnName: 'proceed_on_supreme'
      },
      first_judgement_date: {
        type: 'date',
        columnName: 'first_judgement_date'
      },
      judgement_paper_status: {
        type: 'int',
        columnName: 'judgement_paper_status'
      },
      end_by: {
        type: 'int',
        columnName: 'end_by'
      },
      judgement_penalize: {
        type: 'string',
        columnName: 'result_penalize'
      },
      judgement_dismiss_other: {
        type: 'string',
        columnName: 'judgement_dismiss_other'
      },
      claims_status: {
        type: 'int',
        columnName: 'claims_status'
      },
      claims_price: {
        type: 'double',
        columnName: 'claims_price'
      },
      comment: {
        type: 'string',
        columnName: 'comment'
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
      prosecutor: {
        model: 'prosecutor'
      },
      dismissaltype: {
        model: 'dismissaltype'
      }
      
    }
  };
  
  