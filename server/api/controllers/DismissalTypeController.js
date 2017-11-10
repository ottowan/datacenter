/**
 * DismissalTypeController
 *
 * @description :: Server-side logic for managing Dismisstypes
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

module.exports = {
    
      connection: 'datacenterMysqlServer',
      tableName: 'dismissaltype',
      attributes: {
        id: {
          type: 'int',
          unique: true,
          primaryKey: true,
          autoIncrement: true,
          columnName: 'id'
        },
        name: {
          type: 'string',
          columnName: 'name'
        }
      }
    };