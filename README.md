Photo Ops
=========

## Documentation valid for `master` branch


### Intro
The goal of the project is to build a simple application around Photo Ops.

### List of dependencies
* Paperclip (file attachment library for ActiveRecord)
* Testing
	* factory-bot-rails
	* shoulda-matchers

### API Endpoints
Our API will expose the following RESTful endpoints.

Endpoint | Functionality
------------ | -------------
GET /photographers | List all photographers
PUT /photos/:code/revoke | Revoke code from a photo
GET /photos/:code | Get a photo using your code
GET /photos/:code?type=large | Get a photo base in type
GET /photographers/:photographer_id/photos | List all photos from a photographer
POST /photographers/:photographer_id/photos | Create a photo

### Analysis
I decided to use request specs instead of the controller specs. 
[RSpec Release Note](http://rspec.info/blog/2016/07/rspec-3-5-has-been-released/)

I start generating the themes and stands models but we are not going to use for the endpoints. All the action is in the Photographer and Photo models.

In the spec/model, I have the model_spec where we test the relationship between the models and the validations of the fields.

I use factories to test the models. For the Photo model I decided upload an image from the fixtures instate of use a fake avatar image.

All the endpoints are tested in the requests folder and have comments and annotations. 

In the controllers/concerns I have two modules to manage all the response of the API, `json_response` and `exception_handler`.

#####Paperclip, why use this gem?
[Paperclip](https://github.com/thoughtbot/paperclip)

In my opinion, the best gem for file attachment. 
Good test documentation for validate all the fields, for the Test::Unit too.
[Module: Paperclip::Shoulda::Matchers](http://www.rubydoc.info/gems/paperclip/Paperclip/Shoulda/Matchers)
 
Currently I use the File Store in the public folder but the AWS S3 integration is so easy. 

Paperclip support Fingerprint your files. One of the requirements for Scaling. [Guides Asset Pipeline](http://guides.rubyonrails.org/asset_pipeline.html#what-is-fingerprinting-and-why-should-i-care-questionmark)

#####The multiple files per upload challenge.
The challenge here is test all the functionality, send a hash of photos with the parameters, and itearate later in the controller to create the photo related with the photographer, very similar like here [StackOverflow code](https://stackoverflow.com/questions/37063613/how-to-upload-multiple-images-using-paperclip)
But I was not so happy, so my idea for do that is use something like [dropzonejs](http://www.dropzonejs.com/) and generate diferents Ajax request for  the Post. Issue here, is going to generate multiple codes.  
[Blog explain uploads multipe Files with DropzoneJS and Paperclip](http://geekhmer.github.io/blog/2015/02/10/ruby-on-rails-uploads-multiple-files-with-dropzonejs-and-paperclip-gem/)

