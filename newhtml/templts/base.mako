<!DOCTYPE>
<html>

    <head>

        <title>MetaPiano</title>

        <link rel="stylesheet" type='text/css' href="css/bootstrap.min.css"/>
        <link rel="stylesheet" type='text/css' href="css/main.css"/>

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
                        Translate
                    </div>

                </div>

                <div class='row'>

                    <div class='col-sm-4'>
                    </div>

                    <div id='navbar' class='row col-sm-8'>

                        <div class='col-sm-2'>
                            <strong>
                                Home
                            </strong>
                        </div>
                        <div class='col-sm-2'>
                            <strong>
                                Creators
                            </strong>
                        </div>
                        <div class='col-sm-2'>
                            <strong>
                                Listen
                            </strong>
                        </div>
                        <div class='col-sm-2'>
                            <strong>
                                Poems
                            </strong>
                        </div>
                        <div class='col-sm-2'>
                            <strong>
                                Write
                            </strong>
                        </div>
                        <div class='col-sm-2'>
                            <strong>
                                Documents
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
                                contact
                            </h4>
                        </span>
                    </div>
                    <div class='col-sm-5'>
                </div>

            </footer>

        </div>
    </body>
</html>
