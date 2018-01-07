#include "query.h"
#include <QDebug>

QSqlDatabase db = QSqlDatabase::addDatabase("QMYSQL");
int Query::userId = -1;

Query::Query(QObject *parent) : QObject(parent)
{
    query = new QSqlQuery;

    db.setHostName("");
    db.setDatabaseName("idoccar");
    db.setUserName("");
    db.setPassword("");
    db.open();
}

void Query::printMessage(QString txt)
{
    qDebug() << "Message from QML: " << txt;
}

bool Query::testMessage(QString txt)
{
    qDebug() << "Message from QML: " << txt;
    return true;
}

bool Query::isOpen()
{
    if(db.isOpen())
    {
        return true;
    }
    else
        return false;
}

bool Query::isUser(QString login, QString password)
{
    query->prepare("SELECT * FROM users WHERE LOGIN = :login AND PASS = :password");
    query->bindValue(0,login);
    query->bindValue(1,password);
    query->exec();
    if(query->next())
    {
        query->prepare("SELECT users.id FROM users WHERE LOGIN =:login");
        query->bindValue(0,login);
        query->exec();
        query->first();
        userId = query->value(0).toInt();
        return true;
    }
    else
        return false;
}
