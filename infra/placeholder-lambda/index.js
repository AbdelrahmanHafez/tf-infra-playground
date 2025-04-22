exports.handler = function(event, context) {
  console.log("Event: ", JSON.stringify(event, null, 2));
  console.log("Context: ", JSON.stringify(context, null, 2));
  throw new Error('Not implemented');
}