<!DOCTYPE>
<html>

    <head>

        <title>MetaPiano</title>

        <link rel="stylesheet" type='text/css' href="/css/bootstrap.min.css"/>
        <link rel="stylesheet" type='text/css' href="/css/main.css"/>

        <%block name="scripts" />

    </head>

    <body>
        <div class='container'>


            <div id='header'>

                <div class='row'>
                    <div class='col-sm-4'>
                        <h3>Meta-Piano Extendido</h3>
                    </div>

                    <div class='col-sm-6'>
                    </div>

                    <div class='col-sm-2'>
                        ${self.translatelink()}
                    </div>

                </div>

                <div class='row'>

                    <div class='col-sm-4'>
                    </div>

                    <div id='navbar' class='row col-sm-8'>

                        <div class='col-sm-2'>
                            <strong>
                                ${self.homelink()}
                            </strong>
                        </div>
                        <div class='col-sm-2'>
                            <strong>
                                ${self.creatorslink()}
                            </strong>
                        </div>
                        <div class='col-sm-2'>
                            <strong>
                                ${self.listenlink()}
                            </strong>
                        </div>
                        <div class='col-sm-2'>
                            <strong>
                                ${self.poemslink()}
                            </strong>
                        </div>
                        <div class='col-sm-2'>
                            <strong>
                                ${self.gallerylink()}
                            </strong>
                        </div>
                        <div class='col-sm-2'>
                            <strong>
                                ${self.documentslink()}
                            </strong>
                        </div>

                    </div>

                </div>

            </div>

            ${self.body()}

            <footer>

                <div class='row'>
                    <div class='col-sm-5'>
                    </div>
                    <div class='col-sm-2'>
                        <span class='contact'>
                            <h4>
                                <a href='mailto:infometapiano@gmail.com'>contact</a>
                            </h4>
                        </span>
                    </div>
                    <div class='col-sm-5'>
                </div>

            </footer>

        </div>
    </body>
</html>
