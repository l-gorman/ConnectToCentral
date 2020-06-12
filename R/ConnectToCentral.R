####----------------------------------------------------------------------------------------------------
####----------------------------------------------------------------------------------------------------
#' Retrieve ODK Central API Token
#'
#' To connect to ODK Central users must retrieve a token. To use this function, you will need:
#' 1. An ODK Central server (Here are instructions to
#' set up ODK Central: https://docs.getodk.org/central-setup/)
#' 2. An account on the server (you will have to register with an email and a password)
#'
#' In order to keep your credential safe, it is recommended that you save your username and
#' password as "environment variables".
#'
#' @param central_url The url which pounts to an ODK Central sever
#' @param central_email The email linked to your odk central account
#' @param central_password The password used for your central account
#'
#' @return This function will return a token. This token is useful for
#'
#' @examples
#' my_central_url <- "https://myrandomurl.com"
#' my_central_email <- Sys.getenv("odk_username")
#' my_central_password <- Sys.getenv("odk_password")
#'
#' token<-GetEmailToken(central_url=my_central_url,
#'                      central_email = my_central_email,
#'                      central_password = my_central_password)
#'
#'@importFrom httr "POST" "handle" "add_headers" "content"
#'@export
GetEmailToken<-function(central_url, central_email, central_password){

  data_for_request<-list(email = central_email, password = central_password)
  h<-handle(central_url) # Passing a handle with the request allows for the use of cookies. Facilitating multiple requests.
  central_response <- POST(url = paste0(central_url, "/v1/sessions"),
                           body = data_for_request,
                           encode = "json",
                           add_headers("Content" = "application/json"),
                           handle=h
                          )

  central_response_content<-content(central_response)
  token<-central_response_content$token

  if (is.null(token)){
    stop("Unable to return token.\n
         Please check the credentials you provided are correct by going to your URL and logging in."
         )
  }
  return(token)
}
####----------------------------------------------------------------------------------------------------
#' List the Users listed on an ODK Central Server
#'
#' ODK Central has a "Users" and "AppUsers". Users can be assigned roles, such as project manager.
#' To become a user you will need to contact the server administrator.
#' In order for this function to work, you will need to get a connection token. See example below
#'
#'@param central_url The url which pounts to an ODK Central sever
#'@param email_token The email linked to your odk central account
#'@return This will return a list of Users on the desired ODK central server.
#'
#'@examples
#' my_central_url <- "https://myrandomurl.com"
#' my_central_email <- Sys.getenv("odk_username")
#' my_central_password <- Sys.getenv("odk_password")
#'
#' my_token <- GetEmailToken(central_url = my_central_url,
#'                      central_email = my_central_email,
#'                      central_password = my_central_password)
#'
#' my_list_of_users <- ListUsers(central_url = my_central_url,
#'                               email_token = my_token)
#'@export
#'
ListUsers<-function(central_url, email_token){

}
####----------------------------------------------------------------------------------------------------
#' List the AppUsers within a given ODK Central Project
#'
#' @return
#' @export
#'
#' @examples
ListAppUsers<-function(){

}
####----------------------------------------------------------------------------------------------------
#' List the Projects on an ODK Central Server
#'
#' @return
#' @export
#'
#' @examples
ListProjects<-function(){

}
####----------------------------------------------------------------------------------------------------
#' List the Names of AppUsers within a given ODK Central Project
#'
#' @return
#' @export
#'
#' @examples
ListAppUserNames<-function(){

}
####----------------------------------------------------------------------------------------------------
#' List the Tokens of AppUsers within a given ODK Central Project
#'
#' @return
#' @export
#'
#' @examples
ListAppUserTokens<-function(){

}
####----------------------------------------------------------------------------------------------------
#' List the Tokens of AppUsers within a given ODK Central Project
#'
#' @return
#' @export
#'
#' @examples
ListAppUserTokens<-function(){

}
####----------------------------------------------------------------------------------------------------
#' Generate AppUser URL
#'
#' @return
#' @export
#'
#' @examples
GetAppUserURL<-function(){

}
####----------------------------------------------------------------------------------------------------
#' Generate AppUser QR Code
#'
#' @return
#' @export
#'
#' @examples
GetAppUserQRCode<-function(){

}
####----------------------------------------------------------------------------------------------------







