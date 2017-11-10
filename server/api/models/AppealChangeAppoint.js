/**
 * AppealChanngeAppoint.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */

module.exports = {
  
    connection: 'datacenterMysqlServer',
    tableName: 'appeal_change_appoint',
    attributes: {
      id: {
        type: 'int',
        unique: true,
        primaryKey: true,
        autoIncrement: true,
        columnName: 'id'
      },
      no: {
        type: 'int',
        columnName: 'no'
      },
      status: {
        type: 'int',
        columnName: 'status'
      },
      date: {
        type: 'date',
        columnName: 'date'
      },
      comment: {
        type: 'string',
        columnName: 'comment'
      },
  
      //Object data
      case: {
        model: 'case'
      },
      appeal: {
        model: 'appeal'
      },
      changeappointtype: {
        model: 'changeappointtype'
      }
  
      
    }
  };
