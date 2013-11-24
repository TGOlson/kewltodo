describe("testy", function() {

  it("should exists", function() {

    expect(testy()).toBeDefined();

  });
});


// AJAX TESTING HELP

// I guess there are two types of tests you can do:

// Unit tests that fake the AJAX request (using Jasmine's spies), enabling you to test all of your code that runs just before the AJAX request, and just afterwards. You can even use Jasmine to fake a response from the server. These tests would be faster - and they would not need to handle asynchronous behaviour - since there isn't any real AJAX going on.
// Integration tests that perform real AJAX requests. These would need to be asynchronous.
// Jasmine can help you do both kinds of tests.

// Here is a sample of how you can fake the AJAX request, and then write a unit test to verify that the faked AJAX request was going to the correct URL:

// it("should make an AJAX request to the correct URL", function() {
//     spyOn($, "ajax");
//     getProduct(123);
//     expect($.ajax.mostRecentCall.args[0]["url"]).toEqual("/products/123");
// });

// function getProduct(id) {
//     $.ajax({
//         type: "GET",
//         url: "/products/" + id,
//         contentType: "application/json; charset=utf-8",
//         dataType: "json"
//     });
// }
// Here is a similar unit test that verifies your callback was executed, upon an AJAX request completing successfully:

// it("should execute the callback function on success", function () {
//     spyOn($, "ajax").andCallFake(function(options) {
//         options.success();
//     });
//     var callback = jasmine.createSpy();
//     getProduct(123, callback);
//     expect(callback).toHaveBeenCalled();
// });

// function getProduct(id, callback) {
//     $.ajax({
//         type: "GET",
//         url: "/products/" + id,
//         contentType: "application/json; charset=utf-8",
//         dataType: "json",
//         success: callback
//     });
// }
// Finally, you have hinted elsewhere that you might want to write integration tests that make real AJAX requests - for integration purposes. This can be done using Jasmine's asyncronous features: waits(), waitsFor() and runs():

// it("should make a real AJAX request", function () {
//     var callback = jasmine.createSpy();
//     getProduct(123, callback);
//     waitsFor(function() {
//         return callback.callCount > 0;
//     });
//     runs(function() {
//         expect(callback).toHaveBeenCalled();
//     });
// });

// function getProduct(id, callback) {
//     $.ajax({
//         type: "GET",
//         url: "data.json",
//         contentType: "application/json; charset=utf-8"
//         dataType: "json",
//         success: callback
//     });
// }