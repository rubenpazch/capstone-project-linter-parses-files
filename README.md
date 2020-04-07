<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/rubenpazch/capstone-project-linter-parses-files">
    <img src="img/logo.png" alt="Logo" width="80" height="80">
  </a>

  <h2 align="center">SASS Linter</h2>

  <h3 align="center">Ruby Capstone Project --> Build your own linter<h3>
  <p align="center">
    <a href="https://github.com/rubenpazch/capstone-project-linter-parses-files"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    -
    <a href="https://github.com/rubenpazch/capstone-project-linter-parses-files">Report Bug</a>
    -
    <a href="https://github.com/rubenpazch/capstone-project-linter-parses-files">Request Feature</a>
    -
  </p>
</p>

<!-- TABLE OF CONTENTS -->
## Table of Contents

* [Project specifications](#project-specifications)
* [Whats is included on this project](#whats-is-included-on-this-project)
* [Rules](#rules)
* [Instructions](#instructions)
* [Testing with RSpec](#testing-with-rspec)
* [Link to assignment](#link-to-assignment)
* [Built With](#built-with)
* [Screenshot](#screenshot)
* [Live Demo](#live-demo)
* [Project structure](#project-structure)
* [Video Presentation of the project](#video-presentation-of-the-project)
* [Authors](#authors)
* [Acknowledgements](#acknowledgements)
* [Contributing](#-Contributing)
* [License](#license)


## Project specifications

Capstone project for creating your own linter, it is required for this project to build your own linter developed with Ruby, for this project is required to check for warnings and errors on SASS files.



## Whats is included on this project

This project includes the next parts:

+ SASS linter validations
	+ Comment white space inside after
	+ Comment white space inside before
	+ Unexpected missing end of source newline
	+ Expected empty line before comment
	+ Expected indentation of zero spaces

+ RSpec test cases


## Rules

Comment white space inside after

Bad code: 
```CSS
/*comment */
```
Good code:
```CSS
/* comment */
```

Comment white space inside before

Bad code: 
```CSS
/* comment*/
```
Good code:
```CSS
/* comment */
```

Unexpected missing end of source newline

Bad code: 
```CSS
/* comment */
```
Good code:
```CSS
/* comment */

```

Expected empty line before comment

Bad code: 
```CSS
/* comment */
/* comment */
```
Good code:
```CSS
/* comment */

/* comment */
```

Expected indentation of zero spaces

Bad code: 
```CSS
       /* comment*/
```
Good code:
```CSS
/* comment */
```



## Instructions

The **_SASS Linter_** does basic syntax checking, as well as applying a set of rules to the code and throws back an error if bad syntax is found.
The throwback error is being printed out indicating the line and column of the specific syntax issue.

To test out **SASS Linter** you need to:
* have **Ruby** installed on your computer
* [download](https://github.com/rubenpazch/capstone-project-linter-parses-files/tree/check_file) or clone this repo:
  - Clone with SSH:
  ```
  git@github.com:rubenpazch/capstone-project-linter-parses-files.git
  ```
  - Clone with HTTPS:
  ```
  https://github.com/rubenpazch/capstone-project-linter-parses-files.git
  ```

* Navigate to root directory of the repo and run on windows:
```
$ ruby ./bin/main path_to_file.scss (path_to_file being the file you want to check for linters)
```

* Navigate to root directory of the repo and run on ubuntu:
```
$ main path_to_file.scss (path_to_file being the file you want to check for linters)
```

![Screenshot](./img/app_screenshot.png)




## Testing with RSpec 

To run the test cases with RSpec we have to follow this steps:

installing RSpec

    gem install rspec

Once that’s done, you can verify your version of RSpec with, for this project we had used the version 3.9 

    rspec --version

finally run for watch the results

    rspec



## Link to assignment

the assignment can be found  [here](https://www.notion.so/microverse/Build-your-own-linter-b17a3c22f7b940c98ca1980250720769).



## Built With

Concepts used on this project

- Ruby
- SASS
- OOP 
- Modules 

Tools used on this project

- Stickler CI
- Visual Studio Code- 
- Rubocop



## Screenshot

![screenshot](./img/app_screenshot.png)



## Live Demo

You can see the [live preview](#)



## Project structure

For this project we have the next structure.

+ bin
	+ main
+ img
+ lib
	+ modules
+ spec



## Video Presentation of the project

You can see the loom presentation on the next link [here](https://www.loom.com/share/1705cb9cd0c747e4aa8a86cc7ed38adb).


## Authors

👤 **Ruben Paz Chuspe**

- Github: [@rubenpazch](https://github.com/rubenpazch)
- Linkedin: [rubenpch](https://www.linkedin.com/in/rubenpch/)



## Contributing

This is an education project as a part of the Microverse so contributing is not accepted. 

Contributions, issues and feature requests are welcome!

Feel free to check the [issues](https://github.com/rubenpazch/capstone-conference-page/issues).



## Show your support

Give a ⭐️ if you like this project!



## Acknowledgements

+ [Microverse](https://www.microverse.org/).
+ [Github](http://github.com/).
+ [Fontawesome](http://fontawesome.com/).
+ [The Odin Project](theodinproject.com/).



## License

This project is [MIT](lic.url) licensed.


