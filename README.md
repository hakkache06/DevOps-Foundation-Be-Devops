
# DevOps Foundation: Be DevOps

**"DevOps Foundation: Project"** is an educational initiative where you'll delve into critical DevOps concepts and tools. This journey begins by exploring local application testing with Docker. Subsequently, you'll venture into automated testing with RSpec, Capybara, and Selenium. Moreover, the project covers Infrastructure as Code using Terraform and CI/CD automation through Jenkins. By engaging in this project, you'll acquire essential skills for modern software development and operations.

## Part 1: Local Testing with Docker

### Installing Docker

Docker, a versatile platform, empowers you to run applications along with their dependencies in isolated environments called containers. Compatible with nearly any operating system, Docker eliminates concerns about compatibility with different machine configurations. Each application's requirements are encapsulated within the container, ensuring consistent behavior across diverse systems. Unlike conventional virtual machines, containers are lightweight, fast to start, and facilitate easy distribution and modification, as they virtualize the operating system kernel rather than the physical hardware.

To install Docker using Homebrew, execute the following command:
```bash
brew cask install docker
```

### Crafting a Dockerfile

The journey of a Docker container image begins with the Dockerfile, which serves as a blueprint defining the image a container will utilize upon execution. When you initiate the container to run a website, Docker performs several tasks, including reading and parsing the file, as well as fetching the designated parent image. To build the Docker image, use the following command:
```bash
docker build --tag website .
```

### Running Docker Compose

Docker Compose simplifies orchestrating multiple containerized applications within a unified stack. The tool responsible for interpreting Docker Compose manifests is Docker Compose itself. Launch your applications with Docker Compose using:
```bash
docker-compose up
```

### Conclusion

Here are some key takeaways from this section:
- The 'FROM scratch' directive instructs Docker to start from a blank image; existing images are usually preferred.
- To list all locally available Docker images, use the command: `docker images`.
- Utilize the `RUN` command for one-off operations during image construction.
- When using `docker-compose up`, ports on Mac get bound for interaction outside the Compose network.
- Employ the `build:` parameter to compile locally stored Dockerfiles.
- Compose manifests are written in YAML.
- Docker Compose simplifies managing multiple containerized applications within a unified network, streamlining common Docker commands.
- The installation of Docker through `brew cask install docker` includes both the Docker client and the container-managing daemon.
- Docker containers virtualize operating system kernels, ensuring consistent runtime across host systems.
- Docker provides a virtualized operating system kernel for creating reusable application environments. In contrast, virtual machines emulate hardware components.

## Part 2: Testing Applications with Capybara, RSpec, and Selenium

### Testing Your Dockerized Website

After successfully deploying your website within a Docker container, the subsequent step involves creating automated tests to verify its continued functionality.

### Automated Tests with RSpec, Capybara, and Selenium

Harness the power of automated testing by leveraging RSpec, Capybara, and Selenium in synergy. These tools collectively streamline the testing process, ensuring your application performs as expected.

#### RSpec: A Clear and Simple Testing Framework

RSpec, built upon Ruby, offers a comprehensible syntax for constructing tests. This simplifies both understanding and troubleshooting.

#### Capybara: Interaction with Web Applications

Capybara plays a crucial role by introducing the concept of a web driver. This enables the emulation of a browser-like environment for interacting with your website. Such capability is instrumental in testing various user interactions and workflows.

#### Selenium: Empowering Real Web Browsers

Selenium acts as a web driver within Capybara, taking it a step further by emulating real web browser behavior. This affords an accurate representation of user interactions.

### Sample RSpec File

Here's a glimpse of an RSpec test using Capybara:

```ruby
require "capybara"
require 'capybara/dsl'

describe "Example Age Rendering Test" do 
    it "should display the explore logo" do
        # Your test logic using Capybara goes here
    end
end
```

In essence, RSpec forms the core of your tests, while Capybara and Selenium elevate the testing process through realistic user interactions within a web browser.

To sum up, RSpec acts as your reliable testing companion, Capybara empowers you to interact with your website as an end user, and Selenium replicates the true browser experience in your tests. Through this integration, you ensure the robustness and reliability of your web application.

## Part 3: Infrastructure as Code with Terraform and Jenkins

### Terraform: Building Infrastructure as Code

Terraform, a Go-based tool, empowers you to deploy diverse infrastructure into various environments seamlessly.

#### Building a Docker Image for Terraform

Here's an example Dockerfile for Terraform:

```Dockerfile
FROM alpine
MAINTAINER yhakkach <yassinhakkache@gmail.com>
RUN wget -O /tmp/terraform.zip https://releases.hashicorp.com/terraform/1.5.6/terraform_1.5.6_linux_amd64.zip
RUN  cd /tmp && unzip terraform.zip && mv terraform /

USER nobody
```

You can build the image using:
```bash
docker build --tag terraform --file terraform.dockerfile .
```

And run it using:
```bash
docker run --rm terraform
```

#### Adding Terraform to Docker Compose

Incorporate Terraform into Docker Compose like this:

```yaml
terraform:
    build:
      context: .
      dockerfile: terraform.dockerfile
```

### Deploying Applications to AWS or Azure

Terraform supports multiple cloud providers like AWS and Azure, enabling the creation of diverse resources.

#### Starting to Write Terraform Files

Terraform resources form the fundamental building blocks of your infrastructure. Here's an example Terraform file snippet:

```hcl
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
```

### CI/CD as Code with Jenkins

Jenkins is a popular tool automating various stages of the software development lifecycle, from code building and testing to production deployment.

