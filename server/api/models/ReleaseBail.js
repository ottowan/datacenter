/**
 * AcquitBail.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */

module.exports = {

  connection: 'datacenterMysqlServer',
  tableName: 'release_bail',
  attributes: {
    id: {
      type: 'int',
      unique: true,
      primaryKey: true,
      autoIncrement: true,
      columnName: 'id'
    },
    first_injunction: {
      type: 'int',
      columnName: 'first_injunction'
    },
    appeal_injunction: {
      type: 'int',
      columnName: 'appeal_injunction'
    },
    supreme_injunction: {
      type: 'int',
      columnName: 'supreme_injunction'
    },
    accused_escape: {
      type: 'int',
      columnName: 'accused_escape'
    },
    time: {
      type: 'int',
      columnName: 'time'
    },
    bail_price: {
      type: 'double',
      columnName: 'bail_price'
    },
    release: {
      model: 'release'
    },
    bailtype: {
      model: 'bailtype'
    },
  }
};

