{-# LANGUAGE OverloadedStrings, TypeFamilies, QuasiQuotes,
             TemplateHaskell, GADTs, FlexibleInstances,
             MultiParamTypeClasses, DeriveDataTypeable,
             GeneralizedNewtypeDeriving, ViewPatterns, EmptyDataDecls #-}
import Yesod
import Database.Persist.Postgresql
import Data.Text
import Control.Monad.Logger (runStdoutLoggingT)

data Pagina = Pagina{connPool :: ConnectionPool}

instance Yesod Pagina

share [mkPersist sqlSettings, mkMigrate "migrateAll"] [persistLowerCase|
Clientes json
   nome Text
   valor Double
   deriving Show
|]

mkYesod "Pagina" [parseRoutes|
/ HomeR GET 
/prod UserR GET POST
/prod/check/#ClientesId CheckR GET
/prod/update/#ClientesId UpdateR PUT
/prod/delete/#ClientesId DeleteR DELETE
|]

instance YesodPersist Pagina where
   type YesodPersistBackend Pagina = SqlBackend
   runDB f = do
       master <- getYesod
       let pool = connPool master
       runSqlPool f pool
------------------------------------------------------

getUserR :: Handler Html
getUserR = defaultLayout $ do
  addScriptRemote "https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"
  [whamlet| 
    <form>
        Nome: <input type="text" id="usuario">
        Valor: <input type="text" id="valor">
    <button #btn> OK
  |]  
  toWidget [julius|
     $(main);
     function main(){
         $("#btn").click(function(){
             $.ajax({
                 contentType: "application/json",
                 url: "@{UserR}",
                 type: "POST",
                 data: JSON.stringify({"nome":$("#usuario").val(),"valor":parseFloat($("#valor").val())}),
                 success: function(data) {
                     alert(data.resp);
                     $("#usuario").val("");
                     $("#valor").val("");
                 }
            })
         });
     }
  |]

postUserR :: Handler ()
postUserR = do
    clientes <- requireJsonBody :: Handler Clientes
    runDB $ insert clientes
    sendResponse (object [pack "resp" .= pack "CREATED"])
    -- Linha 60: Le o json {nome:"Teste"} e converte para
    -- Cliente "Teste". O comando runDB $ insert (Clientes "Teste")
    -- {resp:"CREATED"}
getHomeR :: Handler Html
getHomeR = defaultLayout $ [whamlet| 
    <h1> Ola Mundo
|] 

getCheckR :: ClientesId -> Handler ()
getCheckR pid = do
    cli <- runDB $ get404 pid
    sendResponse $ toJSON cli  

putUpdateR :: ClientesId -> Handler ()
putUpdateR pid = do
    cli <- requireJsonBody :: Handler Clientes
    runDB $ update pid [ClientesNome =. clientesNome cli]
    sendResponse (object [pack "resp" .= pack "UPDATED"])    

deleteDeleteR :: ClientesId -> Handler ()
deleteDeleteR pid = do
    runDB $ delete pid 
    sendResponse (object [pack "resp" .= pack "DELETED"]) 

connStr = "dbname=d91046tn78028p host=ec2-23-21-167-174.compute-1.amazonaws.com user=vtcxrynhkahutd password=y5PbW5KAo3ZOHAt9bkkbYGvjeZ port=5432"

main::IO()
main = runStdoutLoggingT $ withPostgresqlPool connStr 10 $ \pool -> liftIO $ do 
       runSqlPersistMPool (runMigration migrateAll) pool
       warp 8080 (Pagina pool)


