# **Overview**

Use Exchange API version 2 to create, share, search, and manage assets and their documentation in Exchange, customize the public portal, and manage organizations. Anypoint user permissions control the available operations.

_Only the API endpoints documented here are supported. The Exchange user interface often uses other endpoints, but if those endpoints are not documented here, then they are not supported for external use, and they may change at any time. If you cannot satisfy your use case with the documented endpoints, please contact your MuleSoft representative._

### **New in Version 2**

 - Exchange API now lets you edit the **version agnostic properties** of an asset: name, description, and icon.

   Previously editing these properties required using the Exchange UI.
 - Create **any type of asset** that is supported by Exchange, including connectors, examples, templates, Mule applications, policies, and more.

   Exchange API version 1 required uploading some of these asset types as "custom" assets, and now you can upload them as their native type, such as Mule applications and policies.
 - **Request access to API Groups**.
 - **Add resources such as images to the asset documentation** and the public portal.
 - **Customize the portal** with a logo, hero image, and a favicon.
 - **Share assets** with either a user or an organization by using **identities**.

   An identity can be a master organization, external organization, or a user.


### **Assets**

Operations:

- Create assets of all types.
- Edit asset metadata.
- Delete an asset with a hard delete or a soft delete.
- Search assets by organization and other parameters including type, description, tags, asset documentation, and RAML content.
- Request API access for APIs and API Groups.
- Share assets with specific users and external organizations.
- Share assets in the public portal.
- Manage asset versioning.
- Manage asset tags.
- Manage organization applications.
- Perform other related operations.

### **Asset Documentation**

When you create an asset in Exchange, you can edit and customize the asset documentation before publishing the asset to an organization. Documentation pages can store content in multiple formats such as Markdown and HTML.

Operations:

- Edit the asset documentation in a draft mode.
- Include resources in the asset documentation.
- Create and search documentation pages.
- Create and search reviews with ratings for the asset versions.
- Publish the asset documentation.

### **Public Portal**

An organization can share APIs on a public portal so developers outside the organization can access the APIs. Exchange public portals replace what was known as a developer portal.

Operations:

- Share assets on the public portal.
- Customize the public portal:
    - Edit the customization in a draft mode.
    - Create documentation pages.
    - Add resources to the documentation pages.
    - Customize the portal with a logo, hero image, and a favicon.
    - Publish the customization for everyone.

### **Access the API**

Create an Anypoint platform account. If your organization already has an Anypoint platform account, request an invitation by email from your organization administrator.

There is no charge for using this API.

### **API Notebooks**

To test the methods that this API provides and show example responses, follow the _API Notebooks_ section.

### **See Also**

- https://docs.mulesoft.com/exchange/exchange2-faq
