# modern-cv-typst

### Template Description

- Generate beautiful CV in minutes
- Written in typst, inspired by LaTeX 'moderncv' package
- Easy to modify, seconds to build
- Color theme and visual style customization

### Template Structure
- ```/src/definitions``` - template itself
- ```/src/resources``` - images, fonts, etc

### CV Structure
- ```/src/my-config.typ``` - configuration file
- ```/src/my-cv.typ``` - CV body file
- ```/target/*.pdf``` - CV pdf file

## Usage

### Docker Build

- Build Image
  
    ```bash
    docker build -t cv-builder .
    ```
    (!) First build may take some time because of cargo indexing

- #### Build CV
  
    ```
    docker run -it --rm \
    -v ./src:/opt/cv/src -v ./target:/opt/cv/target \
    -e CV_NAME=CV_John_Doe \
    cv-builder
    ```

### IDE (Optional)

- Install ```rust``` version manager:
    
    ```bash
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    rustup-init
    ```
    (!) Remove existing rust system installations if any;

- Install ```typst```: 

    ```bash
    cargo install typst-cli
    cargo install typstyle
    ```

- Install VSCode Plugins
    ```
    Tinymist Typst
    PDF Preview
    ```
- Configure VSCode Typst plugin:

  1. Set typstyle as formatter
  2. Disable on-save PDF builds 

- #### Hot reload builds:
  
    ```bash
    export TYPST_CV_NAME="CV_John_Doe" \
    typst watch \
       ./src/my-cv.typ \
    ./target/$TYPST_CV_NAME.pdf
    ```

## Troubleshooting

### Fonts

- When changing fonts and font sizes, try to adjust ```*-padding``` variables in the configuration for better results 

- If [local build](#hot-reload-builds): fonts are taken from your host OS. Run following command to see fonts installed
    ```
    typst fonts
    ```
- If [docker build](#docker-build): fonts are taken from the Docker container. Run following command to see fonts installed inside the container
    ```
    docker run -it --rm --entrypoint "typst" cv-builder fonts
    ```

# Links
- [Typst Docs](https://typst.app/docs/reference/foundations/)
- [Typst Package Repository](https://typst.app/universe/)
- [Some hacks](https://sitandr.github.io/typst-examples-book/book/typstonomicon)