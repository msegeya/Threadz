/**
 * User.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */

module.exports = {

  attributes: {
      firstName: 'string',
      lastName: 'string',
      phoneNumber: {
        type: 'string',
        unique: true
      },
      profilePicUrl: 'string',
      password: 'string'
  }
};

