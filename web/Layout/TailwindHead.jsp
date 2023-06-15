<%-- Document : tailwindHead Created on : Jun 3, 2023, 3:37:19 PM Author : trong --%>

    <%@page contentType="text/html" pageEncoding="UTF-8" %>

        <head>
            <meta charset="UTF-8">
            <link rel="stylesheet" href="styles/login.css" />
            <link rel="stylesheet" href="styles/homepage.css" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
            <link rel="stylesheet" href="styles/tailwind.css" />
            <script src="https://cdn.tailwindcss.com"></script>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.5/flowbite.min.css" rel="stylesheet" />
            <script>
                tailwind.config = {
                    theme: {
                        extends: {

                            colors: {
                                gray: colors.coolGray,
                                blue: colors.lightBlue,
                                red: colors.rose,
                                pink: colors.fuchsia,
                            },
                        }
                    }
                }
            </script>
        </head>