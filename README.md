# Welcome to RubyStand

RubyStand is a simple gallery app written in Ruby on Rails 3.1

## Getting Started

RubyStand is build on the following:

* database free
* relies on plain image files on the disk
* defines albums as sets of images
* each album can have title, year and a description
* expects thumbnails along with normal files (will be automated in future versions)
* can read basic metadata about albums and photos from YAML files

## Installation

Note that asset pipelining is NOT used.
Simply install by `bundle install`


## Configuration
Make sure you put all of your albums (as directories) into `public/data` (there's a set of sample albums under `data` if you need some inspiration)
Each album directory has to have 'thumb' directory with image thumbnails (thumbnail creation will be automatic in future versions)
Thumbnail file names should match photo file names

## Metadata
You can create a file called 'album.yml' in the album directory witht the following content:

    title: Point Lobos
    description: Point Lobos Park in Northern California
    year: 2006

    photos:
     _DSC0578.jpg:
      title: Alone on the hill
     _DSC0591.jpg:
      title: Cliffs meet ocean

Note that the 'photos' section is optional.
The name of the photo under `photos` should match the file name on the disk.

## Roadmap

* 1.2: Refactor all hardcoded paths and options into a gallery-wide YAML config file
* 1.3: Add a way (via `rake` or automated) to generate thumbnails
* 1.4: Add modern looking frames and resize properly the photo windows and thumbnail section