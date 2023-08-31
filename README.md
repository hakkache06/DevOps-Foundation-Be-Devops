# DevOps-Foundation-Be-Devops
DevOps Foundation : Be Devops 

"DevOps Foundation: Project" is a learning initiative where you'll explore key DevOps concepts and tools. You'll start by testing applications using Docker locally. Then, you'll dive into testing with Rspec, Capybara, and Selenium. You'll also learn about Infrastructure as Code using Terraform and CI/CD automation with Jenkins. This project equips you with essential skills for modern software development and operations.

## Part 1: Local Testing with Docker

### Installing Docker
Docker is a versatile platform that facilitates running applications and their dependencies within isolated environments known as containers, compatible with almost any operating system. With Docker, the worry of compatibility with different machine setups vanishes. Everything an application requires is encapsulated within the container. This means the application behaves consistently across various systems supporting the Docker framework. Unlike traditional virtual machines, containers are lightweight, start swiftly, and offer convenience in distribution and modification, as they virtualize the operating system kernel rather than the physical hardware.

To install Docker using Homebrew, execute the following command:
```bash
brew cask install docker
```

### Crafting a Dockerfile
The journey of a Docker container image commences with the Dockerfile. Dockerfiles serve as blueprints that define the image a container will utilize upon execution. When initiating the container to run a website, Docker undertakes several tasks: reading, parsing the file, fetching the parent image designated for this specific image. Build the Docker image using the following command:
```bash
docker build --tag website .
```

### Running Docker Compose
Docker Compose offers a lightweight and straightforward platform for orchestrating multiple containerized applications within a unified stack. The tool responsible for interpreting Docker Compose manifests is none other than Docker Compose itself. Launch your applications with Docker Compose using:
```bash
docker-compose up
```

## Conclusion
- The 'FROM scratch' directive instructs Docker to start from a blank image; usually, existing images are used.
- To list all locally available Docker images, employ the command: `docker images`.
- Use the `RUN` command to execute one-off operations during the image construction process.
- When utilizing `docker-compose up`, your ports on Mac get bound, enabling interaction outside the Compose network.
- Leverage the `build:` parameter to compile Dockerfiles stored locally.
- Compose manifests are written in YAML.
- Docker Compose facilitates managing multiple containerized applications within a unified network, streamlining common Docker commands.
- The installation of Docker through `brew cask install docker` includes both the Docker client and the container-managing daemon.
- Docker containers virtualize operating system kernels, ensuring uniform runtime across host systems.
- Docker provides a virtualized operating system kernel for creating reusable application environments. Unlike containers, virtual machines emulate hardware components.

# Part 2: Testing Applications with Capybara, RSpec, and Selenium

## Testing Your Dockerized Website

Once your website is operational within a Docker container, the next step is to craft automated tests to ensure its functionality remains intact.

### Automated Tests with RSpec, Capybara, and Selenium

Incorporate the power of automated testing by combining RSpec, Capybara, and Selenium. These tools work together to streamline your testing process and ensure your application performs as expected.

#### RSpec: A Clear and Simple Testing Framework

RSpec, a testing framework rooted in Ruby, offers a readable and comprehensible syntax for crafting tests. This simplifies the process of understanding and troubleshooting tests.

#### Capybara: Interacting with Web Applications

Capybara plays a vital role in this testing ecosystem. It introduces the concept of a web driver, enabling the creation of a browser-like environment for interacting with your website. This is instrumental in testing various user interactions and workflows.

#### Selenium: Powering Real Web Browsers

Selenium serves as a web driver within Capybara. It goes a step further by simulating the behavior of a real web browser, providing an accurate representation of how users would interact with your website.

### Sample RSpec File

To illustrate, here's an example of an RSpec test using Capybara:

```ruby
require "capybara"
require 'capybara/dsl'

describe "Example Age Rendering Test" do 
    it "should display the explore logo" do
        # Your test logic using Capybara goes here
    end
end
```

Remember, RSpec forms the foundation for your tests, while Capybara and Selenium enhance the testing process by enabling realistic user interactions within a web browser.

In summary, RSpec is your trusty Ruby-based testing companion, Capybara empowers you to interact with your website as if you were a user, and Selenium brings the real browser experience to your tests. By uniting these tools, you can ensure the robustness and reliability of your web application.

Part 3: Infrastructure as Code with Terraform and Jenkins
Terraform: Building Infrastructure as Code
Terraform, a Go-based tool, empowers you to deploy diverse infrastructure into various environments seamlessly.

Building a Docker Image for Terraform
Here's an example Dockerfile for Terraform:

Dockerfile
Copy code
FROM alpine
MAINTAINER yhakkach <yassinhakkache@gmail.com>
RUN wget -O /tmp/terraform.zip https://releases.hashicorp.com/terraform/1.5.6/terraform_1.5.6_linux_amd64.zip
RUN  cd /tmp && unzip terraform.zip && mv terraform /

USER nobody
You can build the image using:

bash
Copy code
docker build --tag terraform --file terraform.dockerfile .
And run it using:

bash
Copy code
docker run --rm terraform
Adding Terraform to Docker Compose
Incorporate Terraform into Docker Compose like this:

yaml
Copy code
terraform:
    build:
      context: .
      dockerfile: terraform.dockerfile
Deploying Applications to AWS or Azure
Terraform supports multiple cloud providers like AWS and Azure, enabling the creation of diverse resources.

Starting to Write Terraform Files
Terraform resources form the fundamental building blocks of your infrastructure. Here's an example Terraform file snippet:

hcl
Copy code
data "aws_iam_policy_document" "bucket_policy" {
  statement {
    sid = "PublicReadGetObject"
    effect = "Allow"
    actions = [ "s3:GetObject" ]
    principals {
      type = "*"
      identifiers = [ "*" ]
    }
    resources = [ "arn:aws:s3:::explorecalifornia.org/*" ]
  }
}

resource "aws_s3_bucket" "website" {
  bucket = "explorecalifornia.org"
  acl    = "public-read"
  policy = "${data.aws_iam_policy_document.bucket_policy.json}"
  website {
    index_document = "index.htm"
    error_document = "error.htm"
  }
}

output "website_bucket_url" {
  value = "${aws_s3_bucket.website.website_endpoint}"
}
CI/CD as Code with Jenkins
Jenkins is a popular tool automating various stages of the software development lifecycle, from code building and testing to production deployment.
